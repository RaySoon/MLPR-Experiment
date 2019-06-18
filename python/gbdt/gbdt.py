import numpy as np
from sklearn.ensemble import GradientBoostingRegressor
from selenium import webdriver
from time import time,sleep
from bs4 import BeautifulSoup
import copy
from json import dump,JSONEncoder
import selenium.common.exceptions
import sys
from sklearn.externals import joblib


#需要另一个程序保存模型，这个程序只是用模型预测分数然后保存的
def get_best_re(test_feat,test_id):
#导入模型
	gbdt = joblib.load('gbdt.pkl')
	pred=gbdt.predict(test_feat)
	total_err=0
	
	mse={}
	alist=[]
	table={"table":alist}
	relist=[table,mse]
	for i in range(pred.shape[0]):
		pred[i]=round(pred[i],0)
		# print(pred[i],test_id[i])
		#int 需要转换成str才能用dump写入json
		alist.append({"pre?dict":pred[i],"test":str(test_id[i])})
		err = (pred[i] - test_id[i])
		total_err+=err*err
	mse["mse"] =total_err/pred.shape[0]
		
	#写入json
	with open("gbdt.json", "w", encoding="utf-8") as fi:
		dump(relist, fi, ensure_ascii=False, indent=2)
	return total_err/pred.shape[0]

if __name__ == '__main__':
    test_feat = np.genfromtxt("E:\\t1.txt", dtype=np.float32)
    test_id = np.genfromtxt("test_score.txt", dtype=np.float32)
    get_best_re(test_feat,test_id)
