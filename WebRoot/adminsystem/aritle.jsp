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

<title>文章管理</title>

<meta http-iv="pragma" content="no-cache">
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
.content {
	max-width: 180px;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.content a {
	color: blue !important;
}
</style>
</head>

<body>
	<jsp:include page="frame.jsp"></jsp:include>
	<div id="rightcontent">
		<h2>公告管理</h2>


		<table
			class="table table-hover table-striped table-condensed table-bordered">
			<thead>
				<tr>
					<th>id</th>
					<th>用户</th>
					<th>用户id</th>
					<th>文章标题</th>
				
					<th>时间</th>
					<th>点击量</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="topicset" id="set">

					<tr>

						<td>${set.id}</td>
						<td>${set.user.userName}</td>
						<td class="userid">${set.user.userId}</td>
						<td class="content"><a href="login/detailarticle?id=${set.id}">${set.articleTiltle}</a></td>
						

						<td>${set.articlePublictime}</td>
						<td>${set.articleReaded}</td>
						<td><a href="admin/deletearticle?id=${set.id }"> <button id="delete_aritle" class="btn btn-danger">删除</button> </a></td>
					</tr>

				</s:iterator>
			</tbody>
		</table>

		<div>每页显示 ${onepagenum }条，共${ totalcount}条,共${ totalpagecount}页，当前第${nowpage}页</div>
		<div id="page"></div>
	</div>


	<!-- 分页的css js -->
	<link rel="stylesheet" href="css/jquery.page.css">
	<script type="text/javascript" src="js/jquery.page.js"></script>
	<script type="text/javascript">
		function initPage(total) {
			//total分页总数
			total = Number(total);
			var linumss = total;//总页数
			//alert(linumss);
			if (linumss >= 5) {//总共有多少页，如果大于5页，最多显示5页
				linumss = 5;
			}
			//alert(linumss);
			$("#page")
					.Page(
							{
								totalPages : total,//分页总数
								liNums : linumss,//分页的数字按钮数(建议取奇数)
								activeClass : 'activP', //active 类样式定义
								callBack : function(page) {
									window.location.href = "admin/usertopics.action?nowpage="
											+ page;
								}
							});
			var nowpage = Number("${nowpage}");
			if (nowpage != 1) {//主要为了样式
				$(".activP").removeClass("activP").parent().siblings(
						"#" + nowpage).addClass("activP");
			}
		}
	</script>
	<script type="text/javascript">
		initPage("${ totalpagecount}");
	</script>
</body>
</html>
