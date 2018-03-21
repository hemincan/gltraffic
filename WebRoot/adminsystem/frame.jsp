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

<title>My JSP 'index.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="bootstrap/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript" src="js/highcharts.src.js"></script>
<style type="text/css">
#head {
	height: 80px;
	width: 100%;
	background-color: #317eb4;
	border-bottom: 5px solid yellow;
}

#leftnav {
	float: left;
	width: 15%;
	background-color: #000;
	height: auto !important;
}

#leftnav li:hover {
	background-color: #ddd;
}

#leftnav a {
	color: #000;
}

#rightcontent {
	float: left;
	width: 85%;
	height: auto;
	padding: 0px 50px 50px 50px;
}

#head1 {
	font-size: 50px;
	color: white;
}

.list-group-item {
	height: 30px;
	line-height: 12px;
}
</style>
<style type="text/css">
body {
	margin: 0;
	padding: 0;
	overflow-x: hidden;
}

html,body {
	height: 100%;
}

img {
	border: none;
}

* {
	font-family: '微软雅黑';
	font-size: 12px;
	color: #626262;
}

dl,dt,dd {
	display: block;
	margin: 0;
}

a {
	text-decoration: none;
}

#bg {
	background-image: url(adminsystem/images/content/dotted.png);
}

.container {
	width: 200px;
	height: 100%;
	margin: auto;
}

/*left*/
.leftsidebar_box {
	width: 100%;
	height: 100% !important;
	overflow: visible !important;
	background-color: #3992d0;
}

.line {
	height: 2px;
	width: 100%;
	background-image: url(adminsystem/images/left/line_bg.png);
	background-repeat: repeat-x;
}

.leftsidebar_box dt {
	padding-left: 40px;
	padding-right: 10px;
	background-repeat: no-repeat;
	background-position: 10px center;
	color: #f5f5f5;
	font-size: 14px;
	position: relative;
	line-height: 48px;
	cursor: pointer;
}

.leftsidebar_box dd {
	background-color: #317eb4;
	padding-left: 40px;
}

.leftsidebar_box dd a {
	color: #f5f5f5 !important;
	line-height: 20px;
	font-size: 15px;
}

.leftsidebar_box dt img {
	position: absolute;
	right: 10px;
	top: 20px;
}

.system_log dt {
	background-image: url(adminsystem/images/left/system.png)
}

.custom dt {
	background-image: url(adminsystem/images/left/custom.png)
}

.channel dt {
	background-image: url(adminsystem/images/left/channel.png)
}

.app dt {
	background-image: url(adminsystem/images/left/app.png)
}

.cloud dt {
	background-image: url(adminsystem/images/left/cloud.png)
}

.syetem_management dt {
	background-image: url(adminsystem/images/left/syetem_management.png)
}

.source dt {
	background-image: url(adminsystem/images/left/source.png)
}

.statistics dt {
	background-image: url(adminsystem/images/left/statistics.png)
}

.leftsidebar_box dl dd:last-child {
	padding-bottom: 10px;
}
</style>

</head>

<body id="bg">
	<div id="head">
		<span id="head1">桂林交通曝光平台管理员系统</span> <span><a href="#"
			target="_blank" style="color: white;">进入用户平台主页</a></span>
	</div>
	<!-- <div id="leftnav">

		<li class="list-group-item active">菜单
		<li class="list-group-item" id="topics"><a
			href="admin/usertopics.action">用户的帖子管理</a></li>
		<li class="list-group-item"><a href="admin/bannerlist.action">首页宣传图设置</a></li>
		<li class="list-group-item">二级菜单</li>
		</li>

		<li class="list-group-item active">交规学习模块管理
		<li class="list-group-item"><a href="admin/typelist.action">交通标志分类管理</a></li>
		<li class="list-group-item"><a href="adminsystem/newairtle.jsp">增加交规学习文章</a></li>
		<li class="list-group-item"><a href="admin/manneragearticle">管理交规学习文章</a></li>
		</li>

		<li class="list-group-item active">公告与新闻
		<li class="list-group-item"><a href="adminsystem/newnotice.jsp">增加公告</a></li>
		<li class="list-group-item"><a href="admin/noticelist.action">管理公告</a></li>

		</li>



		<li class="list-group-item active">统计
		<li class="list-group-item"><a href="admin/totalclick?type=today">点击量统计</a></li>
		<li class="list-group-item"><a
			href="admin/areastatistic?type=today">地区发帖数</a></li>
		<li class="list-group-item"><a
			href="admin/typestatistic?type=today">爆光类型统计</a></li>
		<li class="list-group-item active">地区和类型统计
		<li class="list-group-item"><a
			href="admin/typeareastatistic?type=today&area=七星区">七星区</a></li>
		<li class="list-group-item"><a
			href="admin/typeareastatistic?type=today&area=叠彩区">叠彩区</a></li>
		<li class="list-group-item"><a
			href="admin/typeareastatistic?type=today&area=象山区">象山区</a></li>
		<li class="list-group-item"><a
			href="admin/typeareastatistic?type=today&area=秀峰区">秀峰区</a></li>
		<li class="list-group-item"><a
			href="admin/typeareastatistic?type=today&area=临桂区">临桂区</a></li>
		<li class="list-group-item"><a
			href="admin/typeareastatistic?type=today&area=雁山区">雁山区</a></li>
		<li class="list-group-item"><a
			href="admin/typeareastatistic?type=today&area=其他">其他</a></li>
		</li>

		</li>
		<li class="list-group-item active">用户统计
		<li class="list-group-item"><a href="admin/userstatistic">注册用户</a></li>
		</li>


	</div>
 -->
	<div id="leftnav">
		<div class="leftsidebar_box">
			<div class="line"></div>
			<dl class="system_log">
				<dt>
					网站维护<img src="adminsystem/adminsystem/images/left/select_xl01.png">
				</dt>
				<dd class="first_dd">
					<a href="admin/bannerlist.action">首页宣传图设置</a>

				</dd>
				<dd>
					<a href="adminsystem/newairtle.jsp">增加交规学习文章</a>

				</dd>
				<dd>
					<a href="admin/manneragearticle">管理交规学习文章</a>
				</dd>
				<dd>
					<a href="admin/typelist.action">交通标志分类管理</a>
				</dd>
				<dd>
					<a href="adminsystem/newnotice.jsp">增加公告</a>
				</dd>
				<dd>
					<a href="admin/noticelist.action">管理公告</a>
				</dd>

			</dl>

			<dl class="custom">
				<dt>
					用户管理<img src="adminsystem/images/left/select_xl01.png">
				</dt>
				<dd class="first_dd">
					<a href="admin/userstatistic">注册用户统计</a>
				</dd>
				<dd>
					<a href="admin/userlist">注册用户</a>
				</dd>
			</dl>

			<dl class="channel">
				<dt>
					帖子管理<img src="adminsystem/images/left/select_xl01.png">
				</dt>
				<dd class="first_dd">
					<a href="admin/usertopics.action">用户的帖子管理</a>
				</dd>

			</dl>

			<!--<dl class="app">
				<dt onClick="changeImage()">
					APP管理<img src="adminsystem/images/left/select_xl01.png">
				</dt>
				<dd class="first_dd">
					<a href="#">App运营商管理</a>
				</dd>
				<dd>
					<a href="#">开放接口管理</a>
				</dd>
				<dd>
					<a href="#">接口类型管理</a>
				</dd>
			</dl>-->

			<!-- <dl class="cloud">
				<dt>
					大数据云平台<img src="adminsystem/images/left/select_xl01.png">
				</dt>
				<dd class="first_dd">
					<a href="#">平台运营商管理</a>
				</dd>
			</dl>-->

			<!--<dl class="syetem_management">
				<dt>
					系统管理<img src="adminsystem/images/left/select_xl01.png">
				</dt>
				<dd class="first_dd">
					<a href="#">后台用户管理</a>
				</dd>
				<dd>
					<a href="#">角色管理</a>
				</dd>
				<dd>
					<a href="#">客户类型管理</a>
				</dd>
				<dd>
					<a href="#">栏目管理</a>
				</dd>
				<dd>
					<a href="#">微官网模板组管理</a>
				</dd>
				<dd>
					<a href="#">商城模板管理</a>
				</dd>
				<dd>
					<a href="#">微功能管理</a>
				</dd>
				<dd>
					<a href="#">修改用户密码</a>
				</dd>
			</dl>-->
			<!--  <dl class="source">
				<dt>
					素材库管理<img src="adminsystem/images/left/select_xl01.png">
				</dt>
				<dd class="first_dd">
					<a href="#">图片库</a>
				</dd>
				<dd>
					<a href="#">链接库</a>
				</dd>
				<dd>
					<a href="#">推广管理</a>
				</dd>
			</dl>
-->
			<dl class="statistics">
				<dt>
					统计分析<img src="adminsystem/images/left/select_xl01.png">
				</dt>
				<dd class="first_dd">
					<a href="admin/totalclick?type=month">点击量统计</a>
				</dd>
				<dd>
					<a href="admin/areastatistic?type=month">地区发帖数</a>
				</dd>
				<dd>
					<a href="admin/typestatistic?type=month">爆光类型统计</a>
				</dd>


				<dd>
					<a href="admin/typeareastatistic?type=month&area=七星区">七星区</a>
				</dd>
				<dd>
					<a href="admin/typeareastatistic?type=month&area=叠彩区">叠彩区</a>
				</dd>
				<dd>
					<a href="admin/typeareastatistic?type=month&area=象山区">象山区</a>
				</dd>
				<dd>
					<a href="admin/typeareastatistic?type=month&area=秀峰区">秀峰区</a>
				</dd>
				<dd>
					<a href="admin/typeareastatistic?type=month&area=临桂区">临桂区</a>
				</dd>
				<dd>
					<a href="admin/typeareastatistic?type=month&area=雁山区">雁山区</a>
				</dd>
				<dd>
					<a href="admin/typeareastatistic?type=month&area=其他">其他</a>
				</dd>
				</dd>


			</dl>
		</div>
	</div>

</body>
<script type="text/javascript">
	$(".leftsidebar_box dt").css({
		"background-color" : "#3992d0"
	});
	$(".leftsidebar_box dt img").attr("src",
			"adminsystem/images/left/select_xl01.png");
	$(function() {
		//$(".leftsidebar_box dd").hide();
		$(".leftsidebar_box dt").click(
				function() {
					$(".leftsidebar_box dt").css({
						"background-color" : "#3992d0"
					})
					$(this).css({
						"background-color" : "#317eb4"
					});
					$(this).parent().find('dd').removeClass("menu_chioce");
					$(".leftsidebar_box dt img").attr("src",
							"adminsystem/images/left/select_xl01.png");
					$(this).parent().find('img').attr("src",
							"adminsystem/images/left/select_xl01.png");
					$(".menu_chioce").slideUp();
					$(this).parent().find('dd').slideToggle();
					$(this).parent().find('dd').addClass("menu_chioce");
					//自己加的内容
					$(".leftsidebar_box dt").css({
						"background-color" : "#3992d0"
					})

				});
	})
</script>

</html>
