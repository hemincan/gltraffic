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
#recommend_airtle {
	padding: 10px;
	height: auto;
}

#recommend_airtle li {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	margin-top: 5px;
	
}

#notice_airtle {
	padding: 10px;
}

#notice_airtle2 {
	margin-top:-20px;
	padding: 10px;
}
#notice_airtle2 li {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	margin-top: 10px;
	list-style-type: none!important;
}
#notice_airtle li {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow: hidden;
	margin-top: 10px;
	list-style-type: none!important;
	
}

#recommend_stytle {
	background-color: #fff;
	border: 1px solid #dddddd;
	height: 200px;
	overflow: hidden;
}

#recommend_stytle a {
	color: #111;
	font-size: 17px;
}

#recommend_stytle a:hover {
	color: red;
	text-decoration: underline;
	text-align:center;   
}
#test{
border-top: 1px solid #eee;
overflow: hidden;
}
.noticicon{
	width: auto!important;
	float: left;
	margin-top: 20px;
}
</style>

</head>

<body>
	<div class="common_headfont">通知与公告 <a href="recommend.jsp"><img alt="" src="icon/more.png" style="width: 30px;float: right;"></a></div>
	<div style="clear: both;"></div>

	<div id="recommend_stytle">
		<!-- 
		<div id="recommend_airtle">
			
			<li><a href="#">w3452352345234sdfsdfsdfsdfsdfsdsfsdf5</a></li>
			<li><a href="#">w34523523452345</a></li>
			<li><a href="#">w34523523452345</a></li>
			<li><a href="#">w34523523452345</a></li>
			<li><a href="#">w34523523452345</a></li>
		</div>

		<div style="margin-top: 20px;"></div>
		 -->

		<div id="notice_airtle">
			
		</div>
		<div id="notice_airtle2"></div>
		
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
									url : "ajax/notictopics",
									data : {

									},
									dataType : "json",
									success : function(data) {
										var d = eval("(" + data + ")");

										for (var i = 0; i < d.length; i++) {

											$("#recommend_stytle")
													.find("#notice_airtle")
													.append(
															'<div id="test"><img alt="" src="icon/notic.gif" class="noticicon"><li style="float: left;" ><a href="login/detailnotice?id='
																	+ d[i].id
																	+ '">'
																	+ d[i].tiltle
																	+ '</a></li><span style="float: right;line-height:40px;">'
																	+ d[i].time
																	+ '</span></div><div style="clear: both;"></div>');
										}
										init_recommend();
									},
									error : function() {
										alert("获取公告失败");
									},

								});
					});
</script>

<script>
	function init_recommend() {
		var speed = 100
		var topafter=0;
		var demo = document.getElementById("recommend_stytle");
		var demo2 = document.getElementById("notice_airtle2");
		var demo1 = document.getElementById("notice_airtle");
		demo2.innerHTML = demo1.innerHTML
		function Marquee() {
			//console.log(demo2.offsetTop - demo.scrollTop)
			if (demo2.offsetTop - demo.scrollTop <= 0) {

				demo.scrollTop -= demo1.offsetHeight

			} else {
				//alert(demo.scrollTop);
				//alert(demo2.offsetTop - demo.scrollTop);
				topafter=demo.scrollTop;
				demo.scrollTop++;
				if(topafter==demo.scrollTop){
					demo.scrollTop -= demo1.offsetHeight
				}
			}
		}
		var MyMar = setInterval(Marquee, speed)
		demo.onmouseover = function() {
			clearInterval(MyMar)
		}
		demo.onmouseout = function() {
			MyMar = setInterval(Marquee, speed)
		}

	}
</script>
</html>
