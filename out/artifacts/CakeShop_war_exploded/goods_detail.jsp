<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/11/22
  Time: 15:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>

    <title>index</title>
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

    <script>
        $(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
        });
    </script>


</head>
<body>

<jsp:include page="header.jsp?flag=10"></jsp:include>

<!--//single-page-->
<div class="single">
    <div class="container">
        <div class="single-grids">
            <div class="col-md-4 single-grid">
                <div class="flexslider">


                    <div class="flex-viewport" style="overflow: hidden; position: relative;">
                        <ul class="slides"
                            style="width: 1000%; transition-duration: 0.6s; transform: translate3d(-1360px, 0px, 0px);">
                            <li data-thumb="${ctx}${goods.cover}" class="clone" aria-hidden="true"
                                style="width: 340px; float: left; display: block;">
                                <div class="thumb-image"><img src="${ctx}${goods.cover}" data-imagezoom="true"
                                                              class="img-responsive" draggable="false"></div>
                            </li>
                            <li data-thumb="${ctx}${goods.image1}" style="width: 340px; float: left; display: block;"
                                class="flex-active-slide">
                                <div class="thumb-image"><img src="${ctx}${goods.image1}" data-imagezoom="true"
                                                              class="img-responsive" draggable="false"></div>
                            </li>
                            <li data-thumb="${ctx}${goods.image2}" style="width: 340px; float: left; display: block;"
                                class="">
                                <div class="thumb-image"><img src="${ctx}${goods.image2}" data-imagezoom="true"
                                                              class="img-responsive" draggable="false"></div>
                            </li>
<%--                            <li data-thumb="${ctx}${goods.image1}" style="width: 340px; float: left; display: block;"--%>
<%--                                class="">--%>
<%--                                <div class="thumb-image"><img src="${ctx}${goods.image1}" data-imagezoom="true"--%>
<%--                                                              class="img-responsive" draggable="false"></div>--%>
<%--                            </li>--%>
<%--                            <li data-thumb="${ctx}${goods.image2}" style="width: 340px; float: left; display: block;"--%>
<%--                                class="clone" aria-hidden="true">--%>
<%--                                <div class="thumb-image"><img src="${ctx}${goods.image2}" data-imagezoom="true"--%>
<%--                                                              class="img-responsive" draggable="false"></div>--%>
<%--                            </li>--%>
                        </ul>
                    </div>
<%--                    <ol class="flex-control-nav flex-control-thumbs">--%>
<%--                        <li><img src="${ctx}${goods.cover}" class="flex-active" draggable="false"></li>--%>
<%--                        <li><img src="${ctx}${goods.image1}" draggable="false" class=""></li>--%>
<%--                        <li><img src="${ctx}${goods.image2}" draggable="false" class=""></li>--%>
<%--                    </ol>--%>
                    <ul class="flex-direction-nav">
                        <li class="flex-nav-prev"><a class="flex-prev" href="http://localhost:8080/goods_detail?id=18#">Previous</a>
                        </li>
                        <li class="flex-nav-next"><a class="flex-next" href="http://localhost:8080/goods_detail?id=18#">Next</a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="col-md-4 single-grid simpleCart_shelfItem">
                <h3>${goods.name}</h3>
                <div class="tag">
                    <p style="color:red">分类 : ${goods.typename}</p>
                </div>
                <p>
                    ${goods.intro}</p>
                <div class="galry">
                    <div class="prices">
                        <h5 class="item_price">￥${goods.price}</h5>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="btn_form">
                    <a href="javascript:;" class="add-cart item_add" onclick="buy(${goods.id})">加入购物车</a>

                </div>
            </div>
            <div class="col-md-4 single-grid1">
                <!-- <h2>商品分类</h2> -->
                <ul>
                    <li><a href="${ctx}/goodslist?flag=list&typeid=0">全部系列</a></li>

                    <c:forEach var="t" items="${typelist}">
                    <li><a href="${ctx}/goodslist?flag=list&typeid=${t.id}">${t.name}</a></li>
                    </c:forEach>


                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>


<jsp:include page="footer.jsp"></jsp:include>

<script src="${ctx}/js/jquery.flexslider.js"></script>
</body>
</html>
