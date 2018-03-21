<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	Object userid = session.getAttribute("userid");
	//out.print(userid);
	if (userid == null) {
		response.sendRedirect("welcomelogin.jsp");
	} else {

	}
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>我的留言板</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<style type="text/css">
#messboard {
	border: solid 1px #ccc;
	overflow: hidden;
	margin: 5px;
	font-size: 15px;
}

#messboard img {
	width: 100%;
}

#messboard .headimg {
	float: left;
	width: 50px;
	height: 50px;
	padding: 5px;
}

#messboard .mess_userinfo {
	float: left;
	line-height: 50px;
}

#messboard .mess_time {
	float: right;
	line-height: 30px;
}

#messboard .mess_del a {
	float: right;
	line-height: 30px;
	margin-right: 20px;
	margin-left: 20px;
	color: red;
}

#messboard .content {
	padding: 10px;
}

#messboard .content img {
	width: auto !important;
}
</style>
</head>

<body>
	<div>
		<jsp:include page="navbar.jsp"></jsp:include>
	</div>
	<div style="clear: both;" ></div>

	<jsp:include page="commonjsp/mypage_middle.jsp"></jsp:include>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
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
		$("#page").Page(
				{
					totalPages : total,//分页总数
					liNums : linumss,//分页的数字按钮数(建议取奇数)
					activeClass : 'activP', //active 类样式定义
					callBack : function(page) {

						getMessageBoard(Number($("#mymessboard").children(
								"#message_bord_size").text()), page);
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
	//获得留言板内容
	function getMessageBoard(myfollowcount, nowpage) {
		$
				.ajax({
					type : "post",
					url : "ajax/mymessageboard",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
					data : {//设置数据源
						//'userid' : $("#userid_navbar").text(),
						'myfollowcount' : myfollowcount,
						'nowpage' : nowpage
					},
					dataType : "json",//设置需要返回的数据类型
					success : function(data) {
						//把之前的移除
						$("#topiccontainer").empty();
						//alert(data);
						var d = eval("(" + data + ")");//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构		
						//alert(d.nowpage + " dfdsf  " + d.toltalpages);
						//totalpages=d.toltalpages;

						var d = d.jsondata;
						var defaultimg = "this.src='images/defaultimg.jpg'";
						for (var i = 0; i < d.length; i++) {
							//alert("i"+i);
							var unread = "";
							if (d[i].readed == 1) {
								 unread = '<img alt="" src="icon/unread.png" style="width: 20px;"  ><span style="color: red;">（未读） </span>  ';
							} else {
								// alert(d[j].readed);
								unread = "";
							}
							$("#topiccontainer")
									.append(
											'<div id="messboard"><div class="head"><div class="headimg"><img src="/upload/'+d[i].from_userid+'/headimg.jpg" onerror="'+defaultimg+'"></div><div class="mess_userinfo"><a href="login/userpage.action?userid='
													+ d[i].from_userid
													+ '"><div class="mess_username">'
													+ d[i].from_name
													+ '</div></a></div></div><div style="clear: both;"></div><div class="content">'
													+ d[i].content
													+ '</div><div class="tail">'+unread+'<div class="mess_del"><a href="javascript:void(0);"></a></div><div class="mess_time">时间：'
													+ d[i].time
													+ '</div></div></div>');
						}
					},
					error : function() {
						alert("系统异常，请稍后重试！");
					}//这里不要加","
				});
	}
	function MyMessageBoard() {
		var totalcount_ = Number($("#message_bord_size").text());
		getMessageBoard(totalcount_, 1);
		//pagetype = 1;
		initPage(totalcount_);//重新初始化我的topic的页
		//alert($(".mycontent_right").children(".common_headfont").text())
		$(".mycontent_right").children(".common_headfont_big").text("留言板");
	}
	//$(document).ready($("#myfollow").click(function() {
	//	Myfollow();

	//}));
	//打开网页最先加载那一部分，稍微有一点延迟，因为数量加载没有那么快
	setTimeout(function() {

		MyMessageBoard();
	}, 1000);
</script>
</html>
