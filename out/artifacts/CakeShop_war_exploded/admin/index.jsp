<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/12/3
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>后台首页</title>
  <link rel="stylesheet" href="${ctx}/admin/css/bootstrap.css">
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
<div class="container-fluid">

  <br><br>

  <div class="alert alert-success" role="alert">恭喜你! 登录成功了</div>

</div>



</body>
</html>
