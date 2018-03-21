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

<title>我的主页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%
	Object userid = session.getAttribute("userid");
	//out.print(userid);
	if (userid == null) {
		response.sendRedirect("welcomelogin.jsp");
	} else {

	}
%>
<link rel="stylesheet" type="text/css" href="css/index.css">
<link rel="stylesheet" type="text/css" href="css/mypage.css">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>

</head>

<body>
	<div>
		<jsp:include page="navbar.jsp"></jsp:include>
	</div>
	<div style="clear: both;"></div>


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

						getTopic(Number($("#mytopic").children("#topic_size")
								.text()), page);
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
	function getTopic(topiccount, nowpage) {
		$
				.ajax({
					type : "post",
					url : "ajax/mytopiclist",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
					data : {//设置数据源
						//'userid' : $("#userid_navbar").text(),
						'topiccount' : topiccount,
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
							$("#topiccontainer")
									.append(
											'<div id="tab" class=""><div class="user"><div class="headimg"><img src="/upload/'+d[i].userid+'/headimg.jpg" onerror="'+defaultimg+'"></div><div class="headinfo"><li class="name"><a href="javascript:void(0)">'
													+ d[i].username
													+ '</a></li><li class="time">发布时间：'
													+ d[i].time
													+ '</li><li class="time"><img src="icon/location.png" class="iconimg"/>发生地点：'
													+ d[i].location
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
													+ '</div><a class="addcomment" href="javascript:void(0);"><img src="icon/message.png" class="iconimg"/>评论('
													+ d[i].comsize
													+ ')</a>  <a class="putegg" href="javascript:void(0);"><img src="icon/praise.png" class="iconimg"/>扔鸡蛋('
													+ d[i].egg
													+ ')</a> <a class="deletetopic" href="javascript:void(0);">删除</a></div><div class="comment_below"><div class="comment_input" contenteditable="true" id="text'+d[i].id+'"></div><div class="comment_btn"><button>评论</button></div><div style="float: right;" class="emotion"><button>表情</button></div> <div style="clear: both;"></div><div class="sample_comment"></div></div></div>');

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

		getTopic(totalcount_, 1);
		pagetype = 0;
		initPage(totalcount_);//重新初始化我的topic的页
		$(".mycontent_right").children(".common_headfont_big").text("我的曝光");
	}
	//$(document).ready($("#mytopic").click(function() {
	//Topic();
	//}));
	//打开网页最先加载那一部分，稍微有一点延迟，因为数量加载没有那么快
	setTimeout(function() {
		Topic();
	}, 1000);

	//删除贴子
	function deletetopic(topicid) {
		$.ajax({
			type : "post",
			url : "ajax/deletetopic",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
			data : {//设置数据源
				'topicid' : topicid
			},
			dataType : "json",//设置需要返回的数据类型
			success : function(data) {
				//alert(data);

				var d = eval("(" + data + ")");

				if (d.code == 1) {
					showhint("没有登录");//这个函数写在navbar.jsp上
				} else if (d.code == 2) {
					showhint("帖子不存在，请刷新重试");
				} else if (d.code == 3) {
					showhint("删除成功！");
				}
			},
			error : function() {
				alert("系统异常，请稍后重试！");
			}//这里不要加","
		});
	}
	$(document).ready(function() {
		$(document).on("click", ".deletetopic", function() {
			var topicid = $(this).siblings("#topicid_undisplay").text();
			if (!confirm('是否真的要删除这条帖子，')) {
				
				return ;
			}
			deletetopic(topicid);
		});

	});
</script>

</html>
