<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/11/26
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>goods_search</title>
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
<jsp:include page="header.jsp?flag=2"></jsp:include>

<!--products-->
<div class="products">
    <div class="container">
        <h2>${type.name} </h2>

        <div class="col-md-12 product-model-sec">

            <c:forEach var="g" items="${goodsList}">
                <div class="product-grid">
                    <a href="${ctx}/goodslist?flag=goodsDetail&id=${g.id}">
                        <div class="more-product"><span> </span></div>
                        <div class="product-img b-link-stripe b-animate-go  thickbox">
                            <img src="${ctx}${g.cover}" class="img-responsive" alt="草莓冰淇淋" width="240" height="240">
                            <div class="b-wrapper">
                                <h4 class="b-animate b-from-left  b-delay03">
                                    <button href="${ctx}goodslist?flag=goodsDetail&id=${g.id}">查看详情</button>
                                </h4>
                            </div>
                        </div>
                    </a>
                    <div class="product-info simpleCart_shelfItem">
                        <div class="product-info-cust prt_name">
                            <h4>${g.name}</h4>
                            <span class="item_price">￥${g.price}</span>
                            <input type="button" class="item_add items" value="加入购物车" onclick="buy(${g.id})">
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>

        <div style="text-align:center;">
            <a class="btn btn-info"  href="${ctx}/goodslist?flag=search&keyword=${key}&pno=1&typeid=${type.id}">首页</a>
            <a class="btn btn-info" ${pno==1?"disabled":""} href="${ctx}/goodslist?flag=search&keyword=${key}&pno=${pno-1}&typeid=${type.id}">上一页</a>
            <h3 style="display:inline;">[${pno}/${pcount}]</h3>

            <a class="btn btn-info" href="${ctx}/goodslist?flag=search&keyword=${key}&pno=${pno+1}&typeid=${type.id}">下一页</a>
            <a class="btn btn-info" ${pno==pcount?"disabled":""} href="${ctx}/goodslist?flag=search&keyword=${key}&pno=${pcount}&typeid=${type.id}">尾页</a>
            <input type="text" class="form-control" style="display:inline;width:60px;" value="">
            <a class="btn btn-info" href="javascript:void(0);" onclick="location.href='${ctx}/goodslist?flag=search&keyword=${key}&pno='+(this.previousElementSibling.value)+'&typeid=${type.id}'">GO</a>
        </div>

    </div>
</div>

<!--//products-->





<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>