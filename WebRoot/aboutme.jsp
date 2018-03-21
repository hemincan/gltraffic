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

<title>My JSP 'aboutme.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<%
	Object userid = session.getAttribute("userid");
	//out.print(userid);
	if (userid == null) {
		response.sendRedirect("welcomelogin.jsp");
	} else {

	}
%>

<style type="text/css">
#aboutme_container {
	width: 100%;
}

#aboutme_container .tab {
	border: 1px solid #ccc;
	margin: 10px;
	padding: 10px;
	overflow: hidden;
	font-size: 15px;
	background-color: #fff;
	
}

#aboutme_container .time {
	float: right;
}

#aboutme_container .quote {
	background: #eee;
	padding: 10px;
}

#aboutme_container .content {
	margin: 10px;
}

#aboutme_container img {
	width: auto !important;
}

#aboutme_container .who {
	color: blue;
}
</style>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>


<!-- 分页的css js -->
<link rel="stylesheet" href="css/jquery.page.css">
<script type="text/javascript" src="js/jquery.page.js"></script>
<script type="text/javascript">
	//分页
	//供首次初始化调用，之后就不会更更新
	function initPage(total) {

		//alert($("#nowpage").text());
		//alert(total);
		var onpagenum = 5;//一页显示多少，服务器也要跟着改
		total = Math.ceil(total / 5);
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

				getaboutme(page);
				window.scrollTo(0, 0);
			}
		});
		//if (nowpage != 1) {//主要为了样式
		//	$(".activP").removeClass("activP").parent().siblings("#" + nowpage)
		//			.addClass("activP");
		//}
	}
</script>
<script type="text/javascript">
	var firsttime = true;
	function getaboutme(nowpage) {
		$
				.ajax({
					type : "post",
					url : "ajax/aboutmelist",
					data : {
						'nowpage' : nowpage
					},
					dataType : "json",
					success : function(data) {
						data = eval("(" + data + ")");
						d = data.jsondata;
						total = data.myfollowcount;//用于初始化分页
						if (firsttime) {
							initPage(total);
							firsttime = false;
						}
						$("#aboutme_container").empty();
						for (var j = 0; j < d.length; j++) {
							d[j].content = d[j].content
									.replace(/\[#([^\]]*)\]/g,
											'<img src="umeditor/dialogs/emotion/images/$1.gif">');
							if(d[j].readed==1){
							  var unread='<img alt="" src="icon/unread.png"><span style="color: red;">（未读） </span>  ';
							  }else{
							 // alert(d[j].readed);
							  	var unread="";
							  }
							if (d[j].quotecontent != null) {
								d[j].quotecontent = d[j].quotecontent
										.replace(/\[#([^\]]*)\]/g,
												'<img src="umeditor/dialogs/emotion/images/$1.gif">');
								$("#aboutme_container")
										.append(
												'<div class="tab">'+unread+'<span class="who">'
														+ d[j].who
														+ '</span>对主题：（”'
														+ d[j].topiccontent
														+ '“） 给你评论<div class="content">'
														+ d[j].content
														+ '<div class="quote">引用于评论：'
														+ d[j].quotecontent
														+ '</div></div><div class="time">时间：'
														+ d[j].time
														+ '</div></div>');
							} else {
								$("#aboutme_container")
										.append(
												'<div class="tab">'+unread+'<span class="who">'
														+ d[j].who
														+ '</span>对主题：（”'
														+ d[j].topiccontent
														+ '“） 给你评论<div class="content">'
														+ d[j].content
														+ '</div><div class="time">时间：'
														+ d[j].time
														+ '</div></div>');
							}
						}

					},
					error : function() {

					},

				});
	}

	$(document).ready(function() {
		getaboutme(1);
	});
</script>
</head>

<body>
	<div>
		<jsp:include page="navbar.jsp"></jsp:include>
	</div>
	
	<div style="clear: both;"></div>
	<div style="width: 1000px;margin: 20px auto;">
		<div style="width: 70%;margin: 20px auto;float: left;">
			<div class="common_headfont">与你相关的通知</div>
			<div id="aboutme_container"></div>
			<div id="page"></div>
		</div>
		<div style="width: 30%;margin: 20px auto;float: left;">
			<div style="height: 230px; overflow: hidden;">
				<jsp:include page="index_banner.jsp"></jsp:include>

			</div>
			<div style="margin-top: 20px;"></div>
			<jsp:include page="index_recommend.jsp"></jsp:include>
		</div>

	</div>
	<div style="clear: both;"></div>
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>

</html>
