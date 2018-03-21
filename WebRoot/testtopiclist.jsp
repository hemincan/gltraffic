<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'testtopiclist.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/shadow.css">
<script type="text/javascript">
	$(document).ready(function() {
		//自动加载更多
		//滚动条到页面底部加载更多案例 
		$(window).scroll(function() {
			var scrollTop = $(this).scrollTop(); //滚动条距离顶部的高度
			var scrollHeight = $(document).height(); //当前页面的总高度
			var clientHeight = $(this).height(); //当前可视的页面高度
			 console.log("top:"+scrollTop+",doc:"+scrollHeight+",client:"+clientHeight);
			if (scrollTop + clientHeight >= scrollHeight) { //距离顶部+当前高度 >=文档总高度 即代表滑动到底部 count++;         //每次滑动count加1
				
			} else if (scrollTop <= 0) {
				//滚动条距离顶部的高度小于等于0 TODO
				//alert("下拉刷新，要在这调用啥方法？");
			}
		});
	});
</script>
</head>

<body>
	
	<jsp:include page="navbar.jsp" ></jsp:include><jsp:include page="login.jsp" ></jsp:include>
	<div id="test" style="height: 1200px;"></div>
</body>
</html>
