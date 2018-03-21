<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'register.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
	function check(form) {
		var errors = document.getElementById("errorinfo");
		if (form.userId.value == "" || form.userName.value == ""
				|| form.userPassword.value == "") {
			errors.innerText = "请完整的输入信息！";
			return false;
		} else if (form.userPassword.value != form.userPasswordrep.value) {
			errors.innerText = "两次密码输入不一致！";
			return false;
		} else {
			return true
		}
	};

	$(document).ready(function() {
		$("#userId").blur(function() {
			$.post("servlet/registervalidation.servlet", {
				type : "add",
				userid : $("#userId").val()
			}, function(data, status) {
				var errors = document.getElementById("useriderror");
				if (data == "true") {
					errors.innerText = "用户名可以使用";
				} else {
					errors.innerText = "用户名已经存在";
				}
			});
		});
	});
</script>
<style type="text/css">
#register  ul li {
	list-style-type: none;
	padding: 0px;
	margin: 0px;
}

#register .container {
	width: 1200px
}

#register .re_middle {
	margin: 10px auto;
	width: 400px;
}
#register label{
color: black;
}
</style>
</head>

<body>
	<div>
		<jsp:include page="navbar.jsp"></jsp:include>
	</div>
	<div id="register">
	<div class="container">
		<div class="re_middle">
			<center>
			<h1>注册</h1>
			<s:form action="register" namespace="/login"
				onsubmit="return check(this)">
				<s:textfield name="userId" id="userId" label="用户名"></s:textfield>
				<s:label id="useriderror"></s:label>
				<s:textfield name="userName" label="呢称"></s:textfield>
				<s:radio list="#{'1':'男','2':'女'}" value="1" name="userSex"
					label="性别"></s:radio>
				<s:password name="userPassword" label="密码"></s:password>

				<s:password name="userPasswordrep" label="重复密码"></s:password>
				<s:label id="errorinfo"></s:label>
				<s:property value="result"/>
				<s:submit value="注册"></s:submit>
			
			</s:form>
			</center>
			
		</div>
	</div>
	</div>
</body>
</html>
