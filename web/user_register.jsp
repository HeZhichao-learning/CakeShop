<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/11/19
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>用户注册</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
  <link type="text/css" rel="stylesheet" href="css/style.css">
  <script type="text/javascript" src="js/jquery.min.js"></script>
  <script type="text/javascript" src="js/bootstrap.min.js"></script>
  <script>
    let myflag1=true;
    let myflag2=true;
function checkname(name){
  $.post(
          "insertUser?flag=checkname",
          {name1:name},
          function (data){
            if(data==1){
              $(".namemsg").html("用户名重复");
              myflag1=false;
            }
            else{
              $(".namemsg").html("不重复，可以使用")
              myflag1=true;
            }
          }
  );
}
    function checkemail(email){
      $.post(
              "insertUser?flag=checkemail",
              {email1:email},
              function (data){
                if(data==1){
                  $(".emailmsg").html("用户邮箱重复");
                  myflag2=false;
                }
                else{
                  $(".emailmsg").html("不重复，可以使用")
                  myflag2=true;
                }
              }
      );
    }
  </script>
</head>
<body>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="header.jsp?flag=5"></jsp:include>

<div class="account">
  <div class="container">
    <div class="register">

      <form action="${ctx}/insertUser?flag=insert" method="post" onsubmit="return myflag1&&myflag2">
        <div class="register-top-grid">
          <h3>注册新用户</h3>
          <div class="input">
            <span>用户名 <label style="color:red;">*</label></span>
            <input type="text" name="username" placeholder="请输入用户名" required="required" onblur="checkname(this.value)">
            <span class="namemsg" style="color: red"></span>
          </div>
          <div class="input">
            <span>邮箱 <label style="color:red;">*</label></span>
            <input type="text" name="email" placeholder="请输入邮箱" required="required" onblur="checkemail(this.value)">
            <span class="emailmsg" style="color: red"></span>
          </div>
          <div class="input">
            <span>密码 <label style="color:red;">*</label></span>
            <input type="password" name="password" placeholder="请输入密码" required="required">
          </div>
          <div class="input">
            <span>收货人<label></label></span>
            <input type="text" name="name" placeholder="请输入收货">
          </div>
          <div class="input">
            <span>收货电话<label></label></span>
            <input type="text" name="phone" placeholder="请输入收货电话">
          </div>
          <div class="input">
            <span>收货地址<label></label></span>
            <input type="text" name="address" placeholder="请输入收货地址">
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

<jsp:include page="footer.jsp"></jsp:include>





</body></html>
