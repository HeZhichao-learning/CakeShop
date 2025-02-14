<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/12/3
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>type_list</title>
  <link rel="stylesheet" href="${ctx}/admin/css/bootstrap.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>


<div class="container-fluid">

  <br>

  <div>
    <form class="form-inline" method="post" action="${ctx}/admin/type?flag=add">
      <input type="text" class="form-control" id="input_name" name="name" placeholder="输入类目名称" required="required" style="width: 500px">
      <input type="submit" class="btn btn-warning" value="添加类目">
    </form>
  </div>
  <br>


  <br>

  <table class="table table-bordered table-hover">

    <tbody><tr>
      <th width="5%">ID</th>
      <th width="10%">名称</th>
      <th width="10%">操作</th>
    </tr>

<c:forEach var="type" items="${typelist1}">
    <tr>
      <td><p>${type.id}</p></td>
      <td><p>${type.name}</p></td>
      <td>
        <a class="btn btn-primary" href="${ctx}/admin/type_edit.jsp?id=${type.id}&amp;name=${type.name}">修改</a>
        <a class="btn btn-danger" href="${ctx}/admin/type?flag=delete&id=${type.id}">删除</a>
      </td>
    </tr>

    </c:forEach>

    </tbody></table>

</div>


</body>
</html>
