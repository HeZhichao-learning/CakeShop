<%--
  Created by IntelliJ IDEA.
  User: 19767
  Date: 2018/11/30
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-default" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.jsp">蛋糕店后台</a>
        </div>
        <div>
            <ul class="nav navbar-nav">
                <li ><a href="${ctx}/admin/order">订单管理</a></li>
                <li ><a href="${ctx}/admin/user?flag=list">客户管理</a></li>
                <li ><a href="${ctx}/admin/goods?type=0">商品管理</a></li>
                <li ><a href="${ctx}/admin/type">类目管理</a></li>
                <li><a href="${ctx}/admin/user?flag=logout">退出</a></li>

                <c:if test="${not empty loginuser}">
                <li ><a href="${ctx}/index">商店前台</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>
