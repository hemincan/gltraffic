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

<title>欢迎学习交通规则</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/learn.css">
<style type="text/css">
#index_tab {
	margin: 5px;
	border: solid 1px #ccc;
	overflow: hidden;
	background-color: #fff;
}

#index_tab .head {
	height: 30px;
	background-image: url("images/headbg.png");
	font-size: 18px;
	line-height: 30px;
	font-weight: bolder;
}

#index_tab .content {
	background-color: #fff;
}

#hot_airtle {
	height: 260px;
	padding: 10px;
}

#hot_airtle li {
	list-style-type: none;
}

#hot_airtle li a {
	color: blue;
	font-size: 14px;
}

#hot_airtle li a:hover {
	color: red;
}

#mark_learn {
	padding: 10px;
}

#mark_learn li {
	list-style-type: none;
}

#mark_learn li a {
	color: blue;
	font-size: 14px;
}

#mark_learn li a:hover {
	color: red;
}



#more_aritle_contain {
	padding: 10px;
	height: auto;
}

#more_aritle_contain li {
	list-style-type: none;
}

#more_aritle_contain li a {
	color: blue;
	font-size: 14px;
}

#more_aritle_contain li a:hover {
	color: red;
}

</style>
</head>
<body>
	<div>
		<jsp:include page="navbar.jsp"></jsp:include>
	</div>
	<div style="clear: both;"></div>

	<div style="width: 1100px;margin: 20px auto;">
		<div style="width: 70%;float: left;">
			<div id="index_tab"">
				<div class="head">遵守交通规则</div>
				<div class="content" style="height: 420px;">
					<jsp:include page="learn_banner.jsp"></jsp:include>
				</div>
			</div>


			<div id="index_tab">
				<div class="head">为你推荐这些文章</div>
				<div class="content">
					<jsp:include page="learn_aritle.jsp"></jsp:include>
				</div>
				<div></div>
			</div>
			
			
			
			<div id="index_tab">
				<div class="head">查看更多文章   <span style="float: right;"><a href="login/morearticlelist">查看更多>></a></span></div>
				<div class="content" id="more_aritle_contain">
					
				</div>
				<div></div>
			</div>
		</div>
		<div style="width: 27%;float: left;">
			<div id="index_tab">
				<div class="head">热门文章</div>
				<div class="content" id="hot_airtle"></div>
				<div>
					<center>
						<img alt="" src="images/hot_aritle.jpg" style="width: 70%;">
					</center>

				</div>
			</div>


			<div id="index_tab">
				<div class="head">交通标志学习</div>
				<div class="content" id="mark_learn"></div>
				<div></div>
			</div>
		</div>
	</div>

    
	<div style="clear: both;"></div>

	

	<jsp:include page="footer.jsp"></jsp:include>
</body>

<script type="text/javascript">
	$(document).ready(
			function() {
				$.ajax({
					type : "post",
					url : "learn/indexlearn",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
					data : {//设置数据源
					},
					dataType : "json",//设置需要返回的数据类型
					success : function(data) {

						var d = eval("(" + data + ")");

						for (var j = 0; j < d.length; j++) {
							$("#mark_learn").append(
									'<li><a href="login/detaillearn.action?typeid='
											+ d[j].typeid + '">'
											+ d[j].typename + '</a></li>');

						}
					},
					error : function() {
					}
				});
			});
</script>



<script type="text/javascript">
	//热门文章
	$(document)
			.ready(
					function() {
						$
								.ajax({
									type : "post",
									url : "ajax/learnbannerlist",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
									data : {//设置数据源
									},
									dataType : "json",//设置需要返回的数据类型
									success : function(data) {

										var d = eval("(" + data + ")");
										var defaultimg = "this.src='images/noimage.png'";

										for (var i = 0; i < d.length; i++) {
											$("#hot_airtle")
													.append(
															'<li>【'
																	+ (i + 1)
																	+ '】<a href="login/detailarticle?id='
																	+ d[i].id
																	+ '">'
																	+ d[i].tiltle
																	+ '</a></li>');
										}

									},
									error : function() {
									}
								});
					});
</script>



<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$
								.ajax({
									type : "post",
									url : "ajax/getmoreairtle",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
									data : {//设置数据源
									},
									dataType : "json",//设置需要返回的数据类型
									success : function(data) {
						               
										var d = eval("(" + data + ")");
  
										for (var j = 0; j < d.length; j++) {
											
											$("#more_aritle_contain")
													.append(
															'<li>【'
																	+ (j + 1)
																	+ '】<a href="login/detailarticle?id='
																	+ d[j].id
																	+ '">'
																	+ d[j].tiltle
																	+ '</a><span style="float:right">'+d[j].time+'</span></li>');

										}
									},
									error : function() {
									}
								});
					});
</script>
</html>
