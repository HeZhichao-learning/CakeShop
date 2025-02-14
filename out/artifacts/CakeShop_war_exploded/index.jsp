<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/11/19
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
  <head>
    <title>index</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="${ctx}/css/style.css">
    <script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
    <script type="text/javascript" src="${ctx}/js/bootstrap.min.js"></script>
    <script src="${ctx}/css/layer.css"></script>
    <script src="${ctx}/js/layer.js"></script>
    <script src="${ctx}/js/cart.js"></script>
    <script src="${ctx}/js/jquery.flexslider.js"></script>
    <link rel="stylesheet" href="${ctx}/css/layer.css">
  </head>
  <body>


  <jsp:include page="header.jsp?flag=1"></jsp:include>

  <!--banner-->

  <!--banner 条幅-->
  <div class="banner">
    <div class="container">
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators" id="olnum">

          <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>

          <li data-target="#carousel-example-generic" data-slide-to="2" class="active"></li>


        </ol>

        <!-- Wrapper for slides -->
        <!--轮播图-->
        <div class="carousel-inner" role="listbox" id="lunbotu" style="width: 100%; height: 432px;">
          <!--遍历条幅-->


          <c:forEach var="g" items="${bannerlist}" varStatus="status">
          <div class="item ${status.index==1?'active':''}">
            <h2 class="hdng"><a href="${ctx}/goodslist?flag=goodsDetail&id=${g.id}">${g.name}</a><span></span></h2>
            <p>今日精选推荐</p>
            <a class="banner_a" href="javascript:;" onclick="buy(${g.id})">立刻购买</a>
            <div class="banner-text">
              <a href="${ctx}/goodslist?flag=goodsDetail&id=${g.id}">
                <img src="${ctx}${g.cover}" alt="${g.name}" width="350" height="350">
              </a>
            </div>
          </div>
          </c:forEach>
<%--          <div class="item active">--%>
<%--            <h2 class="hdng"><a href="http://localhost:8081/cakeShop_war_exploded/goods_detail?id=16">草莓冰淇淋</a><span></span></h2>--%>
<%--            <p>今日精选推荐</p>--%>
<%--            <a class="banner_a" href="javascript:;" onclick="buy(16)">立刻购买</a>--%>
<%--            <div class="banner-text">--%>
<%--              <a href="http://localhost:8081/cakeShop_war_exploded/goods_detail?id=16">--%>
<%--                <img src="${ctx}/picture/9-1.jpg" alt="草莓冰淇淋" width="350" height="350">--%>
<%--              </a>--%>
<%--            </div>--%>
<%--          </div>--%>


        </div>
        <!--end 轮播图-->
        <!-- Controls -->
        <a style="background-image: none;position: relative;left: 5%;top:-100px" class="left carousel-control" href="http://localhost:8081/cakeShop_war_exploded/index#carousel-example-generic" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        </a>
        <a style="background-image: none;position: relative;left: 95%;top:-100px" class="right carousel-control" href="http://localhost:8081/cakeShop_war_exploded/index#carousel-example-generic" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        </a>
      </div>
    </div>
  </div>
  <!--end banner-->
  <!--//banner-->
  <div class="subscribe2"></div>
  <!--热销推荐-->
  <!--gallery-->
  <div class="gallery">
    <div class="container">
      <div class="alert alert-danger">热销推荐</div>
      <div class="gallery-grids">

        <c:forEach var="g" items="${hotlist}">


        <div class="col-md-4 gallery-grid glry-two">
          <a href="${ctx}/goodslist?flag=goodsDetail&id=${g.id}">
            <img src="${ctx}${g.cover}" class="img-responsive" alt="玫瑰舒芙蕾" width="350" height="350">
          </a>
          <div class="gallery-info galrr-info-two">
            <p>
              <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
              <a href="${ctx}/goodslist?flag=goodsDetail&id=${g.id}">查看详情</a>
            </p>
            <a class="shop" href="javascript:;" onclick="buy(${g.id})">立刻购买</a>
            <div class="clearfix"></div>
          </div>
          <div class="galy-info">
            <p>$${g.typename}儿童系列 &gt; ${g.name}</p>
            <div class="galry">
              <div class="prices">
                <h5 class="item_price">${g.price}</h5>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>

        </c:forEach>
      </div>
      <!--end 热销推荐-->
      <!--新品推荐-->
      <div class="clearfix"></div>
      <div class="alert alert-info">新品推荐</div>
      <div class="gallery-grids">

<c:forEach var="g" items="${newlist}">
        <div class="col-md-3 gallery-grid ">
          <a href="${ctx}/goodslist?flag=goodsDetail&id=${g.id}">
            <img src="${ctx}${g.cover}" class="img-responsive" alt="玫瑰舒芙蕾">
          </a>
          <div class="gallery-info">
            <p>
              <span class="glyphicon glyphicon-eye-open" aria-hidden="true"></span>
              <a href="${ctx}/goodslist?flag=goodsDetail&id=${g.id}">查看详情</a>
            </p>
            <a class="shop" href="javascript:;" onclick="buy(${g.id})">立刻购买</a>
            <div class="clearfix"></div>
          </div>
          <div class="galy-info">
            <p>${g.typename}儿童系列&gt; ${g.name}</p>
            <div class="galry">
              <div class="prices">
                <h5 class="item_price">${g.price}</h5>
              </div>
              <div class="clearfix"></div>
            </div>
          </div>
        </div>
        </c:forEach>

      </div>
      <!--end 新品推荐-->
    </div>
  </div>
  <div class="subscribe"></div>


  <!--footer-->
  <jsp:include page="footer.jsp"></jsp:include>

  </body>
</html>
