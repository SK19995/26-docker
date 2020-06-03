#!/usr/bin/env python
# -*- coding: utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding("utf-8")
import requests
from bs4 import BeautifulSoup


print("----基本业务检测----")
interface = ['https://www.baidu.com']
names = ['confluence']

yes = "接口正常"
no = "接口异常"
bed = "接口访问失败"
err = "错误信息"


def xcx_check():
    num = 0
    j= 0
    while num < 1:
        try:
            res=requests.get(interface[num])
            res_id = res.status_code
            if res_id==200:
                res_text = res.text
                soup = BeautifulSoup(res_text, 'html.parser')
                spans = soup.select('h1')
                if spans:
                    for aa in spans:
                        h1_text = int(aa.text.strip())
                        print(names[j] + no + err + str(h1_text))
                else:
                    print(names[j] + yes)
            else:
                print(names[j] + bed + str(res_id))

        except:
            print(names[j]+'出错')

        num += 1
        j += 1

xcx_check()


