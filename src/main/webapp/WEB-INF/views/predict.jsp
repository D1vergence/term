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

                <input id="fno" name="language" placeholder="航班" type="text">
                <input id="ptype" name="language" placeholder="机型" type="text">
                <input id="arrival" name="language" placeholder="目的地" type="text">
                <input id="weather" name="language" placeholder="天气" type="text">

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
                    var value = d[i];
                    var opt = "<option value='" + value + "'>" + value + "</option>";
                    $("#fno").append(opt);
                    $("#fno").autocomplete({data});
                }
            }
        });
    }

    function get_ptype(){
        $.ajax({
            type: "post",
            url: 'getPtype',
            dataType: "json",
            success: function (data) {
                var d = eval("(" + data + ")");
                for (var i = 0; i < d.length; i++) {
                    var value = d[i];
                    var opt = "<option value='" + value + "'>" + text + "</option>";
                    $("#ptype").append(opt);
                    $("#ptype").autocomplete({data});
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
                    var value = d[i];
                    var opt = "<option value='" + value + "'>" + text + "</option>";
                    $("#arrival").append(opt);
                    $("#arrival").autocomplete({data});
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
                    var value = d[i];
                    var opt = "<option value='" + value + "'>" + text + "</option>";
                    $("#weather").append(opt);
                    $("#weather").autocomplete({data});
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
