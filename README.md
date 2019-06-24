# lanaya# -*- coding: UTF-8 -*-
import requests
import parsel

def xiubai():
    url='http://www.4399.com/flash_fl/6_1.htm'#网页代号
    res = requests.get(url)#打开网页
    res.encoding=res.apparent_encoding#转换字符
    html = res.text #F12内容代号
    # print(html)#输出F12内容测试
    sel = parsel.Selector(html)#导入库,类
    content1 = sel.xpath('//li[@class="monthsmall"]/a/text()').getall() #xpath格式,从网页中提取对应内容
    nub = 1
    for a in (content1):
        print("第%s名:"%nub,a)
        nub += 1
if __name__ == "__main__":
    xiubai()#执行
