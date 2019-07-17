<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    ;
    String basePathManager = basePath + "manager/";
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <meta content="" name="description"/>
        <meta content="webthemez" name="author"/>
        <title>航班信息管理</title>
        <jsp:include page="/part/manager.css.jsp"></jsp:include>
    </head>
    <body>
    <div id="wrapper">
        <!--头部-->
        <jsp:include page="/part/manager.header.jsp"></jsp:include>
        <!--导航栏class="active-menu-->
        <jsp:include page="/part/manager.menu.jsp"></jsp:include>
        <!--表格-->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                        <!-- Advanced Tables -->
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <font size="4">用户信息管理</font> <a
                                    href="showflight.html"> <span
                                    class="glyphicon glyphicon-repeat"></span>
                            </a>
                                <span style="float: right">
									<button type="button" class="btn btn-default btn-sm"
                                            data-toggle="modal" data-target="#myModal"
                                            onclick="editInfo(this,0)">
										<span class="glyphicon glyphicon-plane"></span> 添加客户
									</button>
								    </span>
                            </div>
                            <div class="panel-body">
                                <input id="mysearch" placeholder="航班/出发地/目的地/机场">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover"
                                           id="dataTables-example">
                                        <thead>
                                        <tr>
                                            <th>航班号</th>
                                            <th>出发地</th>
                                            <th>目的地</th>
                                            <th>机型</th>
                                            <th>预计出发时间</th>
                                            <th>预计到达时间</th>
                                            <th>实际出发时间</th>
                                            <th>实际到达时间</th>
                                            <th>目的机场</th>
                                            <th>进出港类型</th>
                                            <th>经度</th>
                                            <th>纬度</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <%--<c:if test="${not empty list}">--%>
                                            <%--<c:forEach items="${list }" var="flight">--%>
                                                <%--<tr>--%>
                                                    <%--<td>${flight.fno}</td>--%>
                                                    <%--<td>${flight.departure}</td>--%>
                                                    <%--<td>${flight.arrival}</td>--%>
                                                    <%--<td>${flight.ptype}</td>--%>
                                                    <%--<td>${flight.std}</td>--%>
                                                    <%--<td>${flight.sta}</td>--%>
                                                    <%--<td>${flight.atd}</td>--%>
                                                    <%--<td>${flight.ata}</td>--%>
                                                    <%--<td>${flight.airport}</td>--%>
                                                    <%--<td>${flight.atype}</td>--%>
                                                    <%--<td>${flight.lon}</td>--%>
                                                    <%--<td>${flight.lat}</td>--%>
                                                <%--</tr>--%>
                                            <%--</c:forEach>--%>
                                        <%--</c:if>--%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                        <!-- /.modal -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/part/manager.js.jsp"></jsp:include>
    <script>
        var tmp;
        $(document).ready(function () {
            var language = {"sProcessing": "&nbsp&nbsp&nbsp&nbsp&nbsp处理中...", "sLengthMenu": "显示 _MENU_ 项结果", "sZeroRecords": "没有匹配结果", "sInfo": "当前第 _START_ 至 _END_ 条记录，共 _TOTAL_ 条", "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项", "sInfoFiltered": "(共 _MAX_ 页)", "sInfoPostFix": "", "sSearch": "搜索:", "sUrl": "", "sEmptyTable": "表中数据为空", "sLoadingRecords": "载入中...", "sInfoThousands": ",", "oPaginate": {"sFirst": "首页", "sPrevious": "上页", "sNext": "下页", "sLast": "末页"}};
            var mytable = $('#dataTables-example').dataTable({
                "serverSide": true,
                bServerSide:true,
                lengthChange: false,
                ordering: false,
                paging: true,
                pagingType: "full_numbers",
                processing: true,
                autoWidth: true,
                destroy: true,
                iDisplayLength:20,
                bFilter:false,
                // language: language,
                ajax: {
                    url: '/flightList',
                    dataSrc: 'data'
                },

                columns: [
                    {data: 'fno'},
                    {data: 'departure'},
                    {data: 'arrival'},
                    {data: 'ptype'},
                    {data: 'std'},
                    {data: 'sta'},
                    {data: 'atd'},
                    {data: 'ata'},
                    {data: 'airport'},
                    {data: 'atype'},
                    {data: 'lon'},
                    {data: 'lat'},
                ]
            });
            $(document).on("keyup","#mysearch",function(){
                // $('#dataTables-example').dataTable().fnClearTable();
                // $('#dataTables-example').dataTable().fnDestroy();
                var info = this.value;
                tmp = info;
                // $.ajax({
                //     url: '/flightList/'+info,
                //     // dataType:'json',
                //     success:function (msg) {
                //         $('#dataTables-example').dataTable().fnClearTable();
                //         $('#dataTables-example').dataTable().fnAddData(msg.data,true);
                //         $('#dataTables-example').dataTable().fnDraw(false);
                //         // console.log($('#dataTables-example').dataTable().attr());
                //     }
                // })
                $('#dataTables-example').dataTable({
                    "serverSide": true,
                    lengthChange: false,
                    ordering: false,
                    paging: true,
                    pagingType: "full_numbers",
                    processing: true,
                    autoWidth: true,
                    destroy: true,
                    bFilter:false,
                    iDisplayLength:20,
                    language: language, //国际化
                    ajax: {
                        url: '/flightList/'+info,
                        dataSrc: 'data'
                    },

                    columns: [
                        {data: 'fno'},
                        {data: 'departure'},
                        {data: 'arrival'},
                        {data: 'ptype'},
                        {data: 'std'},
                        {data: 'sta'},
                        {data: 'atd'},
                        {data: 'ata'},
                        {data: 'airport'},
                        {data: 'atype'},
                        {data: 'lon'},
                        {data: 'lat'},
                    ]
                });
            })
        });



    </script>
    </body>
</html>