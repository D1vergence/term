import arff
import numpy
from sklearn import tree
from sklearn import neighbors
from sklearn.tree import DecisionTreeClassifier
from sklearn.neighbors import KNeighborsClassifier

from sklearn.externals import joblib

# Load data
train_file = arff.load(open('tran.txt', 'r'))
train_data = numpy.array(train_file['data'])
data_input = train_data[:,0:-1]
train_label = train_data[:,-1]
 
test_file = arff.load(open("test.txt",'r'))
test_data = numpy.array(test_file['data'])
test_input = test_data[:,0:-1]
test_label = test_data[:,-1]

# DecisionTreeClassifier 0.59
dtc = DecisionTreeClassifier(criterion='entropy',max_depth=None)
dtc.fit(data_input,train_label)
sco1 = dtc.score(test_input,test_label)
# cdx = dtc.predict_proba(test_input)
print("[fit]",sco1)

# KNeighborsClassifier 0.64
knn=neighbors.KNeighborsClassifier(n_neighbors=31,n_jobs=-1)
knn.fit(data_input,train_label)
sco3=knn.score(test_input,test_label)
print("[fit]",sco3)

joblib.dump(knn, "model.dat")

# Print
print('DecisionTreeClassifier\'s score is ',sco1)
print('KNeighborsClassifier\'s score is ', sco3)
