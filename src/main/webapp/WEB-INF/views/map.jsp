<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2019/7/16
  Time: 9:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>地图概览</title>
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
            <div id="flight-map-echarts" style="width:100%;height:100%"></div>
        </div>
    </div>
</div>
<jsp:include page="/part/manager.js.jsp"></jsp:include>
</body>
<script>
    var fmeChart = echarts.init(document.getElementById("flight-map-echarts"));

    var data = [];
    var geoCoordMap = {};

    Papa.parse('<%=basePath%>data/airportcount.csv', {
        download: true,
        complete: function (results) {
            //采用papaparse获取csv中的数据
            var rowData = results.data.reverse();
            //console.log(rowData);

            for (i = 1; i < rowData.length; i++) {
                var temp = {};
                temp.name = rowData[i][0];
                temp.value = Number(rowData[i][1]);
                data.push(temp);
            }
            console.log(data);

            Papa.parse('<%=basePath%>data/airportlatlon.csv', {
                download: true,
                complete: function (results) {
                    //采用papaparse获取csv中的数据
                    var rowData = results.data.reverse();

                    //console.log(rowData);
                    for(i = 1; i < rowData.length; i++){
                        var arr = [rowData[i][1],rowData[i][2]];
                        geoCoordMap[rowData[i][0]] = arr;
                    }
                    console.log(geoCoordMap);

                    var convertData = function (data) {
                        var res = [];
                        for (var i = 0; i < data.length; i++) {
                            var geoCoord = geoCoordMap[data[i].name];
                            if (geoCoord) {
                                res.push({
                                    name: data[i].name,
                                    value: geoCoord.concat(data[i].value)
                                });
                            }
                        }
                        return res;
                    };

                    var fmeOption = {
                        // backgroundColor: '#404a59',
                        title: {
                            text: '西安咸阳机场的目的机场航次数气泡图',
                            left: 'center',
                            textStyle: {
                                color: '#000'
                            }
                        },
                        tooltip : {
                            trigger: 'item'
                        },
                        bmap: {
                            center: [108.7598380000,34.4364870000],
                            zoom: 5,
                            roam: true,
                            mapType: BMAP_SATELLITE_MAP
                            // mapStyle: {
                            //     styleJson: [
                            //         {
                            //             "featureType": "water",
                            //             "elementType": "all",
                            //             "stylers": {
                            //                 "color": "#044161"
                            //             }
                            //         },
                            //         {
                            //             "featureType": "land",
                            //             "elementType": "all",
                            //             "stylers": {
                            //                 "color": "#004981"
                            //             }
                            //         },
                            //         {
                            //             "featureType": "boundary",
                            //             "elementType": "geometry",
                            //             "stylers": {
                            //                 "color": "#064f85"
                            //             }
                            //         },
                            //         {
                            //             "featureType": "railway",
                            //             "elementType": "all",
                            //             "stylers": {
                            //                 "visibility": "off"
                            //             }
                            //         },
                            //         {
                            //             "featureType": "highway",
                            //             "elementType": "geometry",
                            //             "stylers": {
                            //                 "color": "#004981"
                            //             }
                            //         },
                            //         {
                            //             "featureType": "highway",
                            //             "elementType": "geometry.fill",
                            //             "stylers": {
                            //                 "color": "#005b96",
                            //                 "lightness": 1
                            //             }
                            //         },
                            //         {
                            //             "featureType": "highway",
                            //             "elementType": "labels",
                            //             "stylers": {
                            //                 "visibility": "off"
                            //             }
                            //         },
                            //         {
                            //             "featureType": "arterial",
                            //             "elementType": "geometry",
                            //             "stylers": {
                            //                 "color": "#004981"
                            //             }
                            //         },
                            //         {
                            //             "featureType": "arterial",
                            //             "elementType": "geometry.fill",
                            //             "stylers": {
                            //                 "color": "#00508b"
                            //             }
                            //         },
                            //         {
                            //             "featureType": "poi",
                            //             "elementType": "all",
                            //             "stylers": {
                            //                 "visibility": "off"
                            //             }
                            //         },
                            //         {
                            //             "featureType": "green",
                            //             "elementType": "all",
                            //             "stylers": {
                            //                 "color": "#056197",
                            //                 "visibility": "off"
                            //             }
                            //         },
                            //         {
                            //             "featureType": "subway",
                            //             "elementType": "all",
                            //             "stylers": {
                            //                 "visibility": "off"
                            //             }
                            //         },
                            //         {
                            //             "featureType": "manmade",
                            //             "elementType": "all",
                            //             "stylers": {
                            //                 "visibility": "off"
                            //             }
                            //         },
                            //         {
                            //             "featureType": "local",
                            //             "elementType": "all",
                            //             "stylers": {
                            //                 "visibility": "off"
                            //             }
                            //         },
                            //         {
                            //             "featureType": "arterial",
                            //             "elementType": "labels",
                            //             "stylers": {
                            //                 "visibility": "off"
                            //             }
                            //         },
                            //         {
                            //             "featureType": "boundary",
                            //             "elementType": "geometry.fill",
                            //             "stylers": {
                            //                 "color": "#029fd4"
                            //             }
                            //         },
                            //         {
                            //             "featureType": "building",
                            //             "elementType": "all",
                            //             "stylers": {
                            //                 "color": "#1a5787"
                            //             }
                            //         },
                            //         {
                            //             "featureType": "label",
                            //             "elementType": "all",
                            //             "stylers": {
                            //                 "visibility": "off"
                            //             }
                            //         }
                            //     ]
                            // }
                        },
                        series : [
                            {
                                name: '航班次数',
                                type: 'scatter',
                                coordinateSystem: 'bmap',
                                data: convertData(data),
                                symbolSize: function (val) {
                                    return val[2] / 50;
                                },
                                label: {
                                    normal: {
                                        formatter: '{b}',
                                        position: 'right',
                                        show: false
                                    },
                                    emphasis: {
                                        show: true
                                    }
                                },
                                itemStyle: {
                                    normal: {
                                        color: '#ddb926'
                                    }
                                }
                            },
                            {
                                name: '前五航次数机场',
                                type: 'effectScatter',
                                coordinateSystem: 'bmap',
                                data: convertData(data.sort(function (a, b) {
                                    return b.value - a.value;
                                }).slice(0, 6)),
                                symbolSize: function (val) {
                                    return val[2] / 50;
                                },
                                showEffectOn: 'emphasis',
                                rippleEffect: {
                                    brushType: 'stroke'
                                },
                                hoverAnimation: true,
                                label: {
                                    normal: {
                                        formatter: '{b}',
                                        position: 'right',
                                        show: true
                                    }
                                },
                                itemStyle: {
                                    normal: {
                                        color: '#f4e925',
                                        shadowBlur: 10,
                                        shadowColor: '#333'
                                    }
                                },
                                zlevel: 1
                            }
                        ]
                    };
                    fmeChart.setOption(fmeOption);
                }
            });
        }

    });

</script>
</html>
