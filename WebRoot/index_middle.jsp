<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'index_middle.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%@taglib prefix="s" uri="/struts-tags"%>
<link rel="stylesheet" type="text/css" href="css/index.css">
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="js/lrtk2.js"></script>

<script type="text/javascript">
	var ONEPAGESHOW = 5;
	var MODE = "expose";//是点击了最新，还是默认的曝光，那下一页请求的函数不一样,而且显示的new图片不一样
	var newString = '<img src="icon/new.gif" class="iconimgbig"/>';
	var imgstring = "";
	var nextstart = ONEPAGESHOW;
	function loadtopic() {
		var whatsmode = MODE;
		if (whatsmode == "expose") {
			whatsmode = "";
		} else {
			whatsmode = "new";
		}
		gettopic(nextstart, whatsmode);
		nextstart = nextstart + ONEPAGESHOW;
	}
	$(document).ready(function() {
		gettopic(0);
	});
	$(document).ready(function() {
		$("#moretopic").click(function() {
			loadtopic();
		});
	});
	function gettopic(start, gettype) {
		$
				.ajax({
					type : "post",
					url : "ajax/topiclistajax",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
					data : {//设置数据源
						start : start,
						gettype : gettype,
					},
					dataType : "json",//设置需要返回的数据类型
					success : function(data) {
						//alert(data);
						var d = eval("(" + data + ")");//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构
						if (start >= 5) {
							//设置分隔线
							$("#moretopic")
									.before(
											'<p style="text-align:center">----------上一次你看到了这里----------</p>');
						}
						var defaultimg = "this.src='images/defaultimg.jpg'";
						for (var i = 0; i < d.length; i++) {
							//alert("i"+i);
							$("#moretopic")
									.before(
											'<div id="tab" class=""><div class="user"><div class="headimg"><img src="/upload/'+d[i].userid+'/headimg.jpg" onerror="'+defaultimg+'" ></div><div class="headinfo"><li class="name"><a href="login/userpage.action?userid='
													+ d[i].userid
													+ '">'
													+ d[i].username
													+ '</a></li><li class="time">发布时间：'
													+ d[i].time
													+ '</li><li class="time"><img src="icon/location.png" class="iconimg"/>发生地点：'
													+ d[i].location
													+ '</li>'
													+ imgstring
													+ '</div><div class="type">点击量：'
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
													+ ')</a> <a class="putegg" href="javascript:void(0);"><img src="icon/praise.png" class="iconimg"/>扔鸡蛋(<span id="eggsize">'
													+ d[i].egg
													+ '</span>)</a> <a class="followit" href="javascript:void(0);"><img src="icon/addition.png" class="iconimg"/>关注</a></div><div class="comment_below">想要说什么，在这里输入并提交<div class="comment_input" contenteditable="true" id="text'+d[i].id+'"></div><div class="comment_btn"><button  class="btn btn-success">评论</button></div><div style="float: right;" class="emotion"><img src="icon/emoji.png" class="iconimg"/></div> <div style="clear: both;"></div><div class="sample_comment"></div></div></div>');

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
						alert("系统异常，请稍后重试！获取帖子");
					}//这里不要加","
				});

	}

	$(document).ready(
			function() {
				$("#newest_topics").click(
						function() {
							nextstart = ONEPAGESHOW;
							MODE = "new";
							imgstring = newString;
							$("#topicscontainer").empty();
							$("#topicscontainer").append(
									'<button id="moretopic">查看更多</button>');
							gettopic(0, "new");
							//alert();
						});
			});
	$(document).ready(
			function() {
				$("#expose_topics").click(
						function() {
							nextstart = ONEPAGESHOW;
							MODE = "expose";
							imgstring = "";
							$("#topicscontainer").empty();
							$("#topicscontainer").append(
									'<button id="moretopic">查看更多</button>');
							gettopic(0);
							//alert();
						});
			});
</script>




<style type="text/css">
.qqFace {
	margin-top: 4px;
	background: #fff;
	padding: 2px;
	border: 2px #000000 solid;
}

.qqFace table td {
	padding: 1px;
}

.qqFace table td img {
	cursor: pointer;
	border: 1px #fff solid;
}

.qqFace table td img:hover {
	border: 1px #0066cc solid;
}
</style>
<script type="text/javascript" src="js/jquery.min2.js"></script>
<link rel="stylesheet" href="css/dropify.min.css">
<script src="js/dropify.min.js"></script>
<script type="text/javascript" src="js/jquery.min_qqface.js"></script>
<script type="text/javascript" src="js/jquery.qqFace.js"></script>
<script type="text/javascript">
	/*$(document).ready(function(){
	 $('.emotion').qqFace({
	 id : 'facebox', 
	 assign:'text', 
	 path:'arclist/'	//表情存放的路径
	 });
	 });*/
</script>
<style type="text/css">
.airtle {
	width: 700px;
	margin-left: 0px;
	float: left;
}

.airtle h2 {
	color: white;
	padding: 10px;
	font-size: 17px;
}

#header {
	width: 1280px;
	margin: 0 auto;
	/*background-color: #F7F7F7;*/
}

#header .left {
	margin: 5px;
	float: left;
	width: 310px;
	float: left;
}
</style>
<script type="text/javascript">
	//关注
	$(document).ready(
			function() {
				$(document).on(
						"click",
						".followit",
						function() {
							//alert("关注");
							$.ajax({
								type : "post",
								url : "ajax/follow",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
								data : {//设置数据源
									topicid : $(this).parent().children(
											"#topicid_undisplay").text()
								//,号
								},
								dataType : "json",//设置需要返回的数据类型
								success : function(data) {
									var d = eval("(" + data + ")");
									//code的意义 1未登录 ，code 2 关注的主题目不合法 3成功
									if (d.code == 1) {
										showhint("请先登录！");
									} else if (d.code == 2) {
										showhint("由于你操作频繁，出现一些异常，请刷新页面重试！");
									} else if (d.code == 3) {
										showhint("关注成功");
									} else if (d.code == 4) {
										showhint("你已关注此帖子");
									}
								},
								error : function() {
									alert("系统异常，请稍后重试！");
								}//这里不要加","
							});

						});
			});
	//提交扔鸡蛋的ajax
	$(document).ready(
			function() {

				$(document).on(
						"click",
						".putegg",
						function() {
							var eggcontent = $(this);
							//alert($(this).parent().children("#topicid_undisplay").text());
							$.ajax({
								type : "post",
								url : "ajax/putegg",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
								data : {//设置数据源
									topicid : $(this).parent().children(
											"#topicid_undisplay").text()
								//,号
								},
								dataType : "json",//设置需要返回的数据类型
								success : function(data) {
									var d = eval("(" + data + ")");//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构
									//得到的d是一个形如{"key":"value","key1":"value1"}的数据类型，然后取值出来

									var d = eggcontent.children("#eggsize")
											.text();
									d = Number(d) + 1;
									eggcontent.children("#eggsize").text(d);

								},
								error : function() {
									alert("系统异常，请稍后重试！");
								}//这里不要加","
							});

						});
			});

	//提交评论的ajax
	$(document).ready(
			function() {
				$(document).on(
						"click",
						".comment_btn",

						function() {
							var comment_content = $(this).siblings(
									".comment_input");
							$.ajax({
								type : "post",
								url : "ajax/putcomment",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
								data : {//设置数据源
									topicid : $(this).parent()
											.siblings(".tail").children(
													"#topicid_undisplay")
											.text(),
									//userid : $("#userid_navbar").text(),
									commentContent : comment_content.html()
								//,号
								},
								dataType : "json",//设置需要返回的数据类型
								success : function(data) {
									comment_content.html("");
									var d = eval("(" + data + ")");//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构
									//得到的d是一个形如{"key":"value","key1":"value1"}的数据类型，然后取值出来
									//alert(d.code);
									if (d.code == 1) {
										showhint("请先登录！");
									} else if (d.code == 2) {
										showhint("请先输入评论内容！");
									} else if (d.code == 3) {
										showhint("评论成功");
									}
									//$("#s_name").text("" + d.name + "");

								},
								error : function() {
									comment_content.html("");
									alert("系统异常，请稍后重试！提交评论");
								}//这里不要加","
							});

						});
			});

	//获取评论的ajax
	$(document)
			.ready(
					function() {

						$(document)
								.on(
										"click",
										".addcomment",
										function() {
											var commentset = $(this).parent()
													.siblings(".comment_below");
											commentset.children(
													".sample_comment").remove();
											var topicidd = $(this)
													.parent()
													.children(
															"#topicid_undisplay")
													.text();
											$
													.ajax({
														type : "post",
														url : "ajax/commentlistajax",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
														data : {//设置数据源
															topicid : topicidd,
														},
														dataType : "json",//设置需要返回的数据类型
														success : function(data) {
															//alert(data);
															var d = eval("("
																	+ data
																	+ ")");//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构
															//得到的d是一个形如{"key":"value","key1":"value1"}的数据类型，然后取值出来

															for (var i = 0; i < d.length; i++) {
																//把表情转换成图片
																d[i].content = d[i].content
																		.replace(
																				/\[#([^\]]*)\]/g,
																				'<img src="umeditor/dialogs/emotion/images/$1.gif">');
																commentset
																		.append('<div class="sample_comment"><img src="/upload/'+d[i].userid+'/headimg.jpg"><a href="login/userpage.action?userid='+d[i].userid+'" id="username">'
																				+ d[i].username
																				+ '</a>  <span id="time">  评论时间：'
																				+ d[i].time
																				+ '</span><p id="content">'
																				+ d[i].content
																				+ '</p></div>');
															}

															commentset
																	.append('<div class="sample_comment common_morefont" style="text-align: center;padding:10px;"><a  href="login/detailtopic.action?topicid='
																			+ topicidd
																			+ '">查看更多<img src="icon/more.png" class="iconimg"/></a></div> ');
														},
														error : function() {
															alert("系统异常，请稍后重试！");
														}//这里不要加","
													});

										});
					});
</script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$(document).on(
						"click",
						".addcomment",
						function() {
							$(this).parent().siblings(".comment_below")
									.slideDown();
							//alert($(this).parent().siblings(".comment_below").html());
							//$(".comment_below").slideDown();
							// $(".comment_below").slideUp();
							var assignname = $(this).parent().siblings(
									".comment_below")
									.children(".comment_input").attr("id");
							//alert(assignname);
							$(this).parent().siblings(".comment_below")
									.children(".emotion").qqFace({
										id : 'facebox',
										assign : assignname,
										path : 'arclist/' //表情存放的路径
									});
						});
			});
	$(document).ready(function() {
		$(document).on("click", ".comment_btn", function() {
			// $(".comment_below").slideDown();
			var comment = $(this).siblings(".comment_input").html();
			//alert(comment);
			$(this).siblings(".comment_area").text(comment);
			$(this).parent().slideUp(1000, function() {

			});
		});
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		//自动加载更多
		//滚动条到页面底部加载更多案例 
		//var scrollHeight = $(document).height(); //当前页面的总高度
		//	var clientHeight = $(this).height(); //当前可视的页面高度
		//在index.jsp声明html文档时如果用自带的声明会使这两个值相同
		$(window).scroll(function() {
			var scrollTop = $(this).scrollTop(); //滚动条距离顶部的高度
			var scrollHeight = $(document).height(); //当前页面的总高度
			var clientHeight = $(this).height(); //当前可视的页面高度
			/*console.log("top:" + scrollTop+ ",doc:"
							+ scrollHeight
							+ ",client:"
							+ clientHeight);*/
			if (scrollTop + clientHeight >= scrollHeight) { //距离顶部+当前高度 >=文档总高度 即代表滑动到底部 count++;         //每次滑动count加1
				loadtopic();
			} else if (scrollTop <= 0) {
				//滚动条距离顶部的高度小于等于0 TODO
				//alert("下拉刷新，要在这调用啥方法？");
			}
		});
	});
</script>
<style type="text/css">
#recommend {
	width: 315px;
}

.recommend_fixd {
	position: fixed;
	top: 50px;
}

.login_fixd {
	position: fixed;
	top: 50px;
}
</style>
<script type="text/javascript">
	//左边档固定
	$(document).ready(function() {
		$(window).scroll(function() {
			var top = $(window).scrollTop();
			//console.log(top);
			if (top >= 401) {
				$("#recommend").addClass("recommend_fixd");

			} else if (top < 401) {
				$("#recommend").removeClass("recommend_fixd");
			}
		});
	});

	//右边个人信息与登录固定
	$(document).ready(function() {
		$(window).scroll(function() {
			var top = $(window).scrollTop();
			//console.log(top);
			if (top >= 191) {
				$("#login_middle").addClass("login_fixd");

			} else if (top < 401) {
				$("#login_middle").removeClass("login_fixd");
			}
		});
	});
</script>
<style type="text/css">
/*帖子导航css*/
.select_tag {
	width: 80px;
	height: 100%;
	background-color: #fff;
	margin-right: 5px;
	float: left;
	text-align: center;
	line-height: 40px;
	font-weight: bolder;
	font-size: 14px;
}

.select_tag:hover {
	border-bottom: 3px solid red;
	background-color: #eee;
}

.select_tag_current {
	border-bottom: 3px solid red;
}

#exposedwindow {
	
}

#iwantexposed {
	color: red;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {
		$(".select_tag").click(function() {
			$(".select_tag_current").removeClass("select_tag_current");
			$(this).addClass("select_tag_current");
		});
	});
	$(document).ready(function() {
		$("#iwantexposed").click(function() {
			$("#exposedwindow").slideToggle();
		});
	});
</script>
</head>
<body>
	<div id="header" style="overflow: hidden;">
		<div class="left">

			<div style="height: 230px; overflow: hidden;">
				<jsp:include page="index_banner.jsp"></jsp:include>

			</div>
			<div style="margin-top: 0px;">
				<div id="recommend">
					<jsp:include page="index_recommend.jsp"></jsp:include>
                    <div style="margin-top: 5px;"></div>
					<jsp:include page="index_trafficlearn.jsp"></jsp:include>
				</div>

			</div>

		</div>

		<div class="airtle">

			<div
				style="height: 40px;width: 680px;margin:0 auto; background-color: #fff;border: 1px solid #ccc;">
				<li class="select_tag select_tag_current" id="expose_topics">最热<img
					src="icon/hot.gif" style="width: 27px;" /></li>
				<li class="select_tag" id="newest_topics">最新<img
					src="icon/new.gif" class="iconimgbig" /></li>
				<li class="select_tag" id="iwantexposed"><img
					src="icon/video2.png" class="iconimgbig" />曝光</li>
			</div>
			<div id="exposedwindow">
				<jsp:include page="index_exposed.jsp"></jsp:include>
			</div>
			<div id="topicscontainer">




				<button id="moretopic">查看更多</button>
			</div>
		</div>


		<div style="margin-left: 0px; float: left;">
			<div id="login_middle">
				<jsp:include page="login.jsp"></jsp:include>

				<div style="margin-top: 20px;width: 250px;">
					<jsp:include page="index_myfollow.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
