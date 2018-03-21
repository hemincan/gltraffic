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

<title>My JSP 'footer.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>
<style type="text/css">
#footer {
	background-color:#fff;
	height: 100px;
	font-family: 微软雅黑;
	font-size: 15px;
	padding: 20px;
	overflow: hidden;
	color: #000 !important;
}

#footer span {
	margin: 5px 10px 5px 10px;
}

#footer .below {
	text-align: center;
	margin: 10px;
}

#footer a {
	text-decoration: none;
	color: #000;
}

#footer a:hover {
	color: red;
}

#footer .center {
	text-align: center;
	margin: 5px;
}

.information {
	width: 900px;
	margin: 0 auto;
}

.one {
	float: left;
	width: 22%;
	height: 20px;
	margin: 2px;
	text-align: right;
}
</style>
<body>
	<div id="footer">
		<div class="information">
			<span><div class="one">
					<a href="">关于我们</a>
				</div></span> <span><div class="one">
					<a href="">友情链接</a>
				</div></span> <span><div class="one">
					<a href="">法律信息</a>
				</div></span> <span><div class="one">
					<a href="">广告合作</a>
				</div></span>
		</div>
		<div style="clear: both;"></div>
		<div class="center">
			<span>关于作者：</span> <span>桂林电子科技大学</span>|<span>计算机与信息安全学院</span> |<span>13003104班</span>
			|<span>何敏灿</span> |<span>毕业设计</span>

		</div>
		<div class="center">
			<span>联系方式</span> <span>QQ：1027871354</span> |<span>邮箱：www.can2014@live.cn</span>
		</div>
		<div class="below">
			<span>Copyright © 1999-2016, CSDN.NET, All Rights Reserved</span>
		</div>
	</div>
</body>
</html>
