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

<title>Banner图设置</title>

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
.image img {
	width: 100%;
}

.image {
	width: 200px;
}

#changebannerimage {
	width: 500px;
	height: 200px; padding : 30px;
	background-color: #ccc;
	position: fixed;
	top: 0px;
	bottom: 0px;
	left: 0px;
	right: 0px;
	margin: auto;
	display: none;
	padding: 30px;
}

#changebannerimage .label {
	color: #000 !important;
}
</style>

<script type="text/javascript">
	bannerid = 1;
	function sumit(form) {
		$("#bannerid_form").val(bannerid);
		return true;
	};
	$(document).ready(function() {
		$(".change_btn").click(function() {
			var id = $(this).parent().siblings("#banner_id").text();
			bannerid = id;
			$("#changebannerimage").show();
		});
	});
</script>
</head>

<body>
	<jsp:include page="frame.jsp"></jsp:include>
	<div id="rightcontent">
		<h2>首页导航栏宣传图设置</h2>


		<table
			class="table table-hover table-striped table-condensed table-bordered">
			<thead>
				<tr>
					<th>id</th>
					<th>导航图</th>
					<th>更改时间</th>
					<th>内容说明</th>

				</tr>
			</thead>
			<tbody>
				<s:iterator value="list" id="l">

					<tr>

						<td id="banner_id">${l.id}</td>
						<td class="image"><img alt=""
							src="indexbannerimages/${l.image}"></td>
						<td>${l.time}</td>
						<td>${l.content}</td>
						<td><button class="change_btn btn btn-primary" >更换</button></td>
					</tr>

				</s:iterator>
			</tbody>
		</table>
	</div>
	<div style="clear: both;"></div>
	<div id="changebannerimage">
		<center>
			<s:form action="uploadimages" namespace="/admin" method="post"
				enctype="multipart/form-data" onsubmit="return sumit(this)">
				<s:file name="images" label="选择上传的图片"></s:file>
				<s:textfield label="id" name="id" id="bannerid_form"></s:textfield>
				<s:textfield label="说明" name="describe"></s:textfield>
				<s:submit value="提交"></s:submit>

			</s:form>
		</center>
	</div>
</body>
</html>
