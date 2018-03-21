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

<title>My JSP ' recommend.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
#trafficlearn_airtle {
	padding: 10px;
}

#trafficlearn_airtle li {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	margin-top: 5px;
}

#trafficlearn_stytle {
	background-color: #fff;
	border: 1px solid #dddddd;
}

#trafficlearn_stytle a {
	color: #111;
	font-size: 17px;
}

#trafficlearn_stytle a:hover {
	color: red;
	text-decoration: underline;
}

.tabimg {
	float: left;
	width: 30%;
	background-color: #fff;
}

.tabimg img {
	height: 100% !important;
}

.nodisplay {
	display: none;
}
</style>

</head>

<body>
	<div class="common_headfont">交规学习文章 <a href="login/morearticlelist"><img alt="" src="icon/more.png" style="width: 30px;float: right;"></a></div>
	<div style="clear: both;"></div>
	<div id="trafficlearn_stytle">


		<div id="trafficlearn_airtle"></div>

	</div>
	
	<div style="clear: both;"></div>
</body>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$
								.ajax({
									type : "post",
									url : "ajax/articlelist",
									data : {

									},
									dataType : "json",
									success : function(data) {

										var d = eval("(" + data + ")");
										var defaultimg = "this.src='images/noimage.png'";
										for (var i = 0; i < d.length; i++) {
											//alert(d[i].img);
											if (d[i].img == null) {
												d[i].img = "";
											}
											$("#trafficlearn_stytle")
													.find(
															"#trafficlearn_airtle")
													.append(
															'<a class="trafficlearn_tab nodisplay" href="login/detailarticle?id='
																	+ d[i].id
																	+ '"><div style="height: 60px;background: #fff;overflow: hidden;margin-top:5px;"><div class="tabimg"><img  src="'
																	+ d[i].img
																	+ '" onerror="'+defaultimg+'" ></div><div style="float: left;width: 70%;background-color: #fff;">'
																	+ d[i].tiltle
																	+ '</div></div></a><div style="clear: both;"> ');
										}
										init();
									},
									error : function() {
										alert("获取公告失败");
									},

								});
					});
</script>
<script type="text/javascript">
	current = 0;
	showlenth = 3;
	function init() {
		tab = $(".trafficlearn_tab");
		if (tab.length > showlenth) {
		
			$(".trafficlearn_tab").addClass("nodisplay");
			$(tab[current]).removeClass("nodisplay");
			$(tab[current + 1]).removeClass("nodisplay");
			current = (current + 1) % tab.length;

			window.setInterval(function() {
				$(".trafficlearn_tab").addClass("nodisplay");
				$(tab[current]).removeClass("nodisplay");
				$(tab[current + 1]).removeClass("nodisplay");
				current = (current + 1) % tab.length;
			}, 3000);
		}
	}
</script>
</html>
