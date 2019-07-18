import requests
import random
from xml.dom import minidom
from xml.dom.minidom import parse,parseString
res = requests.get('http://flash.weather.com.cn/wmaps/xml/xianyang.xml')
res.encoding = 'utf-8'
# print(res.text)

#dom=minidom.parse(res.text)
dom=parseString(res.text)
root=dom.documentElement
sight=random.random()*100
we=0
# 节点名称
cities = root.getElementsByTagName("city")
for city in cities:
	if city.getAttribute("cityname")=="咸阳市":
		temp=city.getAttribute("temNow")
		weather=city.getAttribute("stateDetailed")
		st=city.getAttribute("state1")
		if city.getAttribute("state1")!=city.getAttribute("state2"):
			weather=weather[:weather.find('转')]

# 无0|轻雾1|雾2|尘3|霾4|沙5|雪6|雷暴7
if weather.find('雾')!=-1 :
	we = 2
	sight = sight<32
if weather.find('轻雾')!=-1 :
	we = 1
	sight = sight<54
if weather.find('尘')!=-1 :
	we = 3
	sight = sight<54
if weather.find('霾')!=-1 :
	we = 4
	sight = sight<60
if weather.find('沙')!=-1 :
	we = 5
	sight = sight<49
if weather.find('雪')!=-1 :
	we = 6
	sight = sight<21
if weather.find('雷暴')!=-1 or weather.find('暴雨')!=-1 :
	we = 7
	sight = sight<0
if we == 0:
	if weather.find('雨')!=-1 :
		sight = sight < 35
	else :
		sight = sight < 80

if sight :
	sight = 1
else:
	sight = 0
print(temp,we,sight)
