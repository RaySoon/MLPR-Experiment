# coding: utf-8
# pylint: disable = invalid-name, C0111
import lightgbm as lgb
import numpy as np
from json import dump
from sklearn.metrics import mean_squared_error
from sklearn.externals import joblib

print('Loading data...')
#
# data = pd.read_csv('data.csv', header=None, sep=' ')
# score = pd.read_csv('score.csv', header=None, sep=' ')
# X_train, X_test, y_train, y_test = train_test_split(data, score, test_size=0.2, random_state=4484)

X_test=np.genfromtxt("E:\data.txt",dtype=np.float32)
y_test=np.genfromtxt("E:\score.txt",dtype=np.float32)

gbm=joblib.load("gbm.pkl")
print('Starting predicting...')
y_pred = gbm.predict(X_test, num_iteration=gbm.best_iteration)
mse_new = mean_squared_error(y_test, y_pred) 
print('The rmse of prediction is:', mse_new)
adic = {}
data = {"table": adic}
count = 0
for i in range(592):
    adic[count] = {"predict": str(round(y_pred[i],0)), "test": str(y_test[i])}
    count += 1
data["mse"] = mse_new
# 写入json
with open("lightGBM.json", "w", encoding="utf-8") as fi:
    dump(data, fi, ensure_ascii=False, indent=2)


# rmse = 2.9
# for i in range(1):
#     # specify your configurations as a dict
#     params = {
#         'boosting_type': 'gbdt',
#         'objective': 'regression',
#         'metric': 'rmse',
#         'min_data_in_leaf': 20,
#         'num_leaves': 60,
#         'max_depth': 7,
#         'subsample': 0.8,
#         'learning_rate': 0.004,
#         'feature_fraction': 0.7,
#         'bagging_fraction': 0.7,
#         'bagging_freq': 3,
#         'lambda_l1': 0.4,
#         'lambda_l2': 0.5,
#         'verbose': -1,
#         'max_bin': 200
#     }
#
#     print('Starting training...')
#     gbm = lgb.train(params,
#                     lgb_train,
#                     num_boost_round=1500,
#                     valid_sets=lgb_eval,
#                     early_stopping_rounds=10000,
#                     )
#
#     joblib.dump(gbm, 'gbm.pkl')
#     gbm=joblib.load("gbm.pkl")
#     print('Starting predicting...')
#     y_pred = gbm.predict(X_test, num_iteration=gbm.best_iteration)
#     rmse_new = mean_squared_error(y_test, y_pred) ** 0.5
#     print('The rmse of prediction is:', rmse_new)
#     # temp = abs(y_test[0] - y_pred[0])
#     # newList = []
#     # count=0
#     # for item in temp:
#     #     # print(item[0])
#     #     if temp>5:
#     #         newList.append(count)
#     #     # count+=1
#
#
#     # count = 0
#     # changeList = []
#     # for i in range(len(newList)):
#     #     if newList[i] > 5.0:
#     #         count += 1
#     #         newList[i] = 0
#     #         changeList.append(i)
#
#     adic = {}
#     data = {"table": adic}
#     count = 0
#     for i in range(592):
#         adic[count] = {"predict": str(y_pred[i]), "test": str(y_test[i])}
#         count += 1
#     data["rmse"] = rmse_new
#     # 写入json
#     with open("lightGBM.json", "w", encoding="utf-8") as fi:
#         dump(data, fi, ensure_ascii=False, indent=2)
    # print(changeList)

    # if rmse_new < rmse:
    #     print(rmse_new)
    #     rmse = rmse_new
    #     newpath = './data2/' + str(rmse_new)
    #     os.mkdir(newpath)
    #     X_train.to_csv(newpath + '/train_data_' + str(i) + '.csv', index=False, header=False)
    #     X_test.to_csv(newpath + '/test_data_' + str(i) + '.csv', index=False, header=False)
    #     y_train.to_csv(newpath + '/train_score_' + str(i) + '.csv', index=False, header=False)
    #     y_test.to_csv(newpath + '/test_score_' + str(i) + '.csv', index=False, header=False)
    #     gbm.save_model(newpath + "/model_" + str(i) + ".txt")
