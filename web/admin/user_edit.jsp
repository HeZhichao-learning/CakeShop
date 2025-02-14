<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/12/4
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>user_edit</title>
    <link rel="stylesheet" href="${ctx}/admin/css/bootstrap.css">
</head>
<body>
<jsp:include page="header.jsp"/>

<br>

<form class="form-horizontal" action="${ctx}/admin/user?flag=update" method="post">
    <input type="hidden" name="id" value=${user.id}>
    <div class="form-group">
        <label for="input_name" class="col-sm-1 control-label">用户名</label>
        <div class="col-sm-5">${user.username}</div>
    </div>
    <div class="form-group">
        <label for="input_name" class="col-sm-1 control-label">邮箱</label>
        <div class="col-sm-5">${user.email}</div>
    </div>
    <div class="form-group">
        <label for="input_name" class="col-sm-1 control-label">收货人</label>
        <div class="col-sm-6">
            <input type="text" class="form-control" id="input_name" name="name" value=${user.name}>
        </div>
    </div>
    <div class="form-group">
        <label for="input_name" class="col-sm-1 control-label">电话</label>
        <div class="col-sm-6">
            <input type="text" class="form-control"  name="phone" value=${user.phone}>
        </div>
    </div>
    <div class="form-group">
        <label for="input_name" class="col-sm-1 control-label">地址</label>
        <div class="col-sm-6">
            <input type="text" class="form-control"  name="address" value=${user.address}>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-1 col-sm-10">
            <button type="submit" class="btn btn-success">提交修改</button>
        </div>
    </div>
</form>
</body>
</html>
