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

<title>My JSP 'trafficlearn.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/learn.css">
<%@taglib prefix="s" uri="/struts-tags"%>
</head>

<body>
	<div>
		<jsp:include page="navbar.jsp"></jsp:include>
	</div>
	<div style="clear: both;"></div>
	<div id="learn">
		<s:iterator value="trafficlist" id="set">

			<a href="javascript:void(0);" class="detaillearn"><div
					class="tab">
					<div class="imgcontainer">
						<img src="learn/images/${set.image }">
					</div>
					<div class="tabword">
						<div class="typeid">${set.id }</div>
						<div class="headword">${set.name }</div>
						<div class="describe">${set.describe }</div>
					</div>
				</div></a>
		</s:iterator>
	</div>
</body>
</html>
