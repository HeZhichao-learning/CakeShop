<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/11/21
  Time: 8:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>header</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link type="text/css" rel="stylesheet" href="css/bootstrap.css">
    <link type="text/css" rel="stylesheet" href="css/style.css">
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${ctx}/css/layer.css">

    <%@ taglib prefix="c1" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctx" value="${pageContext.request.contextPath}"/>

</head>
<body>

<div class="header">
    <div class="container">
        <nav class="navbar navbar-default" role="navigation">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <h1 class="navbar-brand"><a href="http://localhost:8080/index"></a></h1>
            </div>
            <!--navbar-header-->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li><a href="${ctx}/index" class="${param.flag==1?'active':''}">首页</a></li>
                    <li class="dropdown ">
                        <a href="${ctx}/#" class="dropdown-toggle ${param.flag==2?'active':''}" data-toggle="dropdown">商品分类<b class="caret"></b></a>
                        <ul class="dropdown-menu multi-column columns-2">
                            <li>
                                <div class="row">
                                    <div class="col-sm-12">
                                        <h4>商品分类</h4>
                                        <ul class="multi-column-dropdown">
                                            <li><a class="list" href="${ctx}/goodslist?flag=list&typeid=0">全部系列</a>
                                            </li>

                                            <c:forEach var="t" items="${typelist}">
                                            <li><a class="list" href="${ctx}/goodslist?flag=list&typeid=${t.id}">${t.name}</a>
                                            </li>

                                            </c:forEach>



                                        </ul>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </li>
                    <li><a href="${ctx}/goodslist?flag=recommend&type=2" class="${param.flag==-2?'active':''}">热销</a></li>
                    <li><a href="${ctx}/goodslist?flag=recommend&type=3" class="${param.flag==-3?'active':''}">新品</a></li>


                    <li><a href="${ctx}/user_register.jsp" class="${param.flag==5?'active':''}">注册</a></li>
                    
                    <c:if test="${not empty loginuser}">
                        <li><a href="${ctx}/user_center.jsp" class="${param.flag==7?'active':''}">个人中心</a></li>
                        <li><a href="${ctx}/order_list" class="${param.flag==8?'active':''}">我的订单</a></li>
                        <li><a href="${ctx}/insertUser?flag=logout">退出登录</a></li>
                    </c:if>
                    
                    <c:if test="${empty loginuser}">
                    
                    <li><a href="${ctx}/login.jsp" class="${param.flag==6?'active':''}">登录</a></li>
                    </c:if>
                    <c:if test="${loginuser.isadmin==1}">
                    <li><a href="${ctx}/admin/index.jsp">后台管理</a></li>
                    </c:if>
                </ul>
                <!--/.navbar-collapse-->
            </div>
            <!--//navbar-header-->
        </nav>
        <div class="header-info">
            <div class="header-right search-box">
                <a href="javascript:;"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a>
                <div class="search">
                    <form class="navbar-form" action="${ctx}/goodslist?flag=search" method="post">
                        <input type="text" class="form-control" name="keyword">
                        <button type="submit" class="btn btn-default " aria-label="Left Align">搜索</button>
                    </form>
                </div>
            </div>

            <div class="header-right cart">
                <a href="${ctx}/goods_cart.jsp">
                    <span class="glyphicon glyphicon-shopping-cart " aria-hidden="true"><span class="card_num">${order.amount}</span></span>
                </a>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
</body>
</html>
