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

<title>用户列表</title>

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
</head>

<body>
	<jsp:include page="frame.jsp"></jsp:include>
	<div id="rightcontent">
		<h2>注册用户列表</h2>

		<div class="input-group">
			<input type="texts" id="search_words" class="form-control"
				placeholder="可搜索内容：用户名，用户ID，用户身份"> <span
				class="input-group-btn">
				<button class="btn btn-default" type="button" id="search_btn">搜索</button>
			</span>
		</div>
		<div style="margin-top: 20px;"></div>
		<table
			class="table table-hover table-striped table-condensed table-bordered">
			<thead>
				<tr>
					<th>id</th>
					<th>用户名</th>
					<th>用户id（点击进入主页）</th>
					<th>用户身份</th>
					<th>性别</th>
					<th>注册时间</th>
					<th>最后登录时间</th>
					<th>帐号注册</th>

				</tr>
			</thead>
			<tbody>
				<s:iterator value="userlist" id="set">

					<tr>

						<td>${set.id}</td>
						<td>${set.userName}</td>
						<td class="userid">${set.userId}</td>
						<td>${set.userIndentity}</td>
						<td>${set.userSex}</td>
						<td>${set.userRegistertime}</td>
						<td>${set.userLastLogintime}</td>

						<td><!--<s:if test="#set.userState==0">
								<button class="illegal_topic btn btn-danger">违规</button>
							</s:if> <s:if test="#set.userState==1">
								<button class="un_illegal_topic btn btn-info">取消违规</button>
							</s:if>!--></td>
					</tr>

				</s:iterator>
			</tbody>
		</table>

		<div>每页显示 ${onepagenum }条，共${ totalcount}条,共${ totalpagecount}页，当前第${nowpage}页</div>
		<div id="page"></div>
	</div>
</body>
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
			$(".activP").removeClass("activP").parent().siblings("#" + nowpage)
					.addClass("activP");
		}
	}
</script>
<script type="text/javascript">
	initPage("${ totalpagecount}");
</script>
<script type="text/javascript">
	//查询点击事件
	$(document).ready(
			function() {
				$("#search_btn").click(
						function() {
							window.location.href = "admin/userlist?words="
									+ $("#search_words").val();
						});
			});
</script>
</html>
