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

<title>My JSP 'index_banner.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->


<style type="text/css">
#bann {
	/*position: relative;
	width: 200px;
	height: 100px;
	margin-top: 20px;*/
}

#bann ul,li,body {
	list-style-type: none;
	padding: 0px;
	margin: 0px;
}

#bann img {
	border: none;
}

#bann .picture li {
	display: none;
}

#bann .picture p {
	text-align: center;
	padding: 0px;
	margin: 0px;
}

#bann .picture {
	background-color: #eeeeee;
}

#bann .contain {
	position: relative;
	/*width: 1366px;
	height: 650px;*/
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0 auto;
}

#bann #prev,#next {
	position: absolute;
	top: 190px;
}

#bann #prev {
	left: 0px;
	opacity: 0.2;
	width: 30px;
}

#bann #prev:hover {
	opacity: 1;
}

#bann #next:hover {
	opacity: 1;
}

#bann #next {
	right: 0px;
	opacity: 0.2;
	width: 30px;
}

#bann .indexlist li {
	float: left;
	margin: 10px;
	height: 22px;
	width: 22px;
	background-repeat: no-repeat;
	background-image: url("images2/point_unselect.png");
}

#bann .indexlist .current {
	float: left;
	margin: 10px;
	height: 22px;
	width: 22px;
	background-repeat: no-repeat;
	background-image: url("images2/point_select.png");
}

#bann .indexlist li:hover {
	background-image: url("images2/point_select.png");
}

#bann .indexlist {
	position: absolute;
	left: 80px;
	top: 150px;
}
</style>
<script type="text/javascript">
	function initbanner() {
		var curindex = 0;
		imglen = $(".picture li").length;
		changeto(0);
		var autochange = autoChange();

		function changeto(num) {
			$(".picture li").css({
				"display" : "none"
			});
			$(".indexlist li").removeClass("current");
			$(".indexlist #img" + num).addClass("current");
			$(".picture #img" + num).fadeIn(1000);
		}

		$("#prev").click(function() {
			curindex--;
			if (curindex < 0) {
				curindex = imglen - 1;
			}
			changeto(curindex);
		});
		$("#next").click(function() {
			curindex++;
			if (curindex >= imglen) {
				curindex = 0;
			}
			changeto(curindex);
		});

		$("#next").hover(function() {
			clearInterval(autochange);
		}, function() {
			autochange = autoChange();
		});
		$("#prev").hover(function() {
			clearInterval(autochange);
		}, function() {
			autochange = autoChange();
		});

		function autoChange() {
			return setInterval(function() {
				if (curindex < imglen - 1) {
					curindex++;
				} else if (curindex >= imglen - 1 || curindex < 0) {
					curindex = 0;
				}
				changeto(curindex);
			}, 4000);
		}
	}
</script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$
								.ajax({
									type : "post",
									url : "ajax/getbanner",
									data : {

									},
									dataType : "json",
									success : function(data) {
										
										var d = eval("(" + data + ")");
			
										for (var i = 0; i < d.length; i++) {
											$(".contain")
													.find(".picture")
													.append(
															'<li id="img'+i+'"><a href="javascript:void(0);"><p><img alt="" src="indexbannerimages/'+d[i].image+'"></p></a></li>');
										}
										initbanner();
									},
									error : function() {

									},

								});
					});
</script>
</head>

<body>
	<div id="bann">
		<!--最大父容器，长度100%，位置相对布局  -->
		<div class="contain">
			<!--父容器，长度1340px，位置相对布局，居中  -->
			<ul class="picture">

			</ul>
			<img id="prev" alt="" src="images2/prev.png"> <img id="next"
				alt="" src="images2/next.png">
			<!--  <ul class="indexlist">
				<li id="l0" class="current"></li>
				<li id="l1"></li>
				<li id="l2"></li>
			</ul>
			-->
		</div>
	</div>

</body>
</html>
