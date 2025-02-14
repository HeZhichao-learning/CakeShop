<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/12/5
  Time: 10:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>goods_list</title>

    <link rel="stylesheet" href="${ctx}/admin/css/bootstrap.css">
</head>
<body>

<jsp:include page="header.jsp"/>


<div class="text-right"><a class="btn btn-warning" href="${ctx}/admin/goods_add.jsp">添加商品</a></div>
<br>

<ul role="tablist" class="nav nav-tabs">
    <li class="${tid==0?'active':''}" role="presentation"><a href="${ctx}/admin/goods?flag=list&type=0">全部商品</a></li>
    <li  class="${tid==1?'active':''}" role="presentation"><a href="${ctx}/admin/goods?flag=list&type=1">条幅推荐</a></li>
    <li class="${tid==2?'active':''}" role="presentation"><a href="${ctx}/admin/goods?flag=list&type=2">热销推荐</a></li>
    <li class="${tid==3?'active':''}" role="presentation"><a href="${ctx}/admin/goods?flag=list&type=3">新品推荐</a></li>
</ul>





<br>

<table class="table table-bordered table-hover">

    <tbody><tr>
        <th width="5%">ID</th>
        <th width="10%">图片</th>
        <th width="10%">名称</th>
        <th width="20%">介绍</th>
        <th width="10%">价格</th>
        <th width="10%">类目</th>
        <th width="25%">操作</th>
    </tr>

<c:forEach var="g" items="${goodsList}">
    <tr>
        <td><p>${g.id}</p></td>
        <td><p><a href="${ctx}/goodslist?flag=goodsDetail&id=${g.id}" target="_blank"><img src="${ctx}${g.cover}" width="100px" height="100px"></a></p></td>
        <td><p><a href="${ctx}/goodslist?flag=goodsDetail&id=${g.id}" target="_blank">${g.name}</a></p></td>
        <td><p>${g.intro}</p></td>
        <td><p>${g.price}</p></td>
        <td><p>${g.typename}</p></td>
        <td>
            <p>

                <c:if test="${g.tuijian==1}">
                <a class="btn btn-info" href="${ctx}/admin/goods?id=${g.id}&flag=recommend&method=delete&typeTarget=1">移出条幅</a>
                </c:if>

                <c:if test="${g.tuijian!=1}">
                <a class="btn btn-primary" href="${ctx}/admin/goods?id=${g.id}&flag=recommend&method=add&typeTarget=1">加入条幅</a>
                </c:if>


                <c:if test="${g.tuijian==2}">
                    <a class="btn btn-info" href="${ctx}/admin/goods?id=${g.id}&flag=recommend&method=delete&typeTarget=2">移出热销</a>
                </c:if>

                <c:if test="${g.tuijian!=2}">
                    <a class="btn btn-primary" href="${ctx}/admin/goods?id=${g.id}&flag=recommend&method=add&typeTarget=2">加入热销</a>
                </c:if>


                <c:if test="${g.tuijian==3}">
                    <a class="btn btn-info" href="${ctx}/admin/goods?id=${g.id}&flag=recommend&method=delete&typeTarget=3">移出新品</a>
                </c:if>

                <c:if test="${g.tuijian!=3}">
                    <a class="btn btn-primary" href="${ctx}/admin/goods?id=${g.id}&flag=recommend&method=add&typeTarget=3">加入新品</a>
                </c:if>


            </p>
            <a class="btn btn-success" href="${ctx}/admin/goods?flag=edit&id=${g.id}&pno=${pno}&type=${tid}">修改</a>
            <a class="btn btn-danger" href="${ctx}/admin/goods?flag=delete&id=${g.id}&pno=${pno}&type=${tid}">删除</a>
        </td>
    </tr>


</c:forEach>


    </tbody></table>

<br>



<div style="text-align:center;">
    <a class="btn btn-info" href="${ctx}/admin/goods?type=${tid}&pno=1">首页</a>
    <a class="btn btn-info" href="${ctx}/admin/goods?type=${tid}&pno=${pno==1?1:pno-1}">上一页</a>
    <h3 style="display:inline;">[${pno}/${pcount}]</h3>
    <h3 style="display:inline;">[${count}]</h3>
    <a class="btn btn-info" href="${ctx}/admin/goods?type=${tid}&pno=${pno==pcount?pcount:pno+1}" >下一页</a>
    <a class="btn btn-info" href="${ctx}/admin/goods?type=${tid}&pno=${pcount}">尾页</a>
    <input type="text" class="form-control" style="display:inline;width:60px;" value=""><a class="btn btn-info" href="javascript:void(0);" onclick="location.href='${ctx}/admin/goods?pno='+(this.previousSibling.value)+'&type=${tid}'">GO</a>
</div>

<br>
</div>
</body>
</html>
