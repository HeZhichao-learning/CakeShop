<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/12/10
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>goods_edit</title>

    <link rel="stylesheet" href="${ctx}/admin/css/bootstrap.css">
</head>
<body>
<div class="container-fluid">

<jsp:include page="header.jsp"/>

    <form class="form-horizontal" action="${ctx}/admin/goods?flag=update" method="post" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${goods.id}">
        <input type="hidden" name="cover" value="${goods.cover}">
        <input type="hidden" name="image1" value="${goods.image1}">
        <input type="hidden" name="image2" value="${goods.image2}">
        <input type="hidden" name="pno" value="${pno}">
        <input type="hidden" name="type" value="${tid}">
        <div class="form-group">
            <label for="input_name1" class="col-sm-1 control-label">名称</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="input_name1" name="name" value="${goods.name}" required="required">
            </div>
        </div>
        <div class="form-group">
            <label for="input_name2" class="col-sm-1 control-label">价格</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="input_name2" name="price" value="${goods.price}">
            </div>
        </div>
        <div class="form-group">
            <label for="input_name3" class="col-sm-1 control-label">介绍</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="input_name3" name="intro" value="${goods.intro}">
            </div>
        </div>
        <div class="form-group">
            <label for="input_name4" class="col-sm-1 control-label">库存</label>
            <div class="col-sm-6">
                <input type="text" class="form-control" id="input_name4" name="stock" value="${goods.stock}">
            </div>
        </div>
        <div class="form-group">
            <label for="input_file" class="col-sm-1 control-label">封面图片</label>
            <div class="col-sm-6"><img src="${ctx}${goods.cover}" width="100" height="100">
                <input type="file" name="cover1" id="input_file1">推荐尺寸: 500 * 500
            </div>
        </div>
        <div class="form-group">
            <label for="input_file" class="col-sm-1 control-label">详情图片1</label>
            <div class="col-sm-6"><img src="${ctx}${goods.image1}" width="100" height="100">
                <input type="file" name="image11" id="input_file2">推荐尺寸: 500 * 500
            </div>
        </div>
        <div class="form-group">
            <label for="input_file" class="col-sm-1 control-label">详情图片2</label>
            <div class="col-sm-6"><img src="${ctx}${goods.image2}" width="100" height="100">
                <input type="file" name="image21" id="input_file">推荐尺寸: 500 * 500
            </div>
        </div>
        <div class="form-group">
            <label for="select_topic" class="col-sm-1 control-label">类目</label>
            <div class="col-sm-6">
                <select class="form-control" id="select_topic" name="type_id">


                    <c:forEach var="t" items="${typelist}">
                    <option value="${t.id}"  ${goods.type_id==t.id?"selected":""}>${t.name}</option>
                    </c:forEach>

                </select>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-10">
                <button type="submit" class="btn btn-success">提交修改</button>
            </div>
        </div>
    </form>


</div>
</body>
</html>
