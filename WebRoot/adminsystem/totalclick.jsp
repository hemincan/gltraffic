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

<title>点击统计排行</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%@taglib prefix="s" uri="/struts-tags"%>
<style type="text/css">
.content {
	max-width: 180px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>
</head>

<body>
	<jsp:include page="frame.jsp"></jsp:include>
	<div id="rightcontent">
		<h2>点击总排行(${type })</h2>
		<a href="admin/totalclick?type=today">今天</a>
		<a href="admin/totalclick?type=week">最近一周</a> <a
			href="admin/totalclick?type=month">最近一月</a> <a
			href="admin/totalclick?type=year">最近一年</a> <a
			href="admin/totalclick?type=week">指定时间段</a> 
			
		<div style="font-size: 20px;">当前查询时间:${beginday }至${endday }-0时</div>
		<table
			class="table table-hover table-striped table-condensed table-bordered">
			<thead>
				<tr>
					<th>id</th>
					<th>用户id</th>
					<th>帖子内容</th>
					<th>点击量</th>
					<th>时间</th>

				</tr>
			</thead>
			<tbody>
				<s:iterator value="topicset" id="t">

					<tr>

						<td>${t.id}</td>
						<td>${t.user.userId}</td>
						<td class="content"><a
							href="login/detailtopic.action?topicid=${t.id}">${t.topicContent}</a></td>
						<td>${t.topicReaded}</td>
						<td>${t.topicPublicTime}</td>
					</tr>

				</s:iterator>
			</tbody>
		</table>

	</div>
</body>
</html>
