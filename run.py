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
#words cannot describe how much shame I feel

def main(targets):
    global test_flag
    if 'data' in targets:
        HW1.main()
    if 'test-project' in targets:
        test_flag = 1
        sample_size, categories = HW2.loadConfig("config/test-params.json")
        #HW2.getTestData(categories, sample_size)
        smalis = HW2.prepare_data(test_flag)
        df, xy  = HW2.makeDF(smalis)
        #train_df, train_y, test_df, test_y = HW2.splitTrain(df, xy)

        A_train = HW2.makeA(df)
        P_train = HW2.makeP(df)



        AAT_train = A_train.dot(A_train.T)#HW2.matrixply([A_train, A_train.T])
        y = [i[1] for i in xy]
        print(y)
        clf = HW2.trainModel(AAT_train, y)
        preds = HW2.modelPredict(clf, AAT_train)
        HW2.getMetrics(y, preds)



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
