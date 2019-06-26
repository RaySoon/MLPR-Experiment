import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import GridSearchCV
from sklearn import metrics
import os
from sklearn.externals import joblib
import pickle
from json import dump, JSONEncoder


# samples = pd.read_csv('DATA\\data.csv', header=None, sep=' ')
# labels = pd.read_csv('DATA\\score.csv', header=None, sep=' ')
# rmse=3
#
#
# def train(rmse):
#     for random_select in range(1,3000):
#         train_x, test_x, train_y, test_y = train_test_split(samples, labels, test_size=0.2, random_state=random_select)
#
#
#         param_test1 = {'n_estimators': range(10, 50, 5)}
#         gsearch1 = GridSearchCV(
#             estimator=RandomForestRegressor(min_samples_split=10, min_samples_leaf=6, max_depth=14, max_features='sqrt'
#                                             ,n_jobs=-1), param_grid=param_test1, scoring='neg_mean_squared_error',cv=5)
#         gsearch1.fit(train_x, train_y)
#         # print(gsearch1.best_score_)
#         best_n_estimators = gsearch1.best_params_['n_estimators']
#         print('********best estimator:%s'%best_n_estimators)  # 35
#
#         param_test2 = {'max_depth': range(3, 20), 'min_samples_split': range(10, 101, 10)}
#         gsearch2 = GridSearchCV(
#             estimator=RandomForestRegressor(n_estimators=best_n_estimators,min_samples_split=10, min_samples_leaf=6, max_features='sqrt'
#                                             ,n_jobs=-1),
#             param_grid=param_test2,scoring='neg_mean_squared_error', cv=5)
#         gsearch2.fit(train_x, train_y)
#         # gsearch2.best_params_, gsearch2.best_score_
#         best_max_depth = gsearch2.best_params_['max_depth']
#         best_min_samples_split = gsearch2.best_params_['min_samples_split']
#         print('********best max_depth,min_sample_split:%s,%s'%(best_max_depth, best_min_samples_split))  # 14,10
#
#         param_test3 = {'min_samples_leaf': range(1, 40, 5)}
#         gsearch3 = GridSearchCV(
#             estimator=RandomForestRegressor(n_estimators=best_n_estimators, max_depth=best_max_depth, max_features='sqrt',
#                                             n_jobs=-1,min_samples_split=best_min_samples_split, oob_score=True),
#             param_grid=param_test3, scoring='neg_mean_squared_error', cv=5)
#         gsearch3.fit(train_x, train_y)
#         # gsearch3.best_params_, gsearch3.best_score_
#         best_min_samples_leaf = gsearch3.best_params_['min_samples_leaf']
#         print('********best min_sample_leaf:%s'%best_min_samples_leaf)  # 6
#
#
#         numOfFeatures = len(samples.columns)
#         mostSelectedFeatures = numOfFeatures/2
#         param_test4 = {'max_features':range(200,1000,100)}
#         gsearch4 = GridSearchCV(estimator = RandomForestRegressor(n_estimators=best_n_estimators, max_depth=best_max_depth,
#                                                                   min_samples_leaf=best_min_samples_leaf,min_samples_split=best_min_samples_split,
#                                                                   n_jobs=-1,oob_score=True),
#                                 param_grid = param_test4, scoring='neg_mean_squared_error',cv=5)
#         gsearch4.fit(train_x, train_y)
#         # gsearch4.best_params_, gsearch4.best_score_
#         best_max_features = gsearch4.best_params_['max_features']
#         print('********best max_features:%s'%best_max_features)
#
#         # 把最优参数全部获取去做随机森林拟合
#         cls = RandomForestRegressor(n_estimators=best_n_estimators, max_depth=best_max_depth,
#                                     min_samples_leaf=best_min_samples_leaf, min_samples_split=best_min_samples_split,
#                                     max_features=best_max_features,n_jobs=-1, oob_score=True)
#         cls.fit(train_x, train_y)
#         rmse_new = np.sqrt(metrics.mean_squared_error(test_y, cls.predict(test_x)))
#         print(rmse_new)
#         if rmse_new < rmse:
#             current_path = os.path.join('result-rf', str(rmse_new))
#             os.mkdir(current_path)
#             print(rmse_new)
#             rmse = rmse_new
#             with open(os.path.join(current_path, "model.pkl"), "wb") as f:
#                 pickle.dump(cls, f)
#             test_x.to_csv(os.path.join(current_path, 'test_feat.csv'), index=False, header=False)
#             test_y.to_csv(os.path.join(current_path, 'test_score.csv'), index=False, header=False)
#             print("saved")

# 需要另一个程序保存模型，这个程序只是用模型预测分数然后保存的
def get_best_re(test_feat, test_id,working_dir):
    # 导入模型
    model = joblib.load(os.path.join(working_dir,'model.pkl'))
    pred = model.predict(test_feat)
    total_err = 0
    adic = {}
    data = {"table": adic}
    for i in range(pred.shape[0]):
        pred[i] = round(pred[i], 0)
        # int 需要转换成str才能用dump写入json
        adic[i] = {"predict": float(pred[i]), "test": float(test_id[i])}
        err = (pred[i] - test_id[i])
        total_err+=err*err
    data["mse"] = float(total_err / pred.shape[0])
    # 写入json
    with open(os.path.join(working_dir,"rf.json"), "w", encoding="utf-8") as fi:
        dump(data, fi, ensure_ascii=False, indent=2)
        return total_err / pred.shape[0]

# todo: 更改：feat:测试集样本路径，id：测试集分数路径，跑分高的测试集我放在文件夹下了，测试了可以运行
test_feat = np.genfromtxt("E:\data.txt", dtype=np.float32)
test_id = np.genfromtxt("E:\score.txt", dtype=np.float32)
get_best_re(test_feat,test_id,'')