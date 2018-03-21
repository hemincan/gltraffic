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

<title>My JSP 'index_exposed.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<%@taglib prefix="s" uri="/struts-tags"%>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<!-- jquery放在navbar -->
<link rel="stylesheet" type="text/css" href="css/shadow.css">
<link rel="stylesheet" href="css/tab.css">
<script type="text/javascript" src="js/jquery.min_qqface.js"></script>
<script type="text/javascript" src="js/jquery.qqFace.js"></script>
<link rel="stylesheet" href="css/dropify.min.css">
<script src="js/dropify.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('.emotion').qqFace({
			id : 'facebox',
			assign : 'text',//表情赋值id元素
			path : 'arclist/' //表情存放的路径
		});
	});
</script>
<script type="text/javascript">
	
</script>
<style type="text/css">
#edit li {
	float: left;
	margin-right: 5px;
}

#text {
	min-height: 80px;
	height: auto;
	background-color: #ffffff;
	margin: 8px;
	padding: 5px;
	word-break: break-all;
	box-shadow: 0 0 30px #999 inset;
	-webkit-box-shadow: 0 0 5px #999 inset;
	-moz-box-shadow: 0 0 5px #999 inset;
	-o-box-shadow: 0 0 5px #999 inset;
}

#text img {
	width: auto;
}

#tiltie_text {
	height: 20px;
	background-color: #ffffff;
	margin: 8px;
}

.qqFace {
	margin-top: 4px;
	background: #fff;
	padding: 2px;
	border: 2px #ddd solid;
}

.qqFace table td {
	padding: 3px;
}

.qqFace table td img {
	cursor: pointer;
	border: 1px #fff solid;
}

.qqFace table td img:hover {
	border: 1px #0066cc solid;
}
</style>


<!-- 新加的 -->
<script type="text/javascript">
	// $(document).ready(function () {
	// 	$(document).on("click",".remove",function(event){
	// 		var imgid=$(this).attr("id")
	// 		var files = event.target.files
	// 		alert(files.length)
	// 	});
	// });
	$(document).ready(function() {
		var files = $("#dropify");
		files.after(files.clone().val(""));
		files.remove();
	});
	$(document).ready(function() {
		$(".picture").click(function() {
			$(".addpicture").slideDown();
		});
	});
	function change(event, x) {
		gevent = event
		$(x).parent().next().empty();

		var files = event.target.files, file;
		if (files && files.length > 0) {

			// 下面是关键的关键，通过这个 file 对象生成一个可用的图像 URL
			// 获取 window 的 URL 工具
			for (var i = 0; i < files.length; i++) {

				file = files[i];
				if (file.size > 1024 * 1024 * 100) {
					alert('图片大小不能超过 100MB!');
					return false;
				}
				// for (var s in file) {
				 	//alert(s+":"+file[s])
				//}
				//alert(file.type)
				//alert(file.type.match("video"))
                if(file.type.match("video")!=null){
                    $(x).parent().next().append(
						'<div class="imgstyle">添加了一个文件'+file.name+'</div>')
                     return
                }
				var URL = window.URL || window.webkitURL;
				// 通过 file 生成目标 url
				var imgURL = URL.createObjectURL(files[i]);
				// 用这个 URL 产生一个 <img> 将其显示出来
				//$(x).next().attr('src', imgURL);
                
				$(x).parent().next().append(
						'<div class="imgstyle"><img src="'+imgURL+'" ></div>')
				// 使用下面这句可以在内存中释放对此 url 的伺服，跑了之后那个 URL 就无效了
				// URL.revokeObjectURL(imgURL);
			}
		}

	}
</script>
<style type="text/css">
#dropify {
	position: absolute;
	font-size: 40px;
	/*right: 0;*/
	top: 0;
	opacity: 0;
	filter: alpha(opacity = 0);
	/*cursor: pointer*/
	background-color: #ffffff;
}

.imgstyle {
	height: 100px;
	width: 160px;
	background-color: #ffffff;
	float: left;
	margin: 5px;
}

.imgstyle img {
	height: 100%;
	width: 100%;
}

.inputstyle {
	height: 50px;
	width: 350px;
	line-height: 20px;
	position: relative;
	cursor: pointer;
	border: 1px solid #ddd;
	border-radius: 4px;
	overflow: hidden;
	display: inline-block;
	*display: inline;
	*zoom: 1;
	margin-left: 150px;
	/* float: left;*/
	line-height: 50px;
	font-size: 30px;
}

.inputstyle p {
	text-align: center;
}

.imgpanel {
	background-color: #000000;
}

.addpicture {
	overflow: hidden;
	width: 100%;
	display: none;
}

.exposed {
	width: 97%;
	background-color: #fff;
	padding: 10px;
	margin: 5px auto;
	border: 1px solid #ccc;
	font-size: 16px;
	padding: 10px;
}

.exposeicon {
	width: 30px !important;
}

.radiostytle label {
	font-weight: normal;
}
#animinformation{
	color: #eb7350;
}
</style>
<script type="text/javascript">
	function sumit(form) {
		if ($("#expos_userid").html() == "") {
			alert("请先登录！");
			return false;

		} else if ($("#text").html() == "") {
			alert("请输入内容！");
			return false;
		} else {
			$("#tiltle").val($("#tiltie_text").html());
			$("#content").val($("#text").html());
			return true;
		}
	}
</script>
<script type="text/javascript">
	//控制提示语动
	a = new Array();
	a.push("请不要故意制造谣言，我们会依法处置造谣者！");
	a.push("欢迎你的使用，遇到了不文明的行为？在这里曝光");
	a.push("和谐交通，为了自己的生命安全，请注意不要违反交通法规");
	current = 0;
	window.setInterval(function() {
		$("#animinformation").text(a[current]);
		current = (current + 1) % a.length;

	}, 3000);
</script>
</head>
<body id="exposed">

	<div class="exposed" id="edit">
		<!-- 用判断 有没有登录  -->
		<div id="expos_userid">${session.userid }</div>

		<div id="animinformation"></div>
		<s:form action="newtopic" namespace="/login"
			onsubmit="return sumit(this)" method="post"
			enctype="multipart/form-data" theme="simple">
			<!--  <div id="tiltie_text" contenteditable="true"></div>
			<s:select name="topicType" list="{'曝光','闲聊','其他'}"
				multiple="false" />
			-->
			<div id="text" contenteditable="true"></div>
			<div class="radiostytle">
				选择曝光类型：
				<s:radio
					list="#{'闯红灯':'闯红灯','乱停车':'乱停车','超速行驶':'超速行驶','扰乱公共秩序':'扰乱公共秩序','吐槽':'吐槽','其他':'其他'}"
					name="topicType" value="其他" />
			</div>
			<div class="radiostytle">
				事件发生地区：
				<s:radio
					list="#{'七星区':'七星区','秀峰区':'秀峰区','象山区':'象山区','临桂区':'临桂区','雁山区':'雁山区','叠彩区':'叠彩区','其他':'其他'}"
					name="topicLocation" value="其他" />
			</div>
			<s:textarea name="topicTiltle" id="tiltle" style="display:none"></s:textarea>
			<s:textarea name="topicContent" id="content" style="display:none"></s:textarea>
			<div style="height: 40px;">
				<li class="emotion"><a href="javascript:void(0);"><img
						src="icon/emoji.png" class="exposeicon" />表情</a></li>
				<li class="picture"><a href="javascript:void(0);"><img
						src="icon/camera.png" class="exposeicon" />图片</a></li>
				<li class="picture"><a href="javascript:void(0);"><img
						src="icon/video.png" class="exposeicon" />视频</a></li>
				<li style="float: right;"><button type="submit"
						class="btn btn-success ">发 布</button></li>
			</div>


			<div class="addpicture">
				<div class="inputstyle">

					<p>
						<img alt="" src="icon/addition.png" class="exposeicon">添加图片或者视频
					</p>
					<s:file name="images" multiple="multiple" id="dropify"
						onchange="change(event,this)"></s:file>
				</div>
				<div class="imgpanel"></div>
			</div>
		</s:form>

	</div>

</body>
</html>
