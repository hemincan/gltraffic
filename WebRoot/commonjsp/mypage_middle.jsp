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

<title>My JSP 'mypage_middle.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<script type="text/javascript">
	//点击主页加载的部分
	//totalpages=5;
	//nowpage=1;
	$(document).ready(function() {
		$.ajax({
			type : "post",
			url : "ajax/mypageinfo",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
			data : {//设置数据源
			//'userid' : $("#userid_navbar").text()
			},
			dataType : "json",//设置需要返回的数据类型
			success : function(data) {
				//alert(data);
				var d = eval("(" + data + ")");
				if (d.code == 1) {
					//用户未登录
				}
				$("#topic_size").text(d.mytopiccount);
				$("#follow_size").text(d.myfollowcount);
				$("#message_bord_size").text(d.messageboardcount);
				$("#user_name").text(d.username);
				$("#user_userid").text(d.userid);
				if (d.sex == 1) {
					$("#user_sex").text("男");
				} else {
					$("#user_sex").text("女");
				}

			},
			error : function() {
				alert("系统异常，请稍后重试！mypage_middle.jsp");
			}//这里不要加","
		});

	});
</script>
</head>

<body>
	<div style="width: 1000px;margin: 20px auto;">
		<div id="mypage">
			<div class="mycontent">
				<div class="mycontent_left">
					<div class="common_headfont">我的主页</div>
					<ul class="mymenu">
						<li><a href="mypage.jsp" id="mytopic">我的曝光(<span
								id="topic_size"></span>)
						</a> <img src="icon/chevron-right.png" class="mypage_iconimg" /></li>
						<li><a href="mypage_myfollow.jsp" id="myfollow">我的关注(<span
								id="follow_size"></span>)
						</a><img src="icon/chevron-right.png" class="mypage_iconimg" /></li>
						<li><a href="mypage_messboard.jsp" id="mymessboard">留言板(<span
								id="message_bord_size"></span>)
						</a><img src="icon/chevron-right.png" class="mypage_iconimg" /></li>

					</ul>
					<div class="myinformation">
						<div class="common_headfont">我的信息</div>
						<div class="myinfo_left">
							<div class="myinfo_left_img">
								<jsp:include page="mypage_headimg.jsp"></jsp:include>
							</div>
							<div class="common_hintfont">点击可修改头像</div>


							<div>
								昵称：<span id="user_name"></span>
							</div>
							<div>
								用户名：<span id="user_userid"></span>
							</div>
							<div>
								性别：<span id="user_sex"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="mycontent_right">
					<div class="common_headfont_big">我的曝光</div>
					<div id="topiccontainer"></div>
					<div id="page"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
