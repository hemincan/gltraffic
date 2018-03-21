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

<title>管理交规类型</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<%@taglib prefix="s" uri="/struts-tags"%>
<style type="text/css">
#addnewtype  .label {
	color: #000 !important;
}

#addnewtype {
	background: #ccc;
	padding: 20px;
}
.image img{
	width: 100px;
}
</style>
</head>

<jsp:include page="frame.jsp"></jsp:include>
<div id="rightcontent">
	<h2>交通标志分类管理</h2>


	<table
		class="table table-hover table-striped table-condensed table-bordered">
		<thead>
			<tr>
				<th>id</th>
				<th>首页图</th>
				<th>类型名称</th>
				<th>类型说明</th>

			</tr>
		</thead>
		<tbody>
			<s:iterator value="typelist" id="t">

				<tr>

					<td id="type_id">${t.id}</td>
					<s:if test="#t.typeImage!=null">
						<td class="image"><img alt=""
							src="learn/indeximages/${t.typeImage }"></td>
					</s:if>
					<s:if test="#t.typeImage==null">
						<td class="image"><img alt=""
							src="learn/indeximages/noimage.png"></td>
					</s:if>
					<td>${t.typeName }</td>
					<td>${t.typeDescribe }</td>

					<td><a href="admin/managemark?id=${t.id}"><button class="change_btn">查看此类型</button></a></td>
				</tr>

			</s:iterator>
		</tbody>
	</table>
	<button>增加新类型</button>
	<div id="addnewtype">
		<h3>增加新的交通标识类型</h3>
		<s:form action="newtype" namespace="/admin" method="post"
			enctype="multipart/form-data">
			<s:file label="首页显示的图片" name="images"></s:file>
			<s:textfield label="类型名称" name="type.typeName"></s:textfield>
			<s:textfield label="类型说明" name="type.typeDescribe"></s:textfield>
			<s:submit value="提交"></s:submit>
		</s:form>

	</div>
</div>

</body>
</html>
