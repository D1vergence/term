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
<body style="background-color: #3E3E3E">
<div id="wrapper">
    <!--头部：页面标题栏-->
    <jsp:include page="/part/manager.header.jsp"></jsp:include>
    <!--导航栏：页面菜单栏-->
    <jsp:include page="/part/manager.menu.jsp"></jsp:include>
    <!--表格-->
    <div id="page-wrapper">
        <div id="page-inner">
            <div id="flight-predict-form" style="width:100%;">
                <input id="fno" class="input-text radius size-L" placeholder="航班" type="text" style="width: 20%;">
                <br>
                <input id="ptype" class="input-text radius size-L" placeholder="机型" type="text" style="width: 20%;">
                <br>
                <input id="arrival" class="input-text radius size-L" placeholder="目的地" type="text" style="width: 20%;">
                <br>
                <input id="temperature" class="input-text radius size-L" oncopy="return false;" oncut="return false;" placeholder="温度" type="" style="width: 20%;">
                <br>
                <%--<input id="weather" class="input-text radius size-L" placeholder="气候" type="text" style="width: 20%;">--%>
                <span class="select-box radius mt-20">
				<select id="weather" class="select" size="1" name="demo2" style="width: 20%;">
					<option value="" selected="">天气</option>
					<option value="0">无</option>
					<option value="1">轻雾</option>
					<option value="2">雾</option>
					<option value="3">尘</option>
					<option value="4">霾</option>
					<option value="5">沙</option>
					<option value="6">雪</option>
					<option value="7">雷暴</option>
				</select>
				</span>
                <br>
                <%--<input id="visible" class="input-text radius size-L" placeholder="可见度" type="text" style="width: 20%;">--%>
                <span class="select-box radius mt-20">
				<select id="visible" class="select" size="1" name="demo2" style="width: 20%;">
					<option value="" selected="">可见度</option>
					<option value="0">低</option>
					<option value="1">高</option>
				</select>
				</span>

                <br>
                <button id="submitbtn" type="button" class="btn btn-success btn-lg submitbtn" style="left: auto">预测</button>
                <br>
                <input id="predictresult" class="predictresult" type="text" value="预测准点率" disabled="disabled" style="font-family: 'Open Sans';font-size: 20px;left: auto">
            </div>
        </div>
    </div>
</div>
<jsp:include page="/part/manager.js.jsp"></jsp:include>
</body>
<style type="text/css">

    .predictresult{
        margin: 15px;
    }
    .submitbtn{
        margin: 15px;
    }
    .input-text{
        margin: 10px;
    }
    .autocompleter {
        width: 20%;
        background: #dddddd;
        position: absolute;
        top: auto;
        left: auto;
        z-index: 100;
    }

    .autocompleter,
    .autocompleter-hint {
        position: absolute;
    }

    .autocompleter-list {
        box-shadow: inset 0px 0px 6px rgba(0,0,0,0.1);
        list-style: none;
        margin: 0;
        padding: 0;
        text-align: left;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
    }

    .autocompleter-item-selected {
        background: #ffffff;
    }

    .autocompleter-item {
        padding: 6px 12px;
        color: #444444;
        font-size: 20px;
        cursor: pointer;
    }

    .autocompleter-item:hover {
        background: #dbed8a;
    }

    .autocompleter-item strong {
        background: #f9de8f;
        text-shadow: 0 1px 0 #ffffff;
    }

    .autocompleter-item span {
        color: #bbbbbb;
    }

    .autocompleter-hint {
        color: #ccc;
        text-align: left;
        top: -56px;
        font-weight: 400;
        left: 0;
        width: 100%;
        padding: 12px 12px 12px 13px;
        font-size: 24px;
        display: none;
    }

    .autocompleter-hint span {
        color: transparent;
    }

    .autocompleter-hint-show {
        display: block;
    }

    .autocompleter-closed {
        display: none;
    }
</style>
<script type="text/javascript">
    window.onload=function(){
        var txt = document.getElementById("temperature");
        txt.onkeypress = function(evt){
            var evt = window.event||evt;
            var keynum = evt.keyCode||evt.which;
            var num = String.fromCharCode(keynum);
            if(keynum==8 || keynum==13)
            {
                return true;
            }
            if(this.value==="")
            {
                return /[-1-9]/.test(num);
            }
            else{
                return /[0-9]/.test(num);
            }
        }
    }

    $("#submitbtn").click(function(){
        $.post("predict",
            {
                fno:$("#fno").text(),
                ptype:$("#ptype").text(),
                arrival:$("#arrival").text(),
                weather:$("#weather").text()
            },
            function(data,status){
            $("#predictresult").prop(value,data.acc);
        });
    });

    var fno = [
        { "value": "AS1636", "label": "AS1636" },
        { "value": "AS1637", "label": "AS1637" },
        { "value": "AS1638", "label": "AS1638" }
    ];


    $(function () {
        $('#fno').autocompleter({
            highlightMatches: true,

            // object to local or url to remote search
            source: fno,

            // custom template
            template: '{{ label }}',

            // // show hint
            // hint: true,

            // abort source if empty field
            empty: false,

            // max results
            limit: 5
        });
    });

    $(function () {
        $('#ptype').autocompleter({
            highlightMatches: true,

            // object to local or url to remote search
            source: data,

            // custom template
            template: '{{ label }}',

            // // show hint
            // hint: true,

            // abort source if empty field
            empty: false,

            // max results
            limit: 5
        });
    });

    function get_fno(){
        $.ajax({
            type: "get",
            url: 'getFno',
            dataType: "json",
            success: function (data) {
                var list = data;
                for(var i = 0; i < list.length; i++) {
                    var temp = {};
                    temp.value=data[i];
                    temp.label=data[i];
                    fno.push(temp);
                }
            }
        });
    }
    //
    // function get_ptype(){
    //     $.ajax({
    //         type: "post",
    //         url: 'getPtype',
    //         dataType: "json",
    //         success: function (data) {
    //             var d = eval("(" + data + ")");
    //             for(var i = 0; i < d.length; i++) {
    //                 var value = d[i].ptype;
    //                 var text = d[i].ptype;
    //                 var opt = "<option value='" + value + "'>" + text + "</option>";
    //                 $("#ptype").append(opt);
    //             }
    //         }
    //     });
    // }
    //
    // function get_arrival(){
    //     $.ajax({
    //         type: "post",
    //         url: 'getArrival',
    //         dataType: "json",
    //         success: function (data) {
    //             var d = eval("(" + data + ")");
    //             for(var i = 0; i < d.length; i++) {
    //                 var value = d[i].arrival;
    //                 var text = d[i].arrival;
    //                 var opt = "<option value='" + value + "'>" + text + "</option>";
    //                 $("#arrival").append(opt);
    //             }
    //         }
    //     });
    // }
    //
    // function get_weather(){
    //     $.ajax({
    //         type: "post",
    //         url: 'getWeather',
    //         dataType: "json",
    //         success: function (data) {
    //             var d = eval("(" + data + ")");
    //             for(var i = 0; i < d.length; i++) {
    //                 var value = d[i].weather;
    //                 var text = d[i].weather;
    //                 var opt = "<option value='" + value + "'>" + text + "</option>";
    //                 $("#weather").append(opt);
    //             }
    //         }
    //     });
    // }

    $(document).ready(function() {

        get_fno();
        get_ptype();
        get_arrival();
        get_weather();

    });
</script>
</html>
