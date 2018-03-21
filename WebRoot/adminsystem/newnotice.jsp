<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	Object indentity = session.getAttribute("indentity");

	if (indentity == null || !"管理员".equals(indentity.toString())) {
		response.sendRedirect("fail.jsp");
	} else {
		
	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>发布公告</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- umeditor引用 -->
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<link href="adminsystem/umeditor/themes/default/css/umeditor.css"
	type="text/css" rel="stylesheet">
<script type="text/javascript"
	src="adminsystem/umeditor/third-party/template.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="adminsystem/umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="adminsystem/umeditor/umeditor.min.js"></script>
<script type="text/javascript"
	src=adminsystem/umeditor/lang/zh-cn/zh-cn.js"></script>
<%@taglib prefix="s" uri="/struts-tags"%>
<script>
	var UEDITOR_HOME_URL = "/gltraffic/adminsystem/umeditor/";
</script>

</head>

<body>

	<jsp:include page="frame.jsp"></jsp:include>
	<div id="rightcontent">
		<h1>发布新的公告</h1>
		<div class="input-group">
			<span class="input-group-addon">标题:</span> <input type="texts"
				id="tiltle_bb" class="form-control" placeholder="请输入标题">
		</div>
		<div style="clear: both;"></div>
		<div style="margin-top: 20px;"></div>
		<script type="text/plain" id="myEditor"
			style="width:100%;height:240px;"></script>
		<script type="text/javascript">
			//实例化编辑器
			var um = UM.getEditor('myEditor');
		</script>

		<div style="display: none;">
			<s:form action="newnoticeadmin" namespace="/admin"
				name="newtopic_form" method="post" enctype="multipart/form-data">
				<s:textfield label="文章" name="notice.noticeTiltle" id="tiltle"></s:textfield>
				<s:textfield label="文章" name="notice.noticeContent" id="content"></s:textfield>
				<s:submit value="提交"></s:submit>
			</s:form>
		</div>
		<button id="newtopic_submit" class="btn btn-info"
			style="margin-top: 20px;float: right;">提交</button>
	</div>

</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#newtopic_submit").click(function() {
			if (!um.hasContents() || $("#tiltle_bb").val() == "") {
				alert("标题和内容都不能为空，管理员");
				return false;
			}
			//alert(um.hasContents());
			var c = um.getContent();
			$("#tiltle").val($("#tiltle_bb").val());
			$("#content").val(c);
			document.newtopic_form.submit();

		});
	});
</script>
</html>
