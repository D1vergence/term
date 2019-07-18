from sys import argv
import os
import arff
import numpy
from sklearn.tree import DecisionTreeClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.neighbors import KNeighborsClassifier
from sklearn.externals import joblib

path=os.path.dirname(__file__)+"\\"
clf = joblib.load(path+"model.dat")
# print('LR Predict...')


syspred = [[argv[1],argv[2],argv[3],argv[4],argv[5],argv[6]]]

# print("[fit]",clf.score(test_input,test_label))
# print("[pred]",pred)
# print("[input]",syspred)
result=clf.predict_proba(syspred)
# print("[result]",result[0,0],result[0,1])
print(result[0,1])
# ['-2124880537.0' '67810.0' '2020697.0' '-6.0' '1.0' '0.0']
