from pathlib import Path
import os
import sys
from sklearn.tree import DecisionTreeClassifier
from sklearn import metrics
import HW1
import re
import random
from sklearn import svm
import pandas as pd
import json
import scipy.sparse as sp
import numpy as np
import sklearn.model_selection as model_selection


def getAllSmaliFiles(dirName):
    # create a list of file and sub directories 
    # names in the given directory 
    listOfFile = os.listdir(dirName)
    allFiles = list()
    # Iterate over all the entries
    listOfFile = listOfFile[:55] + listOfFile[:-55]
    for entry in listOfFile:
        # Create full path
        fullPath = os.path.join(dirName, entry)
        # If entry is a directory then get the list of files in this directory 
        if os.path.isdir(fullPath):
            allFiles = allFiles + getAllSmaliFiles(fullPath)
        else:
            allFiles.append(fullPath)
    allFiles = [i for i in allFiles if i.split(".")[-1] == "smali"]
    return allFiles

def prepare_data(test_flag):
    if test_flag == 1:
        return getAllSmaliFiles("testdata")
    return getAllSmaliFiles("data")

def makeDF(smalis):
    api_features = {}

    counter = 0

    apiRegex = re.compile(r'^\s+invoke.+L.+\(')
    startMethodRegex = re.compile(r'^\.method')
    block_counter = -1

    app_genre = []
    library = {}
    lib_counter = 0

    all_apps = {}
    app_counter = 0

    genre = {}
    genre_counter = 0

    for i in smalis:
        temp = i.split("/")
        app_name = temp[2]
        if app_name not in all_apps:
            all_apps[app_name] = app_counter
            app_counter+=1
        
        genre_name = temp[1]
        if genre_name not in genre:
            genre[genre_name] = genre_counter
            genre_counter += 1
        
        with open(i, 'r') as f:
            for line in f:
                start_block = startMethodRegex.search(line)
                if start_block == None:
                    api_calls = apiRegex.search(line)
                    if api_calls != None:
                        api = api_calls.group()
                        start = api.index("L")
                        api = api[start:]
                        if api not in api_features:
                            lib = api.split("->")[0]
                            if lib not in library:
                                library[lib] = lib_counter
                                lib_counter+=1
                            api_features[api] = { "apps": [], "blocks": [], "library": library[lib]}
                            
                        if all_apps[app_name] not in api_features[api]["apps"]:
                            api_features[api]["apps"].append(all_apps[app_name])
                        if block_counter not in api_features[api]["blocks"]:
                            api_features[api]["blocks"].append(block_counter)
                else:
                    block_counter += 1
        if[all_apps[app_name], genre[genre_name]] not in app_genre:
            app_genre.append([all_apps[app_name], genre[genre_name]])
    df = pd.DataFrame(api_features).T
    df = df[df.apps.map(len) > 1]
    df = df.reset_index(drop = False).rename(columns = {"index": "api"})
    df = df.reset_index(drop = False).rename(columns = {"index": "number"})
    return df, app_genre

def splitTrain(df, app_genre):
    X = [i[0] for i in app_genre]
    y = [i[1] for i in app_genre]

    X_train, X_test, y_train, y_test = model_selection.train_test_split(X, y,
    train_size=0.9, test_size=0.1,
    random_state = 0)

    exploded = df.explode("apps")
    train_df = exploded.loc[exploded["apps"].isin(X_train)]
    test_df = exploded.loc[exploded["apps"].isin(X_test)]
    return train_df, y_train, test_df, y_test

def makeA(df, app_list, num_apis):
    #api_apps = df[["number", "apps"]]
    #api_apps = df.explode("apps")
    mapper = {}
    counter = 0
    for i in app_list:
        mapper[i] = counter
        counter+=1
    A = sp.csr_matrix((len(app_list), num_apis), dtype = np.int8)
    for i in app_list:
        A[mapper[i], df.loc[df["apps"] == i]["number"]] = 1
    return A

def makeP(df, num_apis):
    P = sp.csr_matrix((num_apis, num_apis), dtype = np.int8)
    for i in df["library"].unique():
        mates = df.loc[df["library"] == i].index
        P[mates, mates] = 1
    return P

def trainModel(matrix, y):
    mat = matrix.todense()
    clf = svm.SVC(kernel = 'precomputed')

    clf.fit(mat, y)
    return clf

def modelPredict(model, matrix):
    mat = matrix.todense()
    return model.predict(mat)

def getMetrics(predictions, y, path, name): 
     cm = metrics.confusion_matrix(y, predictions)

     f = open(path, 'w')
     f.write("results to " + name + ": \n") 
     f.write("TN: " + str(cm[0][0]))
     f.write("FN: " + str(cm[1][0]))
     f.write("TP: " + str(cm[1][1]))
     f.write("FP: " + str(cm[0][1]))
     f.write("Test Accuracy: " + str( metrics.accuracy_score(y, predictions)))
     f.close()

def loadEnv(env):
    with open(env) as env_file:
        data = json.load(env_file)
    paths = data["output-paths"]
    return paths

def makeBaselineFeatures(smali_lst):
    app_features = {}
    app_genre = {}
    for i in smali_lst:
        temp = i.split("/")
        #temp[2] is the app name, temp[1] is the genre
        if temp[2] not in app_features:
            app_features[temp[2]] = {'api_calls': {}, 'lib_calls': {}, }
            app_genre[temp[2]] = temp[1]
        txt = Path(i).read_text(errors = 'ignore')
        api_calls = re.findall(r'L.+->.+\(', txt)
        for api in api_calls:
            if api not in app_features[temp[2]]['api_calls']:
                app_features[temp[2]]['api_calls'][api] = 0
            app_features[temp[2]]['api_calls'][api] += 1
            end = api.index("->")
            lib = api[:end+1]
            if lib not in app_features[temp[2]]["lib_calls"]:
                app_features[temp[2]]["lib_calls"][lib] = 0
            app_features[temp[2]]["lib_calls"][lib] += 1
    x = []
    y = []
    common_api = []
    common_lib = []
    for i in app_genre:
        y.append(i)
        api_count = list(app_features[i]["api_calls"].items())
        lib_count = list(app_features[i]["lib_calls"].items())
        
        mode_api = max(api_count, key=lambda x:x[1])[0]
        mode_lib = max(lib_count, key=lambda x:x[1])[0]
        
        if mode_api not in common_api:
            common_api.append(mode_api)
            
        if mode_lib not in common_lib:
            common_lib.append(mode_lib)
        
        api_index = common_api.index(mode_api)
        lib_index = common_lib.index(mode_lib)
        
        degree = len(app_features[i]["api_calls"])
        x.append([api_index, lib_index, degree])
    return x, y

def baseline(x, y):
    y_test = y[:1] + y[-1:]
    x_test = x[:1] + x[-1:]
    
    x_train = x[1:-1]
    y_train = y[1:-1]
    
    dtc = DecisionTreeClassifier()
    dtc.fit(x_train, y_train)
    dtc_preds = dtc.predict(x_train)
    print("Train Accuracy: ", metrics.accuracy_score(y_train, dtc_preds))
    dtc_preds = dtc.predict(x_test)
    print("Test Accuracy: ", metrics.accuracy_score(y_test, dtc_preds))
    return

def loadConfig(cfg):
    with open(cfg) as config_file:
        data = json.load(config_file)
    sample_size = data["sample_size"]
    cats = data["categories"]
    return sample_size, cats

def getTestData(cats, samp_size):
    if os.path.exists("testdata") == False:
        os.mkdir("testdata")
    for i in cats:
        if i == "malware":
            continue
        if os.path.exists("testdata/" + i) == False:
            os.mkdir("testdata/" + i)
    gz_list = HW1.parse_test(cats, "https://apkpure.com/sitemap.xml")
    count = 0
    while count < samp_size:
        category = cats[0]
        if count >= (samp_size/2):
            category = cats[1]
        if category == 'malware':
            count +=1
            continue
        cat_gz_lst = [i for i in gz_list if category in i] #small list of gz
        gz_link = random.choice(cat_gz_lst) #one gz
        gz_name = HW1.download_gz(gz_link) #unzipped gz
        #print(gz_name) 
        app_urls = HW1.get_urls_from_gz(gz_name) #list of app urls
        link = ''
        app_name = ''
        while link == '' or "https://" not in link:
            app_url = random.choice(app_urls) #page of an app
            link, app_name = HW1.get_dl_link(app_url) #app_name is name of app
        apk_name = HW1.download_app(link, app_name) #app_name + .apk
        #print(apk_name) 
        #current_direc = os.getcwd()

        if len(app_name) > 20:
            app_name = app_name[:10]
        directory = "testdata/" + category + "/" + app_name
        if os.path.exists(directory) == False:
            os.mkdir(directory)
        HW1.get_smali(apk_name)#, directory)
        os.system("mv " + app_name + "/smali " + directory)
        os.system("rm -rf " + app_name)
        count = count + 1
    return 

