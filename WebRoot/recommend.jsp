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

<title>My JSP 'recommend.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<style type="text/css">
#recommend_page {
	width: 1000px;
	margin: 30px auto;
	font-size: 16px;
	background-color: #fff;
	padding: 20px;
	border : 1px solid #ccc;
}

#recommend_serch {
	float: left;
	width: 20%;
}

#recommend_list {
	float: left;
	width: 80%;
	padding: 10px;
	border-left : 1px solid #eee;
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
		<div class="common_headfont">通知与公告</div>
		<div id="recommend_serch">
			<p>在这里搜索标题</p>
			<input type="text" id="serch_tiltle"/ >
			<button id="search_btn">搜索</button>
		</div>
		<div id="recommend_list"></div>
      
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
		var onpagenum = 10;//一页显示多少，服务器也要跟着改
		total = Math.ceil(total / onpagenum);
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
				window.scrollTo(0, 0);
			}
		});

	}
</script>
<script type="text/javascript">
	function getrecommend(tiltle) {

		$
				.ajax({
					type : "post",
					url : "ajax/notictopicspage",
					data : {
						'tiltle' : tiltle,
					},
					dataType : "json",
					success : function(data) {

						var d = eval("(" + data + ")");
						$("#recommend_page").find("#recommend_list").empty();
						initPage(Number(d.totalcount));
						d = d.data;
						//alert(d)
						for (var i = 0; i < d.length; i++) {

							$("#recommend_page")
									.find("#recommend_list")
									.append(
											'<li class="tiltle" ><a href="login/detailnotice?id='
													+ d[i].id
													+ '">'
													+ d[i].tiltle
													+ '</a></li><span class="time">'
													+ d[i].time
													+ '</span><div style="clear: both;"></div>');
						}
					},
					error : function() {
						alert("获取公告失败");
					},

				});

	}

	$(document).ready(function() {
		getrecommend();
	});
	$(document).ready(function() {
		$("#search_btn").click(function() {
			var tiltle = $("#serch_tiltle").val();
			if (tiltle == "" || tiltle == null) {
				getrecommend();
				return;
			}
			getrecommend(tiltle);
		});
	});
</script>
</html>
