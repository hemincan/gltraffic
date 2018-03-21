<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'login.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
#loginpage {
	width: 250px;
	height: 280px;
	background-color: #fff;
	border: 1px solid #ccc;
	color: black;
}

#loginpage {
	font-size: 15px;
}

#loginpage h2 {
	font-size: 18px;
}

.login_headimg {
	width: 30%;
	margin-top: 20px;
}

#logout {
	margin-top: 20px;
}

#haventread {
	color: red;
	font-size: 20px;
}

#haventread_messb {
	color: red;
	font-size: 20px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$.ajax({
			type : "post",
			url : "ajax/aboutme",
			data : {

			},
			dataType : "json",
			success : function(data) {
				//alert(data);
				var d = eval("(" + data + ")");
				$("#haventread").text(d.comment);
				$("#haventread_messb").text(d.messbcount);
			},
			error : function() {

			},

		});
	});
</script>
</head>

<body>
	<div id="loginpage">
		<center>
			<s:if test="#session.userid!=null">
				<div class="login_headimg">
					<img alt="" src="/upload/${session.userid}/headimg.jpg"
						onerror="this.src='images/defaultimg.jpg'">
				</div>
					<img src="icon/person.png" class="iconimg"/><s:property value="#session.username"></s:property>
				<br>
				<s:property value="#session.indentity"></s:property>
				<br>
				<s:if test="#session.indentity=='管理员'">
					<a href="adminsystem/index.jsp" style="color: red;">管理员系统入口</a>
				</s:if>
				<br>
				<s:div>
					<!-- 
					<s:a href="index_exposed.jsp">
						<button style="height: 40px;width:200px; background-color: blue; ">我要曝光</button>
					</s:a>
					 -->
				</s:div>
				<a href="aboutme.jsp"><img src="icon/volume_down.png" class="iconimg"/>与你相关(<span id="haventread"></span>)
				</a>
				<br>
				<a href="mypage_messboard.jsp"><img src="icon/email.png" class="iconimg"/>未读留言(<span id="haventread_messb"></span>)
				</a>
				<div id="logout">
					<a href="sessionclear.jsp" style="color: blue;"><img src="icon/clear.png" class="iconimg"/>退出登录</a>
				</div>
			</s:if>
			<s:else>
				<h2>登录</h2>
				<div style="padding: 20px;">
					<div class="input-group">
						<span class="input-group-addon">帐号</span> <input type="text"
							id="form_userid" class="form-control" placeholder="用户名">
					</div>

					<div class="input-group">
						<span class="input-group-addon">密码</span> <input type="password"
							id="form_password" class="form-control" placeholder="密码">
					</div>
					<br> <span id="errorinfo"></span>
					<button type="sumbit" class="btn btn-primary btn-block"
						id="user_login">登 录</button>
					<br> <a href="register.jsp"><button type="button"
							class="btn btn-link btn-block">没有帐号？，注册一个</button></a>
				</div>
			</s:else>
		</center>
	</div>
</body>
<script type="text/javascript">
	$("#user_login").click(function() {
		var userid = $("#form_userid").val();
		var password = $("#form_password").val();
		if (userid == "" || password == "") {
			$("#errorinfo").text("填写帐号和密码");
			return;
		}
		$.ajax({
			type : "post",
			url : "ajax/login",
			data : {
				'userid' : userid,
				'password' : password,
			},
			dataType : "json",
			success : function(data) {
				data = eval("(" + data + ")");
				if (data.code == 1) {
					$("#errorinfo").text("登入成功");
					location.href = 'index.jsp';
				} else if (data.code == 2) {

					$("#errorinfo").text("用户名或者密码不正确");
				}
			},
			error : function() {

			},

		});
	});
</script>
</html>
