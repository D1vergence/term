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
							<div class="panel-heading">品类销量柱状图</div>
							<div class="panel-body">
								<div id="quantity-bar-echarts" style="width:470px;height:300px"></div>
							</div>
						</div>	
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12">
						<div class="panel panel-default">
							<div class="panel-heading">品类销量环形图</div>
							<div class="panel-body">
								<div id="quantity-doughnut-echarts" style="width:470px;height:300px"></div>
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
	var qbeChart = echarts.init(document.getElementById("quantity-bar-echarts"));
	//发起ajax请求，向后台获取数据，填充数组
	$.post("getdata.html",{},function(data){
		var jsonObj = JSON.parse(data);
		$.each(jsonObj,function(){
			types.push(this.type);
			nums.push(this.num);
			amounts.push(this.amount);
		});
		//使用数组填充图表配置项Option
		var qbeOption = {
		    xAxis: {
		        type: 'category',
		        data: types
		    },
		    yAxis: {
		        type: 'value'
		    },
		    series: [{
		        data: nums,
		        type: 'bar'
		    }]
		};
		//使用指定的配置项来设置图表，从而显示图表数据
		qbeChart.setOption(qbeOption);
	});
</script>
</html>