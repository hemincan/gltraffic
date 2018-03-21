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

<title>My JSP 'morearitle.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<%@taglib prefix="s" uri="/struts-tags"%>
<style type="text/css">
#recommend_page {
	width: 1000px;
	margin: 30px auto;
	font-size: 16px;
	background-color: #fff;
	padding: 20px;
	border: 1px solid #ccc;
}

#recommend_serch {
	float: left;
	width: 20%;
}

#recommend_list {
	float: left;
	width: 80%;
	padding: 10px;
	border-left: 1px solid #eee;
}

#recommend_list li {
	margin-top: 10px;
}

#recommend_page .tiltle {
	float: left;
}

#recommend_page .time {
	float: right;
}
</style>
</head>

<body>
	<div>
		<jsp:include page="navbar.jsp"></jsp:include>
	</div>
	<div style="clear: both;"></div>

	<div id="recommend_page">
		<div class="common_headfont">学习文章</div>
		<div id="recommend_serch">
			<p>在这里搜索标题</p>
			<s:form action="morearticlelist" namespace="/login" method="post">
				<s:textfield name="search"></s:textfield>
				<s:submit value="搜索"></s:submit>
			</s:form>
		</div>
		<div id="recommend_list">


			<s:iterator value="artlist" id="t">
				<li class="tiltle"><a href="login/detailarticle?id=${t.id}">${t.articleTiltle}</a></li>
				<span class="time"><s:date name="#t.articlePublictime"  format="yyyy-MM-dd"/>
					<!--  阅读量：${t.articleReaded}--></span>
				<div style="clear: both;"></div>
			</s:iterator>
			<div style="margin-top: 20px;display: none;">当前第${nowpage}页，共${totalcount}页，每页${onepage}条数据</div>

		</div>
		<div id="page"></div>

	</div>
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
<!-- 分页的css js -->
<link rel="stylesheet" href="css/jquery.page.css">
<script type="text/javascript" src="js/jquery.page.js"></script>
<script type="text/javascript">
	//分页
	function initPage(total) {
		var linumss = total;//总页数
		if (linumss >= 5) {//总共有多少页，如果大于5页，最多显示5页
			linumss = 5;
		}
		//alert(linumss);
		$("#page").Page({
			totalPages : total,//分页总数
			liNums : linumss,//分页的数字按钮数(建议取奇数)
			activeClass : 'activP', //active 类样式定义
			callBack : function(page) {
				window.location.href = "login/morearticlelist?nowpage=" + page;
			}
		});

	}
	initPage(Number("${totalcount}"));
</script>
</html>
