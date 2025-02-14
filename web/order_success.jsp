<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/11/28
  Time: 16:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>order_success</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link type="text/css" rel="stylesheet" href="${ctx}/css/bootstrap.css">
  <link type="text/css" rel="stylesheet" href="${ctx}/css/style.css">
  <link rel="stylesheet" href="${ctx}/css/flexslider.css">
  <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
  <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
  <script src="${ctx}/js/layer.js"></script>
  <script src="${ctx}/js/cart.js"></script>
  <script src="${ctx}/css/layer.css"></script>

</head>
<body>
<jsp:include page="header.jsp"/>

<div class="cart-items">
  <div class="container">
    <div class="alert alert-success">订单支付成功！</div>
    <p><a class="btn btn-success" href="${ctx}/order_list">查看我的订单</a></p>
  </div>
</div>
<br><br><br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
