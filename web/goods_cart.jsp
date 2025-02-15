<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/11/28
  Time: 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>goods_cart</title>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link type="text/css" rel="stylesheet" href="${ctx}/css/bootstrap.css">
  <link type="text/css" rel="stylesheet" href="${ctx}/css/style.css">
  <link rel="stylesheet" href="${ctx}/css/flexslider.css">
  <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
  <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
  <script src="${ctx}/js/layer.js"></script>
  <script src="${ctx}/js/cart.js"></script>
  <link rel="stylesheet" href="${ctx}/css/layer.css">
</head>
<body>

<jsp:include page="header.jsp?flag=10"></jsp:include>


  <div class="cart-items">
    <div class="container">



      <h2>我的购物车</h2>

  <c:forEach var="item" items="${order.itemMap}">

      <div class="cart-header col-md-6">
        <div class="cart-sec simpleCart_shelfItem">
          <div class="cart-item cyc">
            <a href="${ctx}/goodslist?flag=goodsDetail&id=${item.value.goods.id}">
              <img src="${ctx}${item.value.goods.cover}" class="img-responsive">
            </a>
          </div>
          <div class="cart-item-info">
            <h3><a href="${ctx}/goodslist?flag=goodsDetail&id=${item.value.goods.id}">${item.value.goods.name}</a></h3>
            <h3><span>单价: ¥ ${item.value.goods.price}</span></h3>
            <h3><span>数量: ${item.value.amount}</span></h3>
            <a class="btn btn-info" href="javascript:buy(${item.value.goods.id});">增加</a>
            <a class="btn btn-warning" href="javascript:lessen(${item.value.goods.id});">减少</a>
            <a class="btn btn-danger" href="javascript:deletes(${item.value.goods.id});">删除</a>
          </div>
          <div class="clearfix"></div>
        </div>
      </div>
  </c:forEach>

      <div class="cart-header col-md-12">
        <hr>
        <h3>订单总金额：¥ ${order.total}</h3>
        <a class="btn btn-success btn-lg" style="margin-left:74%" href="${ctx}/order_submit.jsp">提交订单</a>
      </div>



    </div>
  </div>









<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>
