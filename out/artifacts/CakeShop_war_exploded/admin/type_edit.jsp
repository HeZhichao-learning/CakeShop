<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/12/3
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>type_edit</title>
  <link rel="stylesheet" href="${ctx}/admin/css/bootstrap.css">
</head>
<body>
<div class="container-fluid">

<jsp:include page="header.jsp"/>


  <br>

  <form class="form-horizontal" action="${ctx}/admin/type?flag=update" method="post">
    <input type="hidden" name="id" value="${param.id}">
    <div class="form-group">
      <label for="input_name" class="col-sm-1 control-label">类目名称</label>
      <div class="col-sm-6">
        <input type="text" class="form-control" id="input_name" name="name" value="${param.name}" required="required">
      </div>
    </div>
    <div class="form-group">
      <div class="col-sm-offset-1 col-sm-10">
        <button type="submit" class="btn btn-success">提交修改</button>
      </div>
    </div>
  </form>

  <span style="color:red;"></span>

</div>
</body>
</html>
