<%--
  Created by IntelliJ IDEA.
  User: he
  Date: 2024/12/9
  Time: 16:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html>
<head>
    <title>商品管理</title>

  <link rel="stylesheet" href="${ctx}/admin/css/bootstrap.css">
</head>
<body>

<div class="container-fluid">
<jsp:include page="header.jsp"/>


<form class="form-horizontal" action="${ctx}/admin/goods?flag=add" method="post" enctype="multipart/form-data">
  <div class="form-group">
    <label for="input_name" class="col-sm-1 control-label">名称</label>
    <div class="col-sm-6">
      <input type="text" class="form-control" id="input_name" name="name" required="required">
    </div>
  </div>
  <div class="form-group">
    <label for="input_name" class="col-sm-1 control-label">价格</label>
    <div class="col-sm-6">
      <input type="text" class="form-control" id="input_name2" name="price">
    </div>
  </div>
  <div class="form-group">
    <label for="input_name" class="col-sm-1 control-label">介绍</label>
    <div class="col-sm-6">
      <input type="text" class="form-control" id="input_name3" name="intro">
    </div>
  </div>
  <div class="form-group">
    <label for="input_name" class="col-sm-1 control-label">库存</label>
    <div class="col-sm-6">
      <input type="text" class="form-control" id="input_name4" name="stock">
    </div>
  </div>
  <div class="form-group">
    <label for="input_file" class="col-sm-1 control-label">封面图片</label>
    <div class="col-sm-6">
      <input type="file" name="cover" id="input_file" required="required">推荐尺寸: 500 * 500
    </div>
  </div>
  <div class="form-group">
    <label for="input_file" class="col-sm-1 control-label">详情图片1</label>
    <div class="col-sm-6">
      <input type="file" name="image1" id="input_file1" required="required">推荐尺寸: 500 * 500
    </div>
  </div>
  <div class="form-group">
    <label for="input_file" class="col-sm-1 control-label">详情图片2</label>
    <div class="col-sm-6">
      <input type="file" name="image2" id="input_file2" required="required">推荐尺寸: 500 * 500
    </div>
  </div>
  <div class="form-group">
    <label for="select_topic" class="col-sm-1 control-label">类目</label>
    <div class="col-sm-6">
      <select class="form-control" id="select_topic" name="type_id">

<c:forEach items="${typelist}" var="t">
        <option value="${t.id}">${t.name}</option>
</c:forEach>
      </select>

    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-1 col-sm-10">
      <button type="submit" class="btn btn-success">提交保存</button>
    </div>
  </div>
</form>

</div>
</body>
</html>
