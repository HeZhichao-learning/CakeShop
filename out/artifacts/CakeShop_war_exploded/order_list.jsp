<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/12/2
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>order_list</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link type="text/css" rel="stylesheet" href="${ctx}/css/bootstrap.css">
  <link type="text/css" rel="stylesheet" href="${ctx}/css/style.css">
  <link rel="stylesheet" href="${ctx}/css/flexslider.css">
  <link rel="stylesheet" href="${ctx}/css/layer.css">
  <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
  <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
  <script src="${ctx}/js/layer.js"></script>
  <script src="${ctx}/js/cart.js"></script>
</head>
<body>

<jsp:include page="header.jsp?flag=8"></jsp:include>


<!--cart-items-->
<div class="cart-items">
  <div class="container">



    <h2>我的订单</h2>

    <table class="table table-bordered table-hover">

      <tbody>
      <tr>
        <th width="10%">ID</th>
        <th width="10%">总价</th>
        <th width="20%">商品详情</th>
        <th width="20%">收货信息</th>
        <th width="10%">订单状态</th>
        <th width="10%">支付方式</th>
        <th width="10%">下单时间</th>
        <th width="20%">订单操作</th>
      </tr>

<c:forEach var="order" items="${orderList}">

      <tr>
        <td><p>${order.id}</p></td>
        <td><p>${order.total}</p></td>
        <td>
            <c:forEach items="${order.itemList}" var="i">
          <p>${i.goods.name}(${i.goods.price}) x ${i.amount}</p>
            </c:forEach>

        </td>
        <td>
          <p>${order.name}</p>
          <p>${order.phone}</p>
          <p>${order.address}</p>
        </td>
        <td>
          <p>
            <span style="color:red;">

              <c:if test="${order.status==1}"><span style="color: red;">未付款</span></c:if>
              <c:if test="${order.status==2}"><span style="color: red;">已付款</span></c:if>
              <c:if test="${order.status==3}"><span style="color:green;">已发货</span></c:if>
              <c:if test="${order.status==4}"><span style="color: black;">已完成</span></c:if>

            </span>

          </p>
        </td>
        <td>
          <p>
            <c:if test="${order.paytype==1}">
              微信
            </c:if>
            <c:if test="${order.paytype==2}">
              支付宝
            </c:if>
            <c:if test="${order.paytype==3}">
              货到付款
            </c:if>


          </p>
        </td>
        <td><p>${order.datetime}</p></td>

        <td>

          <p> <a href="${ctx}/order_list?flag=delete&id=${order.id}" onclick="return confirm('确认要删除该订单吗')" class="btn btn-danger">删除订单</a></p>
        </td>




      </tr>





</c:forEach>

      </tbody></table>




  </div>
</div>
<!--//cart-items-->







<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
