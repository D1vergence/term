<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta content="" name="description" />
<meta content="webthemez" name="author" />
<title>统计图表</title>
<jsp:include page="/part/manager.css.jsp"></jsp:include>
</head>
<body>
	<div id="wrapper">
		<!--头部：页面标题栏-->
		<jsp:include page="/part/manager.header.jsp"></jsp:include>
		<!--导航栏：页面菜单栏-->
		<jsp:include page="/part/manager.menu.jsp"></jsp:include>
		<!--表格-->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">出港月份与准点率相关图</div>
							<div class="panel-body">
								<div id="month-ontime-echarts" style="width:600px;height:300px"></div>
							</div>
						</div>	
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">出港时间与准点率相关图</div>
							<div class="panel-body">
								<div id="hour-ontime-echarts" style="width:600px;height:300px"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">品类销售额柱状图</div>
							<div class="panel-body">
								<div id="total-bar-echarts" style="width:470px;height:300px"></div>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">品类销售额环形图</div>
							<div class="panel-body">
								<div id="total-doughnut-echarts" style="width:470px;height:300px"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/part/manager.js.jsp"></jsp:include>
</body>
<script type="text/javascript">
	//初始化好X轴或图表数据的数组
	var types = new Array();
	var nums = new Array();
	var amounts = new Array();
	var moeChart = echarts.init(document.getElementById("month-ontime-echarts"));
	//发起ajax请求，向后台获取数据，填充数组
	// $.post("getdata.html",{},function(data){
	// 	var jsonObj = JSON.parse(data);
	// 	$.each(jsonObj,function(){
	// 		types.push(this.type);
	// 		nums.push(this.num);
	// 		amounts.push(this.amount);
	// 	});
		//使用数组填充图表配置项Option
		var moeOption = {
            tooltip : {
                trigger: 'axis',
                axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                    type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            toolbox: {
                feature: {
                    dataView: {show: true, readOnly: false},
                    magicType: {show: true, type: ['bar', 'bar','line']},
                    restore: {show: true},
                    saveAsImage: {show: true}
                }
            },
            legend:{
                data:['准点机数','出港机数','月平均准点率']
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '3%',
                containLabel: true
            },
            xAxis : [
                {
                    type : 'category',
                    name:'月',
                    data : ['1', '2', '3', '4', '5', '6'],
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis : [
                {
                    type : 'value',
                    name:'机数'
                },
                {
                    type : 'value',
                    name:'平均准点率'
                }
            ],
            series : [
                {
                    name:'准点机数',
                    type:'bar',
                    barWidth: '30%',
					yAxisIndex:0,
                    itemStyle:{
                        normal:{
                            color:'#4169E1' //柱子的颜色
                        }
                    },
                    data:[6245, 6848, 7992, 7717, 7984, 7646]
                },
                {
                    name:'出港机数',
                    type:'bar',
                    barWidth: '30%',
                    barGap:'0%',
                    yAxisIndex:0,
                    itemStyle:{
                        normal:{
                            color:'#9A347C'
                        }
                    },
                    data:[12547, 12490, 13242, 13284, 13807, 13347]
                },
                {
                    name:'月平均准点率',
                    type:'line',
                    yAxisIndex:1,
                    itemStyle:{
                        normal:{
                            color:'#6BD88B'    //折线颜色
                        }
                    },
                    data:[0.497728541, 0.548278623, 0.603534209, 0.58092442, 0.578257406, 0.572862816,]
                }
            ]
        };
		//使用指定的配置项来设置图表，从而显示图表数据
		moeChart.setOption(moeOption);
    var hoeChart = echarts.init(document.getElementById("hour-ontime-echarts"));
    //发起ajax请求，向后台获取数据，填充数组
    // $.post("getdata.html",{},function(data){
    // 	var jsonObj = JSON.parse(data);
    // 	$.each(jsonObj,function(){
    // 		types.push(this.type);
    // 		nums.push(this.num);
    // 		amounts.push(this.amount);
    // 	});
    //使用数组填充图表配置项Option
    var hoeOption = {
        tooltip : {
            trigger: 'axis',
            axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                type : 'shadow' // 默认为直线，可选为：'line' | 'shadow'
            }
        },
        toolbox: {
            feature: {
                dataView: {show: true, readOnly: false},
                magicType: {show: true, type: ['bar', 'bar','line']},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        legend:{
            data:['准点机数','出港机数','月平均准点率']
        },
        grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
        },
        xAxis : [
            {
                type : 'category',
                name:'时',
                data : ['0', '1', '2', '3',
                    '4', '5','6','7',
                    '8', '9','10','11',
                    '12','13', '14','15',
                    '16','17','18','19',
                    '20','21','22','23'],
                axisTick: {
                    alignWithLabel: true
                }
            }
        ],
        yAxis : [
            {
                type : 'value',
                name:'机数'
            },
            {
                type : 'value',
                name:'平均准点率'
            }
        ],
        series : [
            {
                name:'准点机数',
                type:'bar',
                barWidth: '30%',
                yAxisIndex:0,
                itemStyle:{
                    normal:{
                        color:'#88A2E7' //柱子的颜色
                    }
                },
                data:[117, 140, 120, 108,
                    1, 76, 3342, 4615,
                    3502, 2666, 2501, 2328,
                    2322, 2032, 2110, 2161,
                    2256, 2073, 2109, 2301,
                    2171, 2196, 1916, 1269]
            },
            {
                name:'出港机数',
                type:'bar',
                barWidth: '30%',
                barGap:'0%',
                yAxisIndex:0,
                itemStyle:{
                    normal:{
                        color:'#FF28FF'
                    }
                },
                data:[606, 482, 451, 221,
                    49, 95, 3920, 5868,
                    5125, 4219, 3936, 4198,
                    4520, 4303, 4371, 4221,
                    4697, 4730, 4019, 4292,
                    4159, 3924, 3740, 2581]
            },
            {
                name:'时平均准点率',
                type:'line',
                yAxisIndex:1,
                itemStyle:{
                    normal:{
                        color:'#6BD88B'    //折线颜色
                    }
                },
                data:[0.193069307, 0.290456432, 0.266075388, 0.488687783,
                    0.020408163, 0.8, 0.85255102, 0.786468984,
                    0.683317073, 0.631903295, 0.635416667, 0.554549786,
                    0.513716814, 0.472228678, 0.482727065, 0.51196399,
                    0.480306579, 0.438266385, 0.524757402, 0.5361137,
                    0.522000481, 0.559633028, 0.512299465, 0.491669895]
            }
        ]
    };
    //使用指定的配置项来设置图表，从而显示图表数据
    hoeChart.setOption(hoeOption);
</script>
</html>