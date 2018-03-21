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

<title>My JSP 'mypage_headimg.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="amazeui/css/font-awesome.4.6.0.css">
<link rel="stylesheet" href="amazeui/css/amazeui.min.css">
<link rel="stylesheet" href="amazeui/css/amazeui.cropper.css">
<link rel="stylesheet" href="amazeui/css/custom_up_img.css">
<style type="text/css">
.up-img-cover {
	width: 100px;
	height: 100px;
}

.up-img-cover img {
	width: 100%;
}

.up-img-txt label {
	font-weight: 100;
	margin-top: 50px;
}
</style>
</head>

<body>

	<div class="up-img-cover" id="up-img-touch">
		<img class="am-circle" alt="点击图片上传" src="/upload/${userid }/headimg.jpg" onerror="this.src='images/defaultimg.jpg'" data-am-popover="{content: &#39;点击上传&#39;, trigger: &#39;hover focus&#39;}">
	</div>

	<!--图片上传框隐-->
	<div class="am-modal am-modal-no-btn up-modal-frame" tabindex="-1"
		id="up-modal-frame">
		<div class="am-modal-dialog up-frame-parent up-frame-radius">
			<div class="am-modal-hd up-frame-header">
				<label>修改头像</label> <a href="javascript: void(0)"
					class="am-close am-close-spin" data-am-modal-close="">×</a>
			</div>
			<div class="am-modal-bd  up-frame-body">
				<div class="am-g am-fl">

					<div class="am-form-group am-form-file">
						<div class="am-fl">
							<button type="button" class="am-btn am-btn-default am-btn-sm">
								<i class="am-icon-cloud-upload"></i> 选择要上传的文件
							</button>
						</div>
						<input type="file" class="up-img-file">
					</div>
				</div>
				<div class="am-g am-fl">
					<div class="up-pre-before up-frame-radius">
						<img alt="" src="http://www.jq22.com/demo/ima_up201703161140/"
							class="up-img-show" id="up-img-show">
					</div>
					<div class="up-pre-after up-frame-radius"></div>
				</div>
				<div class="am-g am-fl">
					<div class="up-control-btns">
						<span class="am-icon-rotate-left" id="up-btn-left"></span> <span
							class="am-icon-rotate-right" id="up-btn-right"></span> <span
							class="am-icon-check up-btn-ok" url="ajax/editinfo"></span>
					</div>
				</div>

			</div>
		</div>
	</div>

	<!--加载框-->
	<div class="am-modal am-modal-loading am-modal-no-btn" tabindex="-1"
		id="up-modal-loading">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">正在上传...</div>
			<div class="am-modal-bd">
				<span class="am-icon-spinner am-icon-spin"></span>
			</div>
		</div>
	</div>

	<!--警告框-->
	<div class="am-modal am-modal-alert" tabindex="-1" id="up-modal-alert">
		<div class="am-modal-dialog">
			<div class="am-modal-hd">信息</div>
			<div class="am-modal-bd" id="alert_content">成功了</div>
			<div class="am-modal-footer">
				<span class="am-modal-btn">确定</span>
			</div>
		</div>
	</div>
	<script src="amazeui/js/jquery-1.10.2.js"></script>
	<script src="amazeui/js/jquery.min.js"></script>
	<script src="amazeui/js/amazeui.min.js" charset="utf-8"></script>
	<script src="amazeui/js/cropper.min.js" charset="utf-8"></script>
	<script src="amazeui/js/custom_up_img.js" charset="utf-8"></script>


	<div class="am-popover am-popover-bottom" id="am-popover-1c27l"
		style="display: none; top: 110px; left: 9px;">
		<div class="am-popover-inner">点击上传</div>
		<div class="am-popover-caret"></div>
	</div>
</body>
</html>
