import xgboost as xgb
from xgboost import XGBRegressor
# from numpy import loadtxt
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
from sklearn.model_selection import GridSearchCV
import numpy as np
import pandas as pd
import sklearn
import os
import math
from sklearn.externals import joblib
import pickle
from json import dump, JSONEncoder
# 载入数据集

print('Loading data...')


# print(score)
rmse = 4

# 需要另一个程序保存模型，这个程序只是用模型预测分数然后保存的
def get_best_re(test_feat, test_id,working_dir):
    # 导入模型
    model = xgb.Booster(model_file=os.path.join(working_dir,'xgb.model'))
    test_mat=xgb.DMatrix(test_feat)
    pred = model.predict(test_mat)

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
    with open(os.path.join(working_dir,"xgb.json"), "w", encoding="utf-8") as fi:
        dump(data, fi, ensure_ascii=False, indent=2)
        return total_err / pred.shape[0]
def train():
    data = pd.read_csv('DATA\\data.csv', header=None, sep=' ')
    score = pd.read_csv('DATA\\score.csv', header=None, sep=' ')
    param_test1 = {
        'max_depth': [i for i in range(20, 30)],
        'learning_rate': [0.05 * i for i in range(1, 10)],
        'min_child_weight':[0.25*i for i in range(1,10)],
        'subsample':[0.5+0.05*i for i in range(10)],
        'gamma':[0.002*i for i in range(50)],
        'colsample_bytree':[0.5+0.02*i for i in range(25)]

    }
    for iters in range(1):
        x_train, x_test, y_train, y_test = train_test_split(data, score, test_size=0.2, random_state=0)
        print('Starting training...')
        count=0
        for depth in param_test1['max_depth']:
            for learning_r in param_test1['learning_rate']:
                # for min_child_weigh in param_test1['min_child_weight']:
                    for sub_sample in param_test1["subsample"]:
                        # for gammas in param_test1["gamma"]:
                            for colsample in param_test1[ 'colsample_bytree']:
                                try:
                                    xgb1 = XGBRegressor(learning_rate=learning_r,
                                                        max_depth=depth,
                                                        # min_child_weight=min_child_weigh,
                                                        subsample=sub_sample,
                                                        colsample_bytree=colsample,
                                                        # gamma=gammas,
                                                        eval_metric='rmse',
                                                        nthread=4,
                                                        # scale_pos_weight=1,
                                                        n_estimators=1500)
                                    xgb1.fit(x_train, y_train)
                                    y_pred =xgb1.predict(x_test)
                                    # predictions = [round(value,2) for value in y_pred]
                                    # 计算rmse
                                    rmse_new=math.sqrt(sklearn.metrics.mean_squared_error(y_test,y_pred))
                                    print(rmse_new)
                                    if rmse_new < rmse :
                                        current_path=os.path.join('result-xgboost',str(rmse))
                                        os.mkdir(current_path)
                                        print(rmse_new)
                                        rmse = rmse_new
                                        x_test.to_csv(os.path.join(current_path,'test_feat.csv'), index=False, header=False)
                                        y_test.to_csv(os.path.join(current_path,'test_score.csv'), index=False, header=False)
                                        xgb1.get_booster().save_model(os.path.join(current_path,'xgb.model'))
                                        print("saved")
                                        count+=1
                                except:
                                    continue
                            # exit(1)


if __name__ == '__main__':
    test_feat = np.genfromtxt("E:\data.txt", dtype=np.float32)  #测试集-样本
    test_id = np.genfromtxt("E:\score.txt", dtype=np.float32)  # 测试集-分数
    model_path='E:\MLPR-Experiment\python\XGBoost'
    get_best_re(test_feat,test_id,model_path)

#     train_x = train_x.as_matrix()
#
#
#     MAE_(xgb1, train_x, train_y)
#     return xgb1
#
#     y_pred = gbm.predict(x_test, num_iteration=gbm.best_iteration)
#     rmse_new = mean_squared_error(y_test, y_pred) ** 0.5
#     print('The rmse of prediction is:', rmse_new)
#     if rmse_new < rmse:
#         print(rmse_new)
#         # TODO 把这个rmse_new 追加写到一个txt里面
#
#
# # 拟合XGBoost模型
# model = XGBRegressor()
# model.fit(x_train, y_train)
#
# # 对测试集做预测
# y_pred = model.predict(x_test)
# predictions = [round(value) for value in y_pred]
#
# # 评估预测结果
# accuracy = accuracy_score(y_test, predictions)
# print("Accuracy: %.2f%%" % (accuracy * 100.0))
