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

<title>My JSP 'userpage.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/index.css">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

<!-- umeditor引用 -->
<link href="umeditor/themes/default/css/umeditor.css" type="text/css"
	rel="stylesheet">
<script type="text/javascript"
	src="umeditor/third-party/template.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="umeditor/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="umeditor/umeditor.min.js"></script>
<script type="text/javascript" src="umeditor/lang/zh-cn/zh-cn.js"></script>

<style type="text/css">
#userpage {
	width: 1200px;
	margin: 10px auto;
	padding: 10px;
	overflow: hidden;
}

.userpage_userinfo {
	background: #fff;
	border: 1px solid #ccc;
	width: 20%;
	float: left;
	font-size: 18px !important;
}

.userpage_userinfo ul {
	margin-top: 30px;
	padding: 0px;
}

.userpage_userinfo ul li {
	line-height: 30px;
	list-style-type: none;
	padding: 5px;
}

.userpage_userinfo ul li:hover {
	border-left: 3px solid #a81f23;
}

.current_select {
	background-color: #eee;
	border-left: 3px solid #a81f23;
}

.userpage_usertopics {
	background: #fff;
	border: 1px solid #ccc;
	width: 79%;
	float: left;
	padding: 10px;
	margin-left: 5px;
}

.userpage_umediter {
	display: none;
}

.userpage_umediter img {
	width: auto !important;
}

.userpage_headimg {
	text-align: center;
}

.userpage_headimg img {
	width: 100px !important;
	margin-top: 30px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$(".userpage_userinfo ul li").click(function() {
			$(".userpage_userinfo ul li").removeClass("current_select");
			$(this).addClass("current_select");
		});
	});
</script>
</head>

<body>
	<div>
		<jsp:include page="navbar.jsp"></jsp:include>
	</div>
	<div style="clear: both;"></div>
	<div id="userpage">
		<!-- 如果 不想显示userid 用css隐起来，不要删掉，下面Js 要用 -->
		<div>
			<h1>
				欢迎来到${user.userName }(<span id="userpage_userid">${user.userId}</span>)的主页
			</h1>
		</div>
		<div class="userpage_userinfo">
			<div class="userpage_headimg">
				<img alt="" src="/upload/${user.userId}/headimg.jpg"
					onerror="this.src='images/defaultimg.jpg'">
			</div>
			<ul>
				<li id="userpage_topic" class="current_select">他的曝光帖子(<span
					id="topic_size">${topiccount }</span>)
				</li>
				<li id="givemessagetohim">给他留言</li>
			</ul>
		</div>
		<div class="userpage_usertopics">

			<div class="common_headfont">他的帖子</div>

			<!-- 留言输入器 默认隐藏 -->
			<div class="userpage_umediter">
				<script type="text/plain" id="myEditor"
					style="width:900px;height:200px;z-index:1"></script>
				<script type="text/javascript">
					//实例化编辑器
					var um = UM.getEditor('myEditor');
				</script>
				<button id="userpage_givehimemessage" class="btn btn-success" style="float: right;" >留言</button>
			</div>


			<div class="userpage_topiccontainer"></div>

			<div id="page"></div>
		</div>

	</div>
	<div style="clear: both;"></div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$("#givemessagetohim").click(function() {
			$(".common_headfont").text("给他留言");
			$(".userpage_umediter").slideDown();
			$(".userpage_topiccontainer").hide();
			$("#page").hide();
		});

		$("#userpage_topic").click(function() {
			$(".common_headfont").text("他的帖子");
			$(".userpage_umediter").hide();
			$(".userpage_topiccontainer").show();
			$("#page").show();
		});

		//
	});
</script>

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
				var totalcount_ = Number($("#topic_size").text());
				var userid = $("#userpage_userid").text();
				getTopic(Number(totalcount_), page, userid);
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
	//点击我的曝光
	function getTopic(topiccount, nowpage, userid) {
		$
				.ajax({
					type : "post",
					url : "ajax/usertopics",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
					data : {//设置数据源
						//'userid' : $("#userid_navbar").text(),
						'userid' : userid,
						'topiccount' : topiccount,
						'nowpage' : nowpage
					},
					dataType : "json",//设置需要返回的数据类型
					success : function(data) {
						//把之前的移除
						$(".userpage_topiccontainer").empty();
						//alert(data);
						var d = eval("(" + data + ")");//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构		
						//alert(d.nowpage + " dfdsf  " + d.toltalpages);
						//totalpages=d.toltalpages;
						var d = d.jsondata;
						var defaultimg = "this.src='images/defaultimg.jpg'";
						for (var i = 0; i < d.length; i++) {
							//alert("i"+i);
							$(".userpage_topiccontainer")
									.append(
											'<div id="tab" class=""><div class="user"><div class="headimg"><img src="/upload/'+d[i].userid+'/headimg.jpg" onerror="'+defaultimg+'"></div><div class="headinfo"><li class="name"><a href="">'
													+ d[i].username
													+ '</a></li><li class="time">发布时间：'
													+ d[i].time
													+ '</li></div><div class="type">点击量：'
													+ d[i].readed
													+ '</div></div><div class="content"><a href="login/detailtopic.action?topicid='
													+ d[i].id
													+ '"><p class="tab_tiltle">'
													+ d[i].tiltle
													+ '</p><p class="tab_content">['
													+ d[i].type
													+ ']'
													+ d[i].content
													+ '</p><div class="images"></div></a></div><div class="line"></div><div class="tail"><div id="topicid_undisplay" style="display: none;">'
													+ d[i].id
													+ '</div><a class="addcomment" href="javascript:void(0);">评论('
													+ d[i].comsize
													+ ')</a>  <a class="putegg" href="javascript:void(0);">扔鸡蛋('
													+ d[i].egg
													+ ')</a> <a class="deletetopic" href="javascript:void(0);"></a></div><div class="comment_below"><div class="comment_input" contenteditable="true" id="text'+d[i].id+'"></div><div class="comment_btn"><button>评论</button></div><div style="float: right;" class="emotion"><button>表情</button></div> <div style="clear: both;"></div><div class="sample_comment"></div></div></div>');

							var images = new Array();
							//images也包含视频
							var userid = d[i].userid;
							images = d[i].images.split("|");
							//alert(images.length)
							var t = $("div[id='tab']").last();
							for (var j = 0; j < images.length - 1; j++) {
								var filetype = images[j].match(/\.(.*)/)[1];
								filetype = filetype.toLowerCase();
								//alert(filetype);
								//图片支持png gif jpg
								if (filetype == "png" || filetype == "gif"
										|| filetype == "jpg") {
									t
											.find(".images")
											.append(
													'<img alt="" src="/upload/'+userid+'/'+images[j]+'">');
								} else if (filetype == "mp4"
										|| filetype == "avi"
										|| filetype == "3gp"
										|| filetype == "rmvb") {
									//onclick()原因不想触发父控件的事件
									t
											.find(".images")
											.append(
													'<video onclick="this.pause();" src="/upload/'
															+ userid
															+ '/'
															+ images[j]
															+ '" controls="controls">您的浏览器不支持 video 标签。</video>');
								} else {
									t.find(".images").append(
											'<p>有非图片或者视频的内容!</p>');
								}
							}

						}
					},
					error : function() {
						alert("系统异常，请稍后重试！222");
					}//这里不要加","
				});

	}
	//获得关注列表

	pagetype = 0;//控制分页是关注，还是我的曝光
	function Topic() {
		var totalcount_ = Number($("#topic_size").text());
		var userid = $("#userpage_userid").text();
		getTopic(totalcount_, 1, userid);
		pagetype = 0;
		initPage(totalcount_);//重新初始化我的topic的页
		//$(".mycontent_right").children(".common_headfont").text("我的曝光");
	}
	//$(document).ready($("#mytopic").click(function() {
	//Topic();
	//}));
	//打开网页最先加载那一部分，稍微有一点延迟，因为数量加载没有那么快
	setTimeout(function() {
		Topic();
	}, 500);
</script>

<script type="text/javascript">
	//给用户留言
	$(document).ready(function() {
		$("#userpage_givehimemessage").click(function() {
			var content = um.getContent();
			//alert(content);
			if (content == "") {
				return;
			}
			$.ajax({
				type : "post",
				url : "ajax/newmessageboard",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
				data : {//设置数据源

					'touserid' : $("#userpage_userid").text(),
					'messboard.messbContent' : content,
				},
				dataType : "json",//设置需要返回的数据类型
				success : function(data) {

					var d = eval("(" + data + ")");

					if (d.code == 1) {//没有登录
						
						showhint("请先登录");
					} else if (d.code == 2) {//touserid为空
						showhint("找不到你要给谁留言，请刷新重试");
					} else if (d.code == 3) {//成功
                        um.setContent("");
						showhint("留言成功");
					}
				},
				error : function() {

				}
			});
		});
	});
</script>
</html>
