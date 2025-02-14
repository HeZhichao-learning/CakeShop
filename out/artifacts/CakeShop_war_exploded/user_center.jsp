<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/11/21
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>个人中心</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
  <link type="text/css" rel="stylesheet" href="css/style.css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script type="text/javascript" src="js/simpleCart.min.js"></script>
  <script>
    myflag=false;
  </script>

</head>
<body>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>



<!--header-->
<jsp:include page="header.jsp?flag=7"></jsp:include>
<!--//header-->

<!--account-->
<div class="account">
  <div class="container">
    <div class="register">

<c:if test="${not empty successMsg}">
  <div class="alert alert-success">
    ${successMsg}

  </div>
</c:if>

      <div class="register-top-grid">
        <h3>个人中心</h3>
        <form action="${ctx}/insertUser?flag=changeaddress" method="post">
          <!-- 收货信息 start -->
          <h4>收货信息</h4>
          <div class="input">
            <span>收货人<label></label></span>
            <input type="text" name="name" value="${loginuser.name}" placeholder="请输入收货">
          </div>
          <div class="input">
            <span>收货电话</span>
            <input type="text" name="phone" value="${loginuser.phone}" placeholder="请输入收货电话">
          </div>
          <div class="input">
            <span>收货地址</span>
            <input type="text" name="address" value="${loginuser.address}" placeholder="请输入收货地址">
          </div>
          <div class="register-but text-center">
            <input type="submit" value="提交">
          </div>
          <!-- 收货信息 end -->
        </form>
        <hr>
        <form action="${ctx}/insertUser?flag=changepwd" method="post" onsubmit="return myflag">
          <h4>安全信息</h4>
          <div class="input">
            <span>原密码</span>
            <input type="text" name="password" placeholder="请输入原密码" onblur="checkpass(this.value)">
            <span class="alert passmsg"></span>
          </div>
          <div class="input">
            <span>新密码</span>
            <input type="text" name="newPassword" placeholder="请输入新密码">
          </div>
          <div class="clearfix"> </div>
          <div class="register-but text-center">
            <input type="submit" value="提交">
          </div>
        </form>
      </div>

      <div class="clearfix"> </div>
    </div>
  </div>
</div>
<!--//account-->
<!--footer-->
<jsp:include page="footer.jsp"></jsp:include>
<!--//footer-->
<script>
  function checkpass(value){
    $.ajax({
      type:"post",
      url:"insertUser?flag=checkpass",
      data:{oldpass:value},
      success:function (data){
        if(data==0){
          myflag=false;
          $(".passmsg").html("用户原密码不正确，请重新输入")
          $(".passmsg").addClass("alert-danger");

        }else {
          myflag=true;
          $(".passmsg").html("")
          $(".passmsg").removeClass("alert-success");
        }
      }

    });
  }
</script>

</body></html>
