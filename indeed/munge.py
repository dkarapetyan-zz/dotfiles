# coding=utf-8
import pandas as pd
from sklearn.preprocessing.label import LabelEncoder
from model_config import model_config
import sklearn.ensemble
import ipdb
import re

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


# make sure we are only using jobIds for which data exists in both
# test and training

# temp = train_features.merge(train_salaries, on='jobId')
# ipdb.set_trace()
# covariate_train = temp.merge(test_features, on='jobId')

# above gives an empty dataframe--upon closer inspection, jobids look like they
# do line up, except there is a typo--7th digit varies by +1
# To verify this, we run
def extract_num(string):
    return int(re.findall(r'\d+', string)[0])


(train_features.jobId.apply(extract_num)
 - test_features.jobId.apply(extract_num).unique())

# indeed, our intuition was correct. Now, we merge by the 'true' jobid

temp = train_features.merge(train_salaries, on='jobId')
covariate_train = temp.join(test_features.drop('jobId', axis=1), how='outer',
                            lsuffix='_x', rsuffix='_y')
covar_train_clean = munger(covariate_train)

# now, we must encode the training features and test features in identical
# fashion
# now, we identify all the features we wish to encode
# now, we need to use the label encoder for the string categoricals.
# unfortunately, Pipeline in pandas has a bug/nonimplemented features for label
# encoding https://github.com/scikit-learn/scikit-learn/issues/3112
# so, we will do things manually

cols_x = ['companyId_x', 'jobType_x', 'degree_x', 'major_x', 'industry_x']
cols_y = ['companyId_y', 'jobType_y', 'degree_y', 'major_y', 'industry_y']
encoded_train_features = covar_train_clean.loc[:, cols_x]
encoded_test_features = covar_train_clean.loc[:, cols_y]
for col_x, col_y in zip(cols_x, cols_y):
    le = LabelEncoder().fit(encoded_train_features.loc[:, col_x])
    encoded_train_features.loc[:, col_x] = le.transform(
            encoded_train_features.loc[:, col_x])
    encoded_test_features.loc[:, col_y] = le.transform(
            encoded_test_features.loc[:, col_y])

# create master encoded df of data to slice and feed to bits to random forest
master_df = covar_train_clean
master_df[cols_x] = encoded_train_features
master_df[cols_y] = encoded_train_features
ipdb.set_trace()

train_cols = ['companyId_x', 'jobType_x', 'degree_x', 'major_x', 'industry_x',
              'yearsExperience_x', 'milesFromMetropolis_x']

test_cols = ['companyId_y', 'jobType_y', 'degree_y', 'major_y', 'industry_y',
             'yearsExperience_y', 'milesFromMetropolis_y']

train_features_prep = master_df.loc[:, train_cols]
test_features_prep = master_df.loc[:, test_cols]

# Model Definition Part ############

# have a configuration, so we can try out different random forests
# and get a feel for which parameters are best for this problem

params = model_config["rfr"]["params"]
rforest = sklearn.ensemble.RandomForestRegressor(**params)
fit = rforest.fit(train_features_prep, master_df.salary)

# random forest goodness
prediction = fit.predict(test_features_prep)
feature_importances = fit.feature_importances_,
score = fit.oob_score_

# jobs ids, with forecasted salaries
test_salaries = pd.DataFrame()
test_salaries['jobId'] = covar_train_clean['jobId']
test_salaries['salary'] = prediction
ipdb.set_trace()
test_salaries.to_csv("./test_salaries")
