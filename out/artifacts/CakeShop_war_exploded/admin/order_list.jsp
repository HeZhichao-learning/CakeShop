<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/12/11
  Time: 9:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>order_list</title>
    <link rel="stylesheet" href="${ctx}/admin/css/bootstrap.css">

</head>
<body>
<div class="container-fluid">
<jsp:include page="header.jsp"/>



    <ul role="tablist" class="nav nav-tabs">
        <li class="${status==0?'active':''}" role="presentation"><a href="${ctx}/admin/order?">全部订单</a></li>
        <li class="${status==1?'active':''}" role="presentation"><a href="${ctx}/admin/order?status=1">未付款</a></li>
        <li class="${status==2?'active':''}" role="presentation"><a href="${ctx}/admin/order?status=2">已付款</a></li>
        <li class="${status==3?'active':''}" role="presentation"><a href="${ctx}/admin/order?status=3">配送中</a></li>
        <li class="${status==4?'active':''}" role="presentation"><a href="${ctx}/admin/order?status=4">已完成</a></li>
    </ul>

    <br>

    <table class="table table-bordered table-hover">

        <tbody><tr>
            <th width="5%">ID</th>
            <th width="5%">总价</th>
            <th width="15%">商品详情</th>
            <th width="15%">收货信息</th>
            <th width="10%">订单状态</th>
            <th width="10%">支付方式</th>
            <th width="10%">下单用户</th>
            <th width="10%">下单时间</th>
            <th width="15%">操作</th>
        </tr>

<c:forEach items="${orderList}" var="order">
        <tr>
            <td><p>${order.id}</p></td>
            <td><p>${order.total}</p></td>
            <td>
                <c:forEach var="item" items="${order.itemList}">
                <p>${item.goods.name}(${item.goods.price}) x ${item.amount}</p>
                </c:forEach>
            </td>
            <td>
                <p>${order.name}</p>
                <p>${order.phone}</p>
                <p>${order.address}</p>
            </td>
            <td>
                <p>
                    <c:if test="${order.status==1}">
                    <span style="color:red;">已付款</span>
                    </c:if>
                    <c:if test="${order.status==2}">
                        <span style="color:red;">未付款</span>
                    </c:if>
                    <c:if test="${order.status==3}">
                        <span style="color:green;">已发货</span>
                    </c:if>
                    <c:if test="${order.status==4}">
                        <span style="color:black;">已完成</span>
                    </c:if>

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
            <td><p>${order.username}</p></td>
            <td><p>${order.datetime}</p></td>
            <td>
                <c:if test="${order.status==1||order.status==2}">
                <a class="btn btn-success" href="${ctx}/admin/order?flag=operate&id=${order.id}&status=3">发货</a>
                </c:if>
                <c:if test="${order.status!=4}">
                    <a class="btn btn-primary" href="${ctx}/admin/order?flag=operate&id=${order.id}&status=4">完成</a>
                </c:if>

                <a class="btn btn-danger" href="${ctx}/admin/order?flag=delete&id=${order.id}&pno=${pno}&status=${status}">删除</a>

            </td>
        </tr>
</c:forEach>
        </tbody></table>

    <br>



    <div style="text-align:center;">
        <a class="btn btn-info" href="${ctx}/admin/order?pno=1&status=${status}">首页</a>
        <a class="btn btn-info" href="${ctx}/admin/order?pno=${pno==1?1:pno-1}&status=${status}">上一页</a>
        <h3 style="display:inline;">[${pno}/${pcount}]</h3>
        <h3 style="display:inline;">[${pcount}]</h3>
        <a class="btn btn-info" href="${ctx}/admin/order?pno=${pno==pcount?pcount:pno+1}&status=${status}">下一页</a>
        <a class="btn btn-info" href="${ctx}/admin/order?pno=${pcount}&status=${status}">尾页</a>
        <input type="text" class="form-control" style="display:inline;width:60px;" value=""><a class="btn btn-info" href="javascript:void(0);" onclick="location.href='${ctx}/admin/order?pno='+(this.previousSibling.value)+'&status=${status}'">GO</a>
    </div>

















</div>
</body>
</html>
