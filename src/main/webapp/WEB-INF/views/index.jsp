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
                                <font size="4">航班信息</font> <a
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
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover"
                                           id="dataTables-example">
                                        <thead>
                                        <tr>
                                            <th>编号</th>
                                            <th>客户名</th>
                                            <th>手机</th>
                                            <th>状态</th>
                                            <th>修改</th>
                                            <th>冻结/解冻</th>
                                            <th>删除</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${not empty list}">
                                            <c:forEach items="${list }" var="cus">
                                                <tr>
                                                    <td>
                                                        <a href="<%=basePath%>OrdersServlet?op=toModifyPage&id=${cus.cid}">${cus.cid}</a>
                                                    </td>
                                                    <td>${cus.cname}</td>
                                                    <td>${cus.mobile}</td>
                                                    <td>${cus.status==1?"正常":"冻结"}</td>
                                                    <td><a id="a_id" href="#" data-toggle="modal"
                                                           data-target="#myModal" onclick="editInfo(this,1)"> <span
                                                            class="glyphicon glyphicon-align-center"></span>
                                                    </a></td>
                                                    <td><a
                                                            href="javascript:doFreeze(${cus.cid},${cus.status});"
                                                            style="color: rgb(212, 106, 64);"> <span
                                                            class="glyphicon glyphicon-retweet"></span>
                                                    </a></td>
                                                    <td><a href="javascript:doDelete(${cus.cid })"
                                                           style="color: rgb(212, 106, 64);"> <span
                                                            class="glyphicon glyphicon-remove"></span>
                                                    </a></td>
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
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel" aria-hidden="true">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-hidden="true">×
                                        </button>
                                        <form action="<%=basePath%>CustomerServlet"
                                              method="post">
                                            <input type="hidden" id="op" name="op">
                                            <table class="table" style="font: '黑体';">
                                                <thead>
                                                <tr>
                                                    <th>信息：<input type="hidden" id="cid" name="cid"></th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td><b>客户名:</b></td>
                                                    <td><input type="text" id="cname" name="cname"
                                                               class="form-control"/></td>
                                                </tr>
                                                <tr>
                                                    <td><b>手机：</b></td>
                                                    <td><input type="text" id="mobile" name="mobile"
                                                               class="form-control"/></td>
                                                </tr>
                                                <tr>
                                                    <td><b>状态：</b></td>
                                                    <td><select id="status" name="status"
                                                                class="form-control">
                                                        <option value="1">正常</option>
                                                        <option value="2">冻结</option>
                                                    </select></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default"
                                                        data-dismiss="modal">关闭
                                                </button>
                                                <input type="submit" value="提交" class="btn btn-primary">
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/part/manager.js.jsp"></jsp:include>
    </body>
</html>