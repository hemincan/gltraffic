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

<title>My JSP 'index_myfollow.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/index_myfollow.css">
</head>

<body>
	<div id="index_myfollow">
		<div class="common_headfont">我的关注</div>
		<div id="list"></div>
		<a href="mypage_myfollow.jsp"><div class="common_morefont">查看更多</div></a>
	</div>
	<script type="text/javascript">
		//获取我的关注列表
		$(document)
				.ready(
						function() {
							$
									.ajax({
										type : "post",
										url : "ajax/myfollow",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
										data : {//设置数据源
											
										},
										dataType : "json",//设置需要返回的数据类型
										success : function(data) {
											//alert(data);
											var d = eval("(" + data + ")");
											if (d.code == 1) {
												//用户未登录
												$("#index_myfollow").children(
														"#list").append("<p>欢迎你登录查看自己的关注列表！</p>");
											}
											for (var j = 0; j < d.length; j++) {
												//alert(j)
												$("#index_myfollow")
														.children("#list")
														.append(
																'<a href="login/detailtopic.action?topicid='+d[j].topicid+'"><div class="tab"><p class="content">'
																		+ d[j].topiccontent
																		+ '</p><div class="timeanduser">'+d[j].commentsize+' 条评论，'+d[j].eggsize+' 个鸡蛋 ，发布人：'
																		+ d[j].username+'</div></div></a>');
											}
										},
										error : function() {
											alert("系统异常，请稍后重试！提交评论");
										}//这里不要加","
									});

						});
	</script>
</body>
</html>
