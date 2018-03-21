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

<title>${notice.noticeTiltle }</title>

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
#article {
	width: 67%;
	float: left;
	background-color: #fff;
	margin-top: 20px;
	padding: 10px;
	border: 1px solid #ccc;
	margin-bottom: 20px;
}

#articleright {
	width: 30%;
	float: left;
	margin-left: 20px;
	margin-top: 20px;
}

.article_head {
	width: 100%;
}

.article_info {
	width: 100%;
	border-bottom: solid 1px #ccc;
	font-size: 16px;
}

.article_mainbody {
	word-break: break-all;
	padding: 30px;
	font-size: 15px;
}

.article_mainbody img {
	width: auto !important;
}
.right_fixd {
	position: fixed;
	top: 50px;
}
</style>
</head>

<body>
	<div>
		<jsp:include page="navbar.jsp"></jsp:include>
	</div>
	<div style="clear: both;"></div>
	<div style="width: 1100px;margin: 0 auto;">
		<div id="article">
			<div class="article_head">
				<h1>【公告】${notice.noticeTiltle }</h1>
			</div>
			<div class="article_info">
				<span style="margin-left:20px;">时间：${notice.noticePublicTime }</span><span
					style="margin-left:20px;">浏览量：${notice.noticeReaded }</span>
			</div>

			<div class="article_mainbody">${notice.noticeContent }</div>

		</div>
		<div id="articleright">
			<div style="width: 300px;" class="right_fixed">
				<div style="height: 230px; overflow: hidden;">
					<jsp:include page="index_banner.jsp"></jsp:include>

				</div>
				<div style="margin-top: 0px;"></div>
				<jsp:include page="index_recommend.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<div style="clear: both;"></div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	//右边档固定
	$(document).ready(function() {
		$(window).scroll(function() {
			var top = $(window).scrollTop();
			console.log(top);
			if (top >= 173) {
				$(".right_fixed").addClass("right_fixd");

			} else if (top < 173) {
				$(".right_fixed").removeClass("right_fixd");
			}
		});
	});
</script>
</html>
