
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>帖子详细</title>
<%@taglib prefix="s" uri="/struts-tags"%>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%
	//违规帖子 直接不用看了
	Object illegal = session.getAttribute("illegal");
	if (illegal.toString() == "yes") {
		out.print("这个帖子属于违规帖子，不能查看 ");
		return;
	}
%>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/topic_detail.css">

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
.loginwindows {
	width: 100%;
	height: 100%;
	position: fixed;
	margin: auto;
	top: 0px;
	bottom: 0px;
	left: 0px;
	right: 0px;
	background-image: url(images/b.png);
	background-repeat: repeat;
	z-index: 9999;
	display: none;
	z-index: 9999;
}

.loginmiddle {
	margin: 200px auto;
	width: 250px;
	height: 280px;
}

#closelogin {
	text-align: center;
}
</style>
<style type="text/css">
.reply_below {
	display: none;
}

.reply_input {
	margin: 5px;
	height: 100px;
	background-color: #fff;
	border: 1px solid #000;
}

.reply_btn {
	float: right;
}

.reply_container {
	border-top: 1px solid #eee;
}

.iconimg {
	width: 30px !important;
}
</style>
</head>

<body style="background-color: #fff;">

	<div class="loginwindows">
		<div class="loginmiddle">
			<jsp:include page="login.jsp"></jsp:include>
			<div id="closelogin">
				<h2>关闭</h2>
			</div>
		</div>
	</div>

	<div>
		<jsp:include page="navbar.jsp"></jsp:include>
	</div>
	<div id="content">

		<div class="allleft">
			<div class="right">
				<div class="right-user">
					<div class="headimg">
						<img src="/upload/${user.userId }/headimg.jpg"
							onerror="this.src='images/defaultimg.jpg'">
					</div>
					<div class="userinfo">
						<p>
							用户名：
							<s:property value="user.userName" />
						</p>
						<p>ID：${user.userId }</p>

						<p>
							<a href="login/userpage.action?userid=${user.userId }"><button
									type="button" class="btn btn-warning">查看该用户主页</button></a>
						</p>
						<p>帖子信息：</p>
						<p>
							时间：
							<s:date name="topic.topicPublicTime" format="yyyy-MM-dd" />
						</p>
						<p>
							分类：
							<s:property value="topic.topicType" />
						</p>
						<p>
							浏览量：
							<s:property value="topic.topicReaded" />
						</p>
					</div>
				</div>
				<div class="left-user">
					<div class="titlet">
						<div id="topicid_undisplay" style="display: none;">${topic.id }</div>
						<div>
							<h1 style="float: left;">
								[${topic.topicType }] [<img src="icon/location.png"
									class="iconimg" />${topic.topicLocation }]
								<s:property value="topic.topicTiltle" />
							</h1>
							<div style="float: right;margin: 10px;">
								<button type="button" class="btn btn-info" id="followtopic">关注这条内容</button>
							</div>
						</div>
						<div style="clear: both;"></div>
						<span class="info">时间：<s:date name="topic.topicPublicTime"
								format="yyyy-MM-dd hh:mm:ss" />&nbsp;&nbsp;&nbsp;&nbsp;分类：<s:property
								value="topic.topicType" />&nbsp;&nbsp;浏览量：<s:property
								value="topic.topicReaded" />
						</span>

					</div>
					<div class="contentt">
						<p class="regx_emotion">
							<s:property value="topic.topicContent" escape="false" />
						</p>
						<div class="images">
							${topic.topicImages}
							<!--<s:generator separator="|" val="topic.topicImages" id="images"></s:generator>
							<s:iterator value="#request.images" id="img">
								
									<img alt=""
										src="${pageContext.request.contextPath}/upload/${user.userId}/${img}">
							</s:iterator>
							-->
						</div>
						<div class="contentt_botom">


							<img src="icon/message.png" class="iconimg" /> 评论：
							<s:property value="commentsize" />
							<img src="icon/praise.png" class="iconimg" /> 鸡蛋:
							<s:property value="topic.topicEgg" />
							个
						</div>
					</div>
				</div>
			</div>



			<!--  -->
			<div style="clear: both;"></div>
			<div class="right">
				<div class="common_headfont">
					评论(
					<s:property value="commentsize" />
					)
				</div>
			</div>
			<s:iterator value="commentlist" id="cm">
				<div class="right">

					<div class="comment">
						<div id="left">
							<div id="headimg">
								<img src="/upload/${cm.user.userId }/headimg.jpg"
									onerror="this.src='images/defaultimg.jpg'">
							</div>
							<div style="text-align: center;">

								用户名：
								<s:property value="#cm.getUser().getUserName()" />
								<br> 用户ID：
								<s:property value="#cm.getUser().getUserId()" />
								<br> <a
									href="login/userpage.action?userid=${cm.user.userId }">查看该用户主页</a>
							</div>
						</div>
						<div id="right">
							<div>
								<span>评论时间：<s:date name="#cm.getCommentTime()"
										format="yyyy-MM-dd hh:mm:ss" />

								</span> <span style="float:right;">楼层 </span>
							</div>
							<div id="mid">
								<p class="regx_emotion">
									<s:property value="#cm.getCommentContent()" escape="false" />
									<s:if test="#cm.getComment()!= null">
										<div class="recommend">
											<div>
												<span>引用来自：</span> <span> <s:property
														value="#cm.getComment().getUser().getUserName()"
														escape="false" />
												</span>
											</div>
											<div>
												<s:property value="#cm.getComment().getCommentContent()"
													escape="false" />
											</div>
										</div>
									</s:if>
								</p>

							</div>

						</div>
					</div>



					<div style="padding: 5px; background: #FCFCFC;">
						<span style="float:right;"><a class="replycount"
							style="color: blue;font-size: 18px" href="javascript:void(0);"><s:property
									value="#cm.getComments().size()" />条回复，</a><a
							href="javascript:void(0);" class="addreply"
							style="font-size: 18px">我要回复</a></span>
						<div style="clear: both;"></div>
						<div class="reply_below">
							<div id="commentid_undisplay" style="display: none;">${cm.id }</div>
							<div style="font-size: 16px;">请在下面输入你想要回复的内容</div>
							<div class="reply_input" contenteditable="true" id=""></div>
							<div class="reply_btn">
								<button>评论</button>
							</div>
							<div style="clear: both;"></div>
							<div class="reply_container"></div>
						</div>
					</div>


				</div>


			</s:iterator>

			<div class="right">

				<div class="common_headfont">你对此有什么评论，可以在这里发表</div>
			</div>
			<div class="umediter">
				<script type="text/plain" id="myEditor"
					style="width:100%;height:100px;"></script>
				<script type="text/javascript">
					//实例化编辑器
					var um = UM.getEditor('myEditor');
				</script>
				<button style="float: right;" class="btn btn-success addcomment_btn">提交评论</button>
				<!--  <button style="float: right;" class="addcomment_btn">提交评论</button>-->
			</div>

		</div>


	</div>
	<div style="clear: both;"></div>
	<div style="display: none;">
		当前页：<span id="nowpage"><s:property value="nowpage" /> </span> 总页数：<span
			id="toltalpages"><s:property value="toltalpages" /> </span> 一页有：<span
			id="onepagenum"><s:property value="onepagenum" /> </span>
		<s:form action="detailtopic" namespace="/login" name="nextpage">
			<s:textfield name="topicid" id="topicid"></s:textfield>
			<s:textfield name="nowpage" id="pagenum"></s:textfield>
		</s:form>
	</div>
	<div id="page"></div>
	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
	<!-- 分页的css js -->
	<link rel="stylesheet" href="css/jquery.page.css">
	<script type="text/javascript" src="js/jquery.page.js"></script>
	<script type="text/javascript">
		//分页
		$(function() {
			//alert($("#nowpage").text());
			var linumss = $("#toltalpages").text();//总页数
			if (linumss >= 5) {//总共有多少页，如果大于5页，最多显示5页
				linumss = 5;
			}
			//alert(linumss);
			$("#page").Page({
				totalPages : Number($("#toltalpages").text()),//分页总数
				liNums : Number(linumss),//分页的数字按钮数(建议取奇数)
				activeClass : 'activP', //active 类样式定义
				callBack : function(page) {
					$("#pagenum").val(page);//点击页数，提交表单，获取那一页的数据
					document.nextpage.submit();
				}
			});
			if ($("#nowpage").text() != 1) {//主要为了样式
				$(".activP").removeClass("activP").parent().siblings(
						"#" + $("#nowpage").text()).addClass("activP");
			}
		});
	</script>
	<script type="text/javascript">
	//评论的评论
	$(document).ready(function(){
		$(".addreply").click(function(){
			//alert($(this).siblings(".reply_below").html());
			$(this).parent().siblings(".reply_below").show();
		});
	});
	/*旧reply
		$(document).ready(function() {
		$(".reply_btn").click(function(){
			//alert($(this).siblings(".reply_input").html());
			var cont=$(this).siblings(".reply_input");
			if(cont.html()==""){
				//alert("sdfsd")
				return;//空回复内容直接无视
			}
			$.ajax({
			type : "post",
			url : "ajax/newreply",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
			data : {//设置数据源
				//回复的内容
				'reply.replyContent' : $(this).siblings(".reply_input").html(),
				//给谁的回复，如果这个为空，那么是回复评论的，如果userid是用户名，不是主键Id
				//'reply.userByReplyToUserid.userId':"fdsf",
				//是谁回复,不可以从客户端口传过去
				//'reply.userByReplyUserId.userId' : $("#userid_navbar").text(),
				//回复那条评论
				'reply.comment.id' : $(this).siblings("#commentid_undisplay").text(),
				//那条topic
				'reply.topic.id' :  $("#topicid_undisplay").text(),
			},
			dataType : "json",//设置需要返回的数据类型
			success : function(data) {
				cont.html("");
				var d = eval("(" + data + ")");
				if (d.code==1){
					alert("请先登录");
				}else if (d.code==2){
					alert("回复成功");
				}
				

			},
			error : function() {
				alert("系统异常，请稍后重试！");
			}//这里不要加","
		});
		
		});
	});
	
	*/
		$(document).ready(function() {
		$(".reply_btn").click(function(){
			//alert($(this).siblings(".reply_input").html());
			var cont=$(this).siblings(".reply_input");
			if(cont.html()==""){
				//alert("sdfsd")
				return;//空回复内容直接无视
			}
			$.ajax({
			type : "post",
			url : "ajax/putcomment",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
			data : {//设置数据源
				//回复的内容
				'commentContent' : $(this).siblings(".reply_input").html(),
				//那条topic
				'topicid' :  $("#topicid_undisplay").text(),
				
				'commentid': $(this).siblings("#commentid_undisplay").text(),
			},
			dataType : "json",//设置需要返回的数据类型
			success : function(data) {
				cont.html("");
				var d = eval("(" + data + ")");
				if(d.code==1){//没有登录
							$(".loginwindows").show();
				}else if(d.code==3){//成功

					window.location.href="login/detailtopic.action?topicid="+$("#topicid").val();
				}
				

			},
			error : function() {
				alert("系统异常，请稍后重试！");
			}//这里不要加","
		});
		
		});
	});
	
	</script>
	<script type="text/javascript">
	//提交评论的ajax，并且把<img>标签转换成数据库能存的字符
	$(document).ready(
		function() {
			$(document).on(
					"click",
					".addcomment_btn",

					function() {
						//alert($(this).parent().children("#topicid_undisplay").text());
						if (!um.hasContents()){
							return
						}
						var comment=um.getPlainTxt();
						//alert(comment);
						comment=comment.replace(/<img[^>]*\/([^>]*\/[^>]*)\.gif">/g,"[#$1]");
						
						//return
						$.ajax({
							type : "post",
							url : "ajax/putcomment",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
							data : {//设置数据源
								topicid : $("#topicid").val(),
								//userid : $("#userid_navbar").text(),
								commentContent : comment
							//,号
							},
							dataType : "json",//设置需要返回的数据类型
							success : function(data) {
								var d = eval("(" + data + ")");//将数据转换成json类型，可以把data用alert()输出出来看看到底是什么样的结构
								//得到的d是一个形如{"key":"value","key1":"value1"}的数据类型，然后取值出来
								//alert(d.code);
								if(d.code==1){//没有登录
									$(".loginwindows").show();
								}else if(d.code==3){//成功
									  window.location.reload();
									// window.location.href="login/detailtopic.action?topicid="+$("#topicid").val();
								}
								//$("#s_name").text("" + d.name + "");

							},
							error : function() {
								alert("系统异常，请稍后重试！提交评论");
							}//这里不要加","
						});

					});
		});
	</script>
	<script type="text/javascript">
	//点击灰色的登录框消失
	//$(document).ready(function(){
	//	$(".loginwindows").click(function(){
			$(this).hide();
		//});
	//});
	//点击子窗口无视
	$(document).ready(function(){
		$("#closelogin").click(function(){
			$(".loginwindows").hide();
		});
	});
	//表情转换成<img 标签
		$(document).ready(function(){
			var content=$(".regx_emotion");
			for(var i=0;i<content.length;i++){
				
				var c=content[i].innerHTML;
				//alert(c);
				
				c=c.replace(/\[#([^\]]*)\]/g,'<img src="umeditor/dialogs/emotion/images/$1.gif">');
				//alert(c)
				content[i].innerHTML="";
				content[i].innerHTML=c;
			}
		});
		$(document).ready(function(){
			var content=$(".recommend");
			for(var i=0;i<content.length;i++){
				
				var c=content[i].innerHTML;
				//alert(c);
				
				c=c.replace(/\[#([^\]]*)\]/g,'<img src="umeditor/dialogs/emotion/images/$1.gif">');
				//alert(c)
				content[i].innerHTML="";
				content[i].innerHTML=c;
			}
		});
	</script>
	<script type="text/javascript">
		//把帖子的内容，视频和图片用别的标签来显示
		$(document).ready(function(){
			var imgcontain=$(".images");
			var img=imgcontain.text();
			imgcontain.text("");
			//alert(img)
			var images = new Array();
				//images也包含视频
			images = img.split("|");
			for(var j=0;j<images.length-1;j++){
				var filetype = images[j].match(/\.(.*)/)[1];
				filetype=filetype.toLowerCase();
				//alert(filetype);
				//图片支持png gif jpg
				if (filetype == "png" || filetype == "gif"|| filetype == "jpg") {
						imgcontain.append('<img alt="" src="/upload/${user.userId}/'+images[j]+'">');
				}else if(filetype=="mp4" ||filetype=="avi" ||filetype=="3gp"||filetype=="rmvb"){
					//onclick()原因不想触发父控件的事件
					imgcontain.append('<center><video src="/upload/${user.userId}/'+images[j]+'" controls="controls">您的浏览器不支持 video 标签。</video></center><br>');
				}else{
					imgcontain.append('<p>有非图片或者视频的内容!</p>');
				}
			}
		});
	</script>


	<script type="text/javascript">
	  //关注
	$(document).ready(
			function() {
				$("#followtopic").click(
						function() {
							//alert("关注");
							$.ajax({
								type : "post",
								url : "ajax/follow",//需要用来处理ajax请求的action,excuteAjax为处理的方法名，JsonAction为action名
								data : {//设置数据源
									topicid : $("#topicid_undisplay").text()
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
	
	</script>
</body>
</html>
