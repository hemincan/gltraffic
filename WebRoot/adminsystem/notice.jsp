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

<title>公告管理</title>

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
.images img {
	width: 50px;
}

.images video {
	width: 50px;
}

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
					<th>帖子内容</th>

					<th>发布时间</th>

					<th>点击</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="noticeset" id="set">

					<tr>

						<td>${set.id}</td>
						<td>${set.user.userName}</td>
						<td class="userid">${set.user.userId}</td>
						<td class="content"><a
							href="login/detailnotice?id=${set.id}"><xmp>${set.noticeTiltle}</xmp></a></td>

						<td>${set.noticePublicTime}</td>

						<td>${set.noticeReaded}</td>
						<td><a href="admin/deletenotice?id=${set.id }">
								<button id="delete_aritle" class="btn btn-danger">删除</button>
						</a></td>
					</tr>

				</s:iterator>
			</tbody>
		</table>

		<div>每页显示 ${onepagenum }条，共${ totalcount}条,共${ totalpagecount}页，当前第${nowpage}页</div>
		<div id="page"></div>
	</div>

	<script type="text/javascript">
		//把帖子的内容，视频和图片用别的标签来显示
		$(document)
				.ready(
						function() {
							var imgcontain = $(".images");
							for (var a = 0; a < imgcontain.length; a++) {
								//alert(imgcontain[a].innerHTML);
								var img = imgcontain[a].innerHTML;
								var container = imgcontain[a];
								container.innerHTML = "";
								var userid = $(container).siblings(".userid")
										.text();
								//alert(userid);
								var images = new Array();
								//images也包含视频
								images = img.split("|");
								for (var j = 0; j < images.length - 1; j++) {
									var filetype = images[j].match(/\.(.*)/)[1];
									filetype = filetype.toLowerCase();
									//alert(filetype);
									//图片支持png gif jpg
									if (filetype == "png" || filetype == "gif"
											|| filetype == "jpg") {
										$(container)
												.append(
														'<img alt="" src="/upload/'+userid+'/'+images[j]+'">');
									} else if (filetype == "mp4"
											|| filetype == "avi"
											|| filetype == "3gp"
											|| filetype == "rmvb") {
										//onclick()原因不想触发父控件的事件
										$(container)
												.append(
														'<video src="/upload/'+userid+'/'+images[j]+'" controls="controls">您的浏览器不支持 video 标签。</video>');
									} else {
										$(container).append(
												'<p>有非图片或者视频的内容!</p>');
									}
								}

							}
						});
	</script>


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
