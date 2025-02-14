<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/11/19
  Time: 16:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>用户登录</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link type="text/css" rel="stylesheet" href="${ctx}/css/bootstrap.css">
  <link type="text/css" rel="stylesheet" href="${ctx}/css/style.css">
  <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
  <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
<%--  <script type="text/javascript" src="${ctx}/js/simpleCart.min.js"></script>--%>




</head>
<body>
<!--header-->
<!--header-->
<jsp:include page="header.jsp?flag=6"></jsp:include>
<!--//header-->
<!--//header-->
<!--account-->
<div class="account">
  <div class="container">
    <div class="register">

<c:if test="${!empty failMsg}">
  <div class="alert alert-danger">
    ${failMsg}
  </div>
</c:if>

      <form action="${ctx}/insertUser?flag=login" method="post">
        <div class="register-top-grid">
          <h3>用户登录</h3>
          <div class="input">
            <span>用户名/邮箱 <label style="color:red;">*</label></span>
            <input type="text" name="ue" placeholder="请输入用户名" required="required">
          </div>
          <div class="input">
            <span>密码 <label style="color:red;">*</label></span>
            <input type="password" name="password" placeholder="请输入密码" required="required">
          </div>

          <div class="clearfix"> </div>
        </div>
        <div class="register-but text-center">
          <input type="submit" value="提交">
          <div class="clearfix"> </div>
        </div>
      </form>
      <div class="clearfix"> </div>
    </div>
  </div>
</div>
<!--//account-->
<br>
<br>
<br>
<!--footer-->
<jsp:include page="footer.jsp"></jsp:include>
<!--footer-->

</body></html>
