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

<title>My JSP 'navbar.jsp' starting page</title>

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


<link rel="stylesheet" type="text/css" href="css/shadow.css">
<link rel="stylesheet" type="text/css" href="css/commonuse.css">
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.js"></script>
<style type="text/css">
body {
	padding: 0px;
	margin: 0px;
	background-color:#c5d6ea!important;
	background-image: url("images/body_bg.jpg")!important;
	background-attachment:fixed!important;
	background-repeat: no-repeat!important;

	
}

.topNav * {
	margin: 0;
	padding: 0;
	list-style: none;
}

#nav {
	background: #fff;
	font: normal 12px/22px 微软雅黑;
	/*background-image: url("xy1-wallpaper-xerneas-1920x1200.jpg");*/
}

#nav img {
	border: 0;
	width: 100%
}

#nav a {
	text-decoration: none;
	color: #333;
}

.clearfix:after {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
}

.fixclass {
	position: fixed;
	top: 0px;
}

.topNav {
	margin: 0 auto;
	width: 100%;
	
	background-image: url("images/navbg.png");
	z-index: 100;
	height: 40px;
	/*border-top:3px solid black;*/
	/*border-bottom:1px solid #EDEEF0;*/
	/*background-color:#FCFCFC;*/
	font-family: "微软雅黑", SimSun;
	font-size: 14px;
	
}

.topNav-width {
	width: 1100px;
	margin: 0 auto;
}

.topNav h3 {
	font-weight: normal;
	font-size: 100%;
}

.topNav dl {
	zoom: 1;
}

.topNav .tnLeft {
	float: left;
}

.topNav .tnRight {
	float: right;
}

.topNav dd {
	float: left;
	position: relative;
}

.topNav dd h3 {
	float: left;
}

.topNav dd h3 a {
	margin-right: 4px;
	height: 10px;
	font-weight:bold;
	line-height: 40px;
	padding: 13px 20px;
	color: #fff !important;
}

.topNav dd h3 a i {
	display: inline-block;
	width: 8px;
	height: 5px;
	margin: 0px;
	overflow: hidden;
	vertical-align: middle;
	font-size: 12px;
	text-align: center;
	/*background:url(images/icon.png) 0 -61px no-repeat;*/
}

.topNav dd h3 a:hover,.topNav dd.on h3 a {
	line-height: 40px;
	height: 10px;
	
	color: orange!important;
}

.topNav .welcome {
	padding-right: 15px;
	color: #FF8400;
}

.topNav .welcome a {
	color: #FF8400;
}

.topNav dd ul {
	z-index: 55;
	display: none;
	position: absolute;
	width: 130px;
	top: 38px;
	left: 0;
	border: 1px solid;
	border-top: 0;
	background: #fff;
	
}

.topNav dd ul li {
	line-height: 31px;
	border-bottom: 1px solid;
}

.topNav dd ul li a {
	display: block;
	color: #333;
	padding: 0 15px;
}

.topNav dd ul li a:hover {
	background: #FFF5DA;
	color: #E67902;
}

.topNav dd ul li a span {
	color: #FF8400;
	margin-left: 5px;
}

#headerbg {
	background-image: url("images/headerbg.png");
	background-position: center;
}

.header {
	height: 160px;
	width: 1200px;
	margin: 0 auto;
}

.logo {
	float: left;
	width: 400px;
	margin-top: 40px;
}

.logo_polie {
	float: right;
	margin-top:100px;
	width: 360px;
}

.userinfo {
	float: left;
	margin-top: 40px;
	margin-left: 80px;
	width: 70px;
}
.navicon{
	width: 30px!important;
}






</style>

<style type="text/css">
#hintinfo {
	position: fixed;
	width: 200px;
	height: 60px;
	margin: auto;
	top: 0px;
	bottom: 0px;
	left: 0px;
	right: 0px;
	background-color: #000;
	display: none;
	color: white;
	text-align: center;
	line-height: 60px;
	font-size: 20px;
	z-index:999;
}
</style>
<script type="text/javascript">
function showhint(text) {
	//显示弹窗提示
	$("#hintinfo").text(text);
	$("#hintinfo").show();
	setTimeout(function() {
		$("#hintinfo").hide();
	}, 2000);
}
</script>
<script type="text/javascript">
function getNowFormatDate() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + "年" + month + "月" + strDate
            + " " + date.getHours() + "时" + date.getMinutes()
            + "分";
    return currentdate;
} 
$(document).ready(function(){

	$("#jscurrenttime").text(getNowFormatDate());
});
</script>

</head>

<body id="nav">
	<div id="hintinfo"></div>

	<div style="height: 20px;background-color: #666;color: #fff;"
		class="shadow">
		<div style="width: 1100px;margin: 0 auto;">
			<span>欢迎来到桂林交通曝光平台！</span> <span id="userid_navbar">${session.userid}</span>
			<span>,当前时间：<span id="jscurrenttime"></span></span>
			<span >遵守网络文明，文明用语。</span>
			
			
		</div>
	</div>
	<div id="headerbg">
		<div class="header">
			<div class="logo">
				<img src="images/logo2.png">
			</div>
			
			<div class="userinfo">
				<!--  
				<a href=""><span><div id="userid_navbar">${session.userid}</div></a></span>&nbsp;&nbsp;|&nbsp;&nbsp;<a
					href=""><span>注册</span></a>
					-->
			</div>
			<div class="logo_polie">
				<img src="images/logo3.png"> 
			</div>
		</div>
	</div>
	<div style="clear: both;"></div>
	<div class="topNav">
		<div class="topNav-width">
			<dl class="tnLeft">
				<!--  <div style="margin: 8px 10px auto   -80px; float: left;width: 150px; ">
      <img src="images/logo.png">
      </div> -->
				<dd>
					<h3>
						<a href="index.jsp"><img src="icon/navhome.png" class="navicon" >首页</a>
					</h3>
				</dd>
				<dd>
					<h3>
						<a href="traffic_learn.jsp"><img src="icon/navtask.png" class="navicon" >交规学习</i></a>
					</h3>
					
				</dd>
				
				<dd>
					<h3>
						<a  href="recommend.jsp"><img src="icon/navnotice.png" class="navicon" >通知公告</a>
					</h3>
				
				</dd>
				
				<dd>
					<h3>
						<a  href="topic_search.jsp"><img src="icon/navsearch.png" class="navicon" >搜索帖子</a>
					</h3>
					
				</dd>
			</dl>
			<dl class="tnRight">
				<!-- <dd class="welcome"> 欢迎您， <a target="_blank" href="#" title="用户名">用户名</a> <a href="#">退出</a> </dd> -->
				
				<dd>
					<h3>
						<a href="aboutme.jsp"><img src="icon/navremind.png" class="navicon" >与我相关</a>
					</h3>
					<ul>
						<li><a href="aboutme.jsp">评论</a></li>
						<li><a href="mypage_messboard.jsp">留言</a></li>
					</ul>
				</dd>

				<dd>
					<h3>
						<a href="mypage.jsp"><img src="icon/navpeople.png" class="navicon" >我的主页</a>
					</h3>
					<ul>
						<li><a href="mypage.jsp">我的曝光</a></li>
						<li><a href="mypage_myfollow.jsp">我的关注</a></li>
						<li><a href="mypage_messboard.jsp">留言板</a></li>
					</ul>
				</dd>
				<!-- <div style="margin-right: -25px; float: left;width: 150px;margin-top: 8px ">
     	 <img src="images/logoright.png">
      </div> -->
			</dl>
		</div>
	</div>
	<script type="text/javascript">
		jQuery(".topNav").slide({
			type : "menu",
			titCell : "dd",
			targetCell : "ul",
			delayTime : 0,
			defaultPlay : false,
			returnDefault : true
		});
	</script>
	<script type="text/javascript">
		$(window).scroll(function() {
			var top = $(window).scrollTop();
			if (top >= 160) {
				$(".topNav").addClass("fixclass");

			} else if (top < 160) {
				$(".topNav").removeClass("fixclass");
			}
		});
	</script>
</body>
</html>
