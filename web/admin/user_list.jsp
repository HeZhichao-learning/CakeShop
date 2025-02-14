<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/12/3
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>user_list</title>
    <link rel="stylesheet" href="${ctx}/admin/css/bootstrap.css">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>


<div class="container-fluid">



    <div class="text-left">
        <a class="btn btn-warning" href="${ctx}/user_register.jsp">添加客户</a>
        <a class="btn btn-warning" href="${ctx}/export">导出Excel</a>
    </div>


    <br>
    <div class="form-group">
        <form action="${ctx}/admin/user?flag=list" method="post" class="form-inline">
            <div class="input-group">
                <input type="text" name="username" class="form-control" placeholder="用户名">
                <span class="input-group-addon">或</span>
                <input type="text" name="name" class="form-control" placeholder="收件人">
                <span class="input-group-addon">或</span>
                <input type="text" name="phone" class="form-control" placeholder="电话">
                <span class="input-group-btn">
        <button type="submit" class="btn btn-default">搜索</button>
                </span>
            </div>
        </form>
    </div>
    <br>

    <table class="table table-bordered table-hover">

        <tbody><tr>
            <th width="5%">ID</th>
            <th width="5%">用户名</th>
            <th width="5%">密码</th>
            <th width="10%">邮箱</th>
            <th width="10%">收件人</th>
            <th width="10%">电话</th>
            <th width="10%">地址</th>
            <th width="10%">操作</th>
        </tr>


<c:forEach var="u" items="${userList}">
        <tr>
            <td><p>${u.id}</p></td>
            <td><p>${u.username}</p></td>
            <td><p>${u.password}</p></td>
            <td><p>${u.email}</p></td>
            <td><p>${u.name}</p></td>
            <td><p>${u.phone}</p></td>
            <td><p>${u.address}</p></td>
            <td>
                <a class="btn btn-info" href="${ctx}/admin/user_reset.jsp?id=${u.id}&username=${u.username}&email=${u.email}">重置密码</a>
                <a class="btn btn-primary" href="${ctx}/admin/user?flag=edit&id=${u.id}">修改</a>
                <a class="btn btn-danger" href="${ctx}/admin/user?flag=delete&id=${u.id}">删除</a>
            </td>
        </tr>
        </c:forEach>


        </tbody></table>

    <br>

<c:set var="key" value="name=${name}&username=${username}&phone=${phone}"></c:set>

    <div style="text-align:center;">
        <a class="btn btn-info" href="${ctx}/admin/user?flag=list&pno=1&${key}">首页</a>
        <a class="btn btn-info" href="${ctx}/admin/user?flag=list&pno=${pno==1?1:pno-1}&${key}">上一页</a>
        <h3 style="display:inline;">[${pno}/${pcount}]</h3>

        <a class="btn btn-info" href="${ctx}/admin/user?flag=list&pno=${pno==pcount?pcount:pno+1}&${key}" ${pno==pcount?'disabled':''}>下一页</a>
        <a class="btn btn-info" href="${ctx}/admin/user?flag=list&pno=${pcount}&${key}">尾页</a>
        <input type="text" class="form-control" style="display:inline;width:60px;" value=""><a class="btn btn-info" href="javascript:void(0);" onclick="location.href='${ctx}/admin/user?pno='+(this.previousSibling.value)+'&flag=list&${key}'">GO</a>
    </div>

    <br>


</div>


</body>
</html>
