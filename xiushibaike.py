# -*- coding: UTF-8 -*-
import requests
import parsel

def xiubai():
    url='https://www.qiushibaike.com/text/'#网页代号
    res = requests.get(url)#打开网页
    res.encoding="utf-8"#转换字符
    html = res.text #F12内容代号
    # print(html)#输出F12内容测试
    sel = parsel.Selector(html)#导入库,类
    content1 = sel.xpath('//div[@class="content"]/span/text()').getall() #xpath格式,从网页中提取对应内容
    content2 = sel.xpath('//i[@class="number"]/text()').getall() #xpath格式,从网页中提取对应内容
    for a,b in zip(content1,content2):
        print(a,"好笑数量:",b)

if __name__ == "__main__":
    xiubai()#执行
