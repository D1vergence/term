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
                                    <%--<span style="float: right">--%>
									<%--<button type="button" class="btn btn-default btn-sm"--%>
                                            <%--data-toggle="modal" data-target="#myModal"--%>
                                            <%--onclick="editInfo(this,0)">--%>
										<%--<span class="glyphicon glyphicon-plane"></span> 添加客户--%>
									<%--</button>--%>
								<%--</span>--%>
                                </div>
                                <div class="panel-body">
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
                                                <th>进出港类型</th>
                                                <th>目的机场</th>
                                                <th>进出港类型</th>
                                                <th>目的机场名</th>
                                                <th>经度</th>
                                                <th>纬度</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:if test="${not empty list}">
                                                <c:forEach items="${list }" var="flight">
                                                    <tr>
                                                        <td>${flight.fno}</td>
                                                        <td>${flight.departure}</td>
                                                        <td>${flight.arrival}</td>
                                                        <td>${flight.ptype}</td>
                                                        <td>${flight.std}</td>
                                                        <td>${flight.sta}</td>
                                                        <td>${flight.atd}</td>
                                                        <td>${flight.ata}</td>
                                                        <td>${flight.atype}</td>
                                                        <td>${flight.name}</td>
                                                        <td>${flight.lon}</td>
                                                        <td>${flight.lat}</td>
                                                    </tr>
                                                </c:forEach>
                                            </c:if>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!--End Advanced Tables -->
                            <!-- 按钮触发模态框 -->
                            <!-- 模态框（Modal） myModal-->
                            <%--<div class="modal fade" id="myModal" tabindex="-1" role="dialog"--%>
                                 <%--aria-labelledby="myModalLabel" aria-hidden="true">--%>
                                <%--<div class="modal-dialog">--%>
                                    <%--<div class="modal-content">--%>
                                        <%--<div class="modal-header">--%>
                                            <%--<button type="button" class="close" data-dismiss="modal"--%>
                                                    <%--aria-hidden="true">×--%>
                                            <%--</button>--%>
                                            <%--<form action="<%=basePath%>CustomerServlet"--%>
                                                  <%--method="post">--%>
                                                <%--<input type="hidden" id="op" name="op">--%>
                                                <%--<table class="table" style="font: '黑体';">--%>
                                                    <%--<thead>--%>
                                                    <%--<tr>--%>
                                                        <%--<th>信息：<input type="hidden" id="cid" name="cid"></th>--%>
                                                        <%--<th></th>--%>
                                                    <%--</tr>--%>
                                                    <%--</thead>--%>
                                                    <%--<tbody>--%>
                                                    <%--<tr>--%>
                                                        <%--<td><b>客户名:</b></td>--%>
                                                        <%--<td><input type="text" id="cname" name="cname"--%>
                                                                   <%--class="form-control"/></td>--%>
                                                    <%--</tr>--%>
                                                    <%--<tr>--%>
                                                        <%--<td><b>手机：</b></td>--%>
                                                        <%--<td><input type="text" id="mobile" name="mobile"--%>
                                                                   <%--class="form-control"/></td>--%>
                                                    <%--</tr>--%>
                                                    <%--<tr>--%>
                                                        <%--<td><b>状态：</b></td>--%>
                                                        <%--<td><select id="status" name="status"--%>
                                                                    <%--class="form-control">--%>
                                                            <%--<option value="1">正常</option>--%>
                                                            <%--<option value="2">冻结</option>--%>
                                                        <%--</select></td>--%>
                                                    <%--</tr>--%>
                                                    <%--</tbody>--%>
                                                <%--</table>--%>
                                                <%--<div class="modal-footer">--%>
                                                    <%--<button type="button" class="btn btn-default"--%>
                                                            <%--data-dismiss="modal">关闭--%>
                                                    <%--</button>--%>
                                                    <%--<input type="submit" value="提交" class="btn btn-primary">--%>
                                                <%--</div>--%>
                                            <%--</form>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                                <%--<!-- /.modal-dialog -->--%>
                            <%--</div>--%>
                            <!-- /.modal -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="/part/manager.js.jsp"></jsp:include>
        <script>
            // function doDelete(id) {
            //     if (confirm("您确定要删除编号为:" + id + "的客户吗？")) {
            //         location.href = 'deleteCustomer.html&cid=' + id;
            //     }
            // }
            //
            // function doFreeze(id, state) {
            //     if (state == 1) {
            //         if (confirm("您确定要冻结编号为:" + id + "的客户吗？")) {
            //             location.href = 'freezecustomer.html&cid=' + id;
            //         }
            //     }
            //     if (state == 2) {
            //         if (confirm("您确定要解冻编号为:" + id + "的客户吗？")) {
            //             location.href = 'defreezecustomer.html&cid=' + id;
            //         }
            //     }
            // }
            //
            // function editInfo(obj, type) {
            //     if (type == 0) {
            //         $("#editForm").attr("action", "addcustomer.html");
            //         $(".form-control").val("");
            //     } else {
            //         var customer = obj.parentNode.parentNode.childNodes;
            //         $("#editForm").attr("action", "editcustomer.html");
            //         // $("#op").val("modify");
            //         $("#cid").val(customer[1].innerText);
            //         $("#cname").val(customer[3].innerText);
            //         $("#mobile").val(customer[5].innerText);
            //         var status = customer[7].innerText == "正常" ? 1 : 2;
            //         $("#status").val(status);
            //     }
            // }
        </script>
    </body>
</html>