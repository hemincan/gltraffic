<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>管理交通标志</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%@taglib prefix="s" uri="/struts-tags"%>
</head>

<body>

	<jsp:include page="frame.jsp"></jsp:include>
	<div id="rightcontent">
		<h2>交通标志分类管理</h2>

		<table
			class="table table-hover table-striped table-condensed table-bordered">
			<thead>
				<tr>
					<th>id</th>
					<th>图</th>
					<th>类型名称</th>
					<th>类型说明</th>

				</tr>
			</thead>
			<tbody>
				<s:iterator value="list" id="t">

					<tr>
						<td id="type_id">${t.id}</td>
						<s:if test="#t.image!=null">
							<td class="image"><img alt=""
								src="learn/images/${t.image }"></td>
						</s:if>
						<s:if test="#t.image==null">
							<td class="image"><img alt="" src="learn/images/noimage.png"></td>
						</s:if>
						<td>${t.name }</td>
						<td>${t.describe }</td>

					</tr>

				</s:iterator>
			</tbody>
	</div>
</body>
</html>
