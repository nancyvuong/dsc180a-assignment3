import requests
import gzip
import xml.etree.ElementTree as ET
import os
from bs4 import BeautifulSoup
import json
import random
import time

sample_size = 0
cats = []
website = "https://apkpure.com/sitemap.xml"
homepage = "https://apkpure.com"

def load_config(cfg):
    """
    First function to be called. Loads a config file.
    
    Input: a config.json file
    Output: sample_size just for doctesting the main reason for this function is
    to change the global variable sample_size should be the same number
    stated on the config file

    >>> load_config("config.json")
    10
    """
    global sample_size
    global cats

    with open(cfg) as config_file:
        data = json.load(config_file)
    sample_size = data["sample_size"]
    cats = data["categories"]
    return sample_size


def make_directories(categories):
    """
    Makes a folder called Apps and then populate it with sub folders for all
    app categories.
    Should pass in the list output from get_categories.

    Input: a list of app categories gotten from get_categories()
    Output: None but folders should be made
    >>> make_directories(["cats", "dogs"])
    >>> os.path.exists("Apps/cats")
    True
    >>> os.path.exists("Apps/dogs")
    True
    """
    if os.path.exists("data") == False:
        os.mkdir("data")
    for i in cats:
        if i == "malware":
            continue
        pathname = "data/" + i
        if os.path.exists(pathname) == False:
            os.mkdir(pathname)
    return

def parse_sitemap(url):
    """
    Should be the function that gets called second. 

    Input: "https://apkpure.com/sitemap.xml"
    Output: a list of download links to download xml gz files

    >>> len(parse_sitemap("https://apkpure.com/sitemap.xml"))
    7774
    """
    req = ''
    while req == '':
        try:
            req = requests.get(url)
            break
        except:
            time.sleep(5)
            continue
    webpage = str(req.content)
    lst = list(webpage.split("<loc>"))
    lst = [i for i in lst if "gz" in i]
    for i in range(len(lst)):
        idx = lst[i].index("gz") + 2
        lst[i] = lst[i][:idx]
    sub_lst = []
    for i in cats:
        sub_lst = sub_lst + [j for j in lst if i in j]
    return sub_lst

def parse_test(categories, url):
    req = ''
    while req == '':
        try:
            req = requests.get(url)
            break
        except:
            time.sleep(5)
            continue
    webpage = str(req.content)
    lst = list(webpage.split("<loc>"))
    lst = [i for i in lst if "gz" in i]
    for i in range(len(lst)):
        idx = lst[i].index("gz") + 2
        lst[i] = lst[i][:idx]
    sub_lst = []
    for i in categories:
        sub_lst = sub_lst + [j for j in lst if i in j]
    return sub_lst
def download_gz(url):
    """
    Pass in a randomly selected gz download link from output of parse_sitemap().
    Returns a filename but the main reason for this function is that it
    downloaded a gz file.

    Input: a xml.gz file download link
    Output: the name of the downloaded gzip file

    >>> download_gz('https://apkpure.com/sitemaps/art_and_design.xml.gz')
    'art_and_design.xml.gz'
    """
    filename = url.split("/")[-1]
    with open(filename, "wb") as f:
        r = requests.get(url)
        f.write(r.content)
    return filename

def get_urls_from_gz(gz_file):
    """
    Pass in the filename returned from download_gz. This function returns a list
    of all app webpages that the file contains.

    Input: a gzip file
    Output: a list containing urls to homepages of apps
    >>> len(get_urls_from_gz("art_and_design.xml.gz"))
    1003
    """
    #print(gz_file)
    tree = ET.parse(gzip.open(gz_file))
    root = tree.getroot()

    url_lst = []
    for i in range(len(root)):
        url_lst.append(root[i][0].text)
    cmd_str = "rm " + gz_file
    os.system(cmd_str)
    return url_lst

def get_categories(gz_lst):
    """
    Pass in the output of parse_sitemap().

    Input: list of links to download xml gz files
    Output: list of categories
    >>> temp = parse_sitemap("https://apkpure.com/sitemap.xml")
    >>> len(get_categories(temp))
    50
    """
    lst = []
    for i in gz_lst:
        curr = i.split("/")[-1]
        idx = curr.index(".")
        curr = curr[:idx]
        if curr[-1].isdigit() == False:
            lst.append(curr)
    return lst

def get_dl_link(url):
    """
    Pass in a randomly selected url from the output of get_urls_from_gz() 

    Input: a url to an app's webpage
    Output: a link to download the app and a filename
            if there is no download link then this function would just output an
            empty string in its place

    >>> get_dl_link('https://apkpure.com/draw-the-smps/com.andromo.dev365082.app576921')
    ('', 'draw-the-smps')

    """
    main_link = "https://apkpure.com"
    filename = url.split('/')[-2]
    webpage = requests.get(url).content
    soup = BeautifulSoup(webpage, 'html.parser')
    links_with_download = []
    for link in soup.find_all('a'):
        curr = str(link.get('href'))
        if 'download' in curr:
            links_with_download.append(curr)
    dl_link = main_link + links_with_download[1]
    dl_page = requests.get(dl_link).content
    soop = BeautifulSoup(dl_page, 'html.parser')

    flag = False
    true_dl_link = ""
    for link in soop.find_all('a'):
        curr = str(link.get('href'))
        if flag == True:
            true_dl_link = curr
            break
        if "how-to-install" in curr:
            flag = True
    return true_dl_link, filename

def download_app(url, filename):
    """
    Pass in the output of get_dl_link.
    Should not be called if the dl link returned from get_dl_link is an empty
    string.

    Input: download link of app and the name that will the name of the
    decompiled files
    Output: the filename of the decompiled files

    >>> temp = get_dl_link('https://apkpure.com/moving-gifs-for-whatsapp-%F0%9F%8E%AC/com.GifsForWhatssap.GifMaker')
    >>> download_app(temp[0], temp[1])
    'moving-gifs-for-whatsapp-%F0%9F%8E%AC.apk'
    """
    if len(filename) > 20:
        filename = filename[:10]
    fn = filename + '.apk'
    resp = requests.get(url)
    data = resp.content
    with open(fn, 'wb') as fh:
        fh.write(data)
    return fn

def get_smali(filename, dirname=None):
    """
    Pass in the output of download_app

    Input: name of apk file, and directory
    Output: 0 if successful, 256 if the decompiled files already exists or just
            not successful

    >>> get_smali("moving-gifs-for-whatsapp-%F0%9F%8E%AC.apk")
    0
    """
    if " " in filename:
        filename = filename.replace(" ", "_")
    command_string = 'java -jar apktool.jar d -r ' + filename
    val = os.system(command_string)
    filename = filename[:-4]
    if dirname != None:
        command_string = 'mv ' + filename + " " + dirname + "/" + filename
        os.system(command_string)
    os.system("rm " + filename + ".apk")
    return val

def main():
    global website
    global sample_size
    global homepage
    global cats
    load_config("config/data-params.json")
    print(cats, " in main")
    gz_list = parse_sitemap(website)
    #print(gz_list)
    make_directories(cats) 
    
    count = 0
    while count < (sample_size):
        category = cats[0]
        if count > (sample_size /2):
            category = cats[1]
        if category == 'malware':
            continue
        #random.choice(categories) #str of category
        cat_gz_lst = [i for i in gz_list if category in i] #small list of gz
        gz_link = random.choice(cat_gz_lst) #one gz
        gz_name = download_gz(gz_link) #unzipped gz

        app_urls = get_urls_from_gz(gz_name) #list of app urls
        link = ''
        app_name = ''
        while link == '' or "https://" not in link:
            app_url = random.choice(app_urls) #page of an app
            link, app_name = get_dl_link(app_url) #app_name is name of app
        apk_name = download_app(link, app_name) #app_name + .apk
        directory = "data/" + category
        get_smali(apk_name, directory)
        count = count + 1
        

if __name__ == "__main__":
    main()

