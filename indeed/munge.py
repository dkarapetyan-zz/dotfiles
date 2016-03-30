# coding=utf-8
import pandas as pd
from sklearn.preprocessing.label import LabelBinarizer
from model_config import model_config
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import LabelBinarizer
from sklearn.ensemble import RandomForestRegressor

__author__ = 'David Karapetyan'


################# Munging Part #################

# munging doesn't need to be too extensive starting out/exploring,
# since we are using a random forest. Outliers don't have much effect
# on random forest fitting or prediction, relative to other models
# Same goes for useless features--see features_importances below

def munger(frame):
    temp = frame.drop_duplicates()
    final_dframe = temp.dropna()
    return final_dframe


train_features = pd.read_csv(
    "csvs/train_features_2013-03-07.csv")
train_salaries = pd.read_csv("csvs/train_salaries_2013-03-07.csv")
test_features = pd.read_csv("csvs/test_features_2013-03-07.csv")

# random forest only works with numeric data in scikitlearn, so need
# to encode training labels as floats

covariate_train = train_features.merge(train_salaries, on='jobId')
covar = covariate_train.merge(test_features, on='jobId')
covar_clean = munger(covariate_train)
############# Model Definition Part ############

# have a configuration, so we can try out different random forests
# and get a feel for which paramters are best for this problem



params = model_config["rfr"]["params"]
# rforest = sklearn.ensemble.RandomForestRegressor(**params)
# fit = rforest.fit(train_features, train_salaries.salary)

estimator = Pipeline([("encoder", LabelBinarizer()),
                      ("forest", RandomForestRegressor(**params))])
############# random forest goodness ############
fit = estimator.fit(train_features, train_salaries.salary)
prediction = fit.predict(test_features)
feature_importances = fit.feature_importances_,
score = fit.oob_score_
