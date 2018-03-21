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

<title>My JSP 'topic_search.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/index.css">
<style type="text/css">
#searchbtn:hover {
	background-color: #FF8400;
	width: 60px;
	height: 30px;
	border: none;
}

#searchbtn {
	background-color: blue;
	width: 60px;
	height: 30px;
	border: none;
	color: #ffffff;
}

.search {
	width: 500px;
	margin: 0 auto;
}

#search_input {
	width: 300px;
	height: 30px;
	margin-top: 20px;
}

#topicscontainer {
	margin-bottom: 100px;
}
</style>
</head>

<body>
	<div>
		<jsp:include page="navbar.jsp"></jsp:include>
	</div>
	<div style="clear: both;"></div>
	<div style="width: 1000px;background: #fff;margin: 20px auto;overflow: hidden;">
		<div class="search" style="margin-top: 20px;">
			<center><h1>搜索曝光内容</h1></center>
			<span>搜索帖子内容</span> <input id="search_input" type="" name="">
				<button id="searchbtn">搜索</button>
		</div>
		<div id="topicscontainer"></div>
	</div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
<script type="text/javascript">
	search_words = "";
	start = 0;
	end = false;
	function gettopic(start, words) {
		if (words == "") {
			return;
		}

		$
				.ajax({
					type : "post",
					url : "ajax/searchtopic",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
					data : {//设置数据源
						start : start,
						words : words,
					},
					dataType : "json",//设置需要返回的数据类型
					success : function(data) {
						//alert(data);

						var d = eval("(" + data + ")");//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构
						if (start >= 5) {
							//设置分隔线
							$("#topicscontainer")
									.append(
											'<p style="text-align:center">----------上一次你看到了这里----------</p>');
						}
						var defaultimg = "this.src='images/defaultimg.jpg'";
						if (d.length == 0) {
							end = true;
						}
						for (var i = 0; i < d.length; i++) {
							//alert("i"+i);
							$("#topicscontainer")
									.append(
											'<div id="tab" class=""><div class="user"><div class="headimg"><img src="/upload/'+d[i].userid+'/headimg.jpg" onerror="'+defaultimg+'" ></div><div class="headinfo"><li class="name"><a href="login/userpage.action?userid='
													+ d[i].userid
													+ '">'
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
													+ '</div><a class="addcomment" href="javascript:void(0);">评论('
													+ d[i].comsize
													+ ')</a> <a class="putegg" href="javascript:void(0);">扔鸡蛋('
													+ d[i].egg
													+ ')</a> <a class="followit" href="javascript:void(0);">+关注</a></div><div class="comment_below"><div class="comment_input" contenteditable="true" id="text'+d[i].id+'"></div><div class="comment_btn"><button>评论</button></div><div style="float: right;" class="emotion"><button>表情</button></div> <div style="clear: both;"></div><div class="sample_comment"></div></div></div>');

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
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#searchbtn").click(function() {
			$("#topicscontainer").empty();
			search_words = $("#search_input").val();
			start = 0;
			gettopic(start, search_words);
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
				if (end) {
					return;
				}
				start = start + 5;
				gettopic(start, search_words);
			} else if (scrollTop <= 0) {
				//滚动条距离顶部的高度小于等于0 TODO
				//alert("下拉刷新，要在这调用啥方法？");
			}
		});
	});
</script>
</html>
