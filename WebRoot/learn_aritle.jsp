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

<title>My JSP 'learn_aritle.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<style type="text/css">
.learn_airtle_left {
	float: left;
	width: 100%;
	padding: 10px;
}

#aritle_tab {
	height: 75px;
	overflow: hidden;
	margin-top: 5px;
	width: 48%;
	float: left;
	margin-top: 5px;
	border-left: 3px solid;
	background-color: #fff;
	margin-left: 5px;
}

#aritle_tab .left {
	float: left;
	width: 35%;
	overflow: hidden;
}

#aritle_tab .right {
	float: left;
	width: 60%;
	padding: 10px;
	font-size: 18px;
	line-height: 30px;
	font-weight: bold;
}

#learn_airtle {
	width:100%;
	margin: 10px auto;
	overflow: hidden;
	font-size: 17px;
}

#learn_airtle img {
	height: 100%;
	width: auto;
}
</style>
</head>

<body>
	<div id="learn_airtle">



		
		<div class="learn_airtle_left"></div>
	</div>
</body>
<script type="text/javascript">
	//获得相关文章ajax
	aritle = new Array();
	function getrecommend() {

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
							if (d[i].img == null) {
								d[i].img = "";
							}
							aritle[i] = '<a href="login/detailarticle?id='
									+ d[i].id
									+ '"><div id="aritle_tab"><div class="left"><img alt="" src="'+d[i].img+'"  onerror="'+defaultimg+'"></div><div class="right">'
									+ d[i].tiltle + '</div></div></a>';
							/*$(".learn_airtle_left")
									.append(
											'<a href="login/detailarticle?id='
													+ d[i].id
													+ '"><div id="aritle_tab"><div class="left"><img alt="" src="'+d[i].img+'"></div><div class="right">'
													+ d[i].tiltle
													+ '</div></div></a>');*/
						}
						initlearnaritle();

					},
					error : function() {
						alert("获取公告失败");
					},

				});

	}

	$(document).ready(function() {
		getrecommend();
	});
</script>
<script type="text/javascript">
	var onepagenum = 6;
	var nowpage = 1;
	var totalpage;
	function changepage() {
		$(".learn_airtle_left").empty();
		$(".learn_airtle_left").hide();
		var begin = (nowpage - 1) * onepagenum;
		for (var i = begin; i < begin + onepagenum; i++) {
			$(".learn_airtle_left").append(aritle[i]);
		}
		nowpage++;
		$(".learn_airtle_left").fadeToggle();
		if (nowpage > totalpage) {
			nowpage = 1;
		}
	}
	function initlearnaritle() {
		//alert(nowpage);
		totalpage = Math.ceil(aritle.length / onepagenum);
		changepage();
		MyMar = setInterval(changepage, 5000);

	}
	$(document).ready(function() {
		$(".learn_airtle_left").hover(function() {
			clearInterval(MyMar);
		}, function() {
			MyMar = setInterval(changepage, 5000);
		});
	});
</script>
</html>
