import re
from pathlib import Path
import os
import sys
from sklearn.tree import DecisionTreeClassifier
import random

sys.path.insert(0, 'src') # add library code to path
import HW1
import HW2

test_flag = 0

#this is my biggest regret and failure of all my years at UCSD
#nonetheless I will personally finish it anyways even after the quarter is over

#I know there is no point in late submissions but I just wanted to fix an error
#It's not much but at least in runs now
#I'll continue to add gradual updates on my github

def main(targets):
    global test_flag
    if 'data' in targets:
        HW1.main()
    if 'test-project' in targets:
 
        test_flag = 1
        sample_size, categories = HW2.loadConfig("config/test-params.json")
        paths = HW2.loadEnv("config/env.json")
        HW2.getTestData(categories, sample_size)
        smalis = HW2.prepare_data(test_flag)
        df, xy  = HW2.makeDF(smalis)
        train_df, train_y, test_df, test_y = HW2.splitTrain(df, xy)
        len(train_y)
        A_train = HW2.makeA(train_df, train_df["apps"].unique(), df.shape[0])
        P_train = HW2.makeP(train_df, df.shape[0])

        A_test = HW2.makeA(test_df, test_df["apps"].unique(), df.shape[0])
        P_test = HW2.makeP(test_df, df.shape[0])

        #y = [i[1] for i in xy]
        AAT_train = A_train.dot(A_train.T)#HW2.matrixply([A_train, A_train.T])
        AATest = A_test.dot(A_train.T)
        clf = HW2.trainModel(AAT_train, train_y)
        preds = HW2.modelPredict(clf, AATest)
        HW2.getMetrics(preds,test_y, paths["AA^T"], "AA^T")

        APAT_train = A_train.dot(P_train).dot(A_train.T)
        APATest = A_test.dot(P_test).dot(A_train.T)
        clf = HW2.trainModel(APAT_train, train_y)
        preds = HW2.modelPredict(clf, APATest)
        HW2.getMetrics(preds, test_y, paths["APA^T"], "APA^T")



    if 'process' in targets:
        #cleans and prepares the data for analysis
        #smalis = getAllSmaliFiles("Apps")
        print(test_flag)
        smalis = HW2.prepare_data(test_flag)
        
        x, y = HW2.makeBaselineFeatures(smalis)
        HW2.baseline(x, y)

    return
if __name__ == "__main__":
    targets = sys.argv[1:]
    main(targets)
