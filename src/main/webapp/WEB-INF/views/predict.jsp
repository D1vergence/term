<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/7/16
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    ;
    String basePathManager = basePath + "manager/";
%>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta content="" name="description" />
<meta content="webthemez" name="author" />
<title>准点预测</title>
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
            <div id="flight-predict-form" style="width:100%;height:100%">
                <span>航班</span>
                <select id="fno" class="input-text radius size-L"></select>
                <span>机型</span>
                <select id="ptype" class="input-text radius size-L"></select>
                <span>目的地</span>
                <select id="arrival" class="input-text radius size-L"></select>
                <span>天气</span>
                <select id="weather" class="input-text radius size-L"></select>
                <button id="submitbtn" type="button" class="btn btn-success btn-lg">预测</button>
            </div>
            <div id="predictresult">
                预测准点率
            </div>
        </div>
    </div>
</div>
<jsp:include page="/part/manager.js.jsp"></jsp:include>
</body>
<script type="text/javascript">

    $("#submitbtn").click(function(){
        $.post("predict",
            {
                fno:$("#fno").text(),
                ptype:$("#ptype").text(),
                arrival:$("#arrival").text(),
                weather:$("#weather").text()
            },
            function(data,status){
            $("#predictresult").html(data.acc);
        });
    });

    function get_fno(){
        $.ajax({
            type: "post",
            url: 'getFno',
            dataType: "json",
            success: function (data) {
                var d = eval("(" + data + ")");
                for(var i = 0; i < d.length; i++) {
                    var value = d[i].fno;
                    var text = d[i].fno;
                    var opt = "<option value='" + value + "'>" + text + "</option>";
                    $("#fno").append(opt);
                }
            }
        });
    }

    function get_ptype(){
        $.ajax({
            type: "post",
            url: 'getFno',
            dataType: "json",
            success: function (data) {
                var d = eval("(" + data + ")");
                for(var i = 0; i < d.length; i++) {
                    var value = d[i].ptype;
                    var text = d[i].ptype;
                    var opt = "<option value='" + value + "'>" + text + "</option>";
                    $("#ptype").append(opt);
                }
            }
        });
    }

    function get_arrival(){
        $.ajax({
            type: "post",
            url: 'getArrival',
            dataType: "json",
            success: function (data) {
                var d = eval("(" + data + ")");
                for(var i = 0; i < d.length; i++) {
                    var value = d[i].arrival;
                    var text = d[i].arrival;
                    var opt = "<option value='" + value + "'>" + text + "</option>";
                    $("#arrival").append(opt);
                }
            }
        });
    }

    function get_weather(){
        $.ajax({
            type: "post",
            url: 'getWeather',
            dataType: "json",
            success: function (data) {
                var d = eval("(" + data + ")");
                for(var i = 0; i < d.length; i++) {
                    var value = d[i].weather;
                    var text = d[i].weather;
                    var opt = "<option value='" + value + "'>" + text + "</option>";
                    $("#weather").append(opt);
                }
            }
        });
    }

    $(document).ready(function() {

        get_fno();
        get_ptype();
        get_arrival();
        get_weather();

    });
</script>
</html>
