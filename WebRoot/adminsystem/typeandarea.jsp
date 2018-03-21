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

<title>地区分类型统计</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%@taglib prefix="s" uri="/struts-tags"%>
<script type="text/javascript" src="js/jquery-1.9.1.min.js"></script>
<style type="text/css">
</style>
</head>

<body>
	<jsp:include page="frame.jsp"></jsp:include>
	<div id="rightcontent">
		<h2>地区类型，${area}(${type })</h2>
		<a href="admin/typeareastatistic?type=today&area=${area }">今天</a> <a
			href="admin/typeareastatistic?type=week&area=${area }">最近一周</a> <a
			href="admin/typeareastatistic?type=month&area=${area }">最近一月</a> <a
			href="admin/typeareastatistic?type=year&area=${area }">最近一年</a>

		<div style="font-size: 20px;">当前查询时间:${beginday }至${endday }-0时</div>
		<table
			class="table table-hover table-striped table-condensed table-bordered">
			<thead>
				<tr>
					<th>地区</th>
					<th>帖子数量</th>
					<th>类型</th>

				</tr>
			</thead>
			<tbody>
				<s:iterator value="l" id="t">

					<tr>
						<td>${t.location}</td>
						<td class="count">${t.count}</td>
						<td class="type">${t.type}</td>
					</tr>

				</s:iterator>
			</tbody>
		</table>

		<h2>饼状图</h2>
		<div id="container"
			style="width: 550px; height: 400px; margin: 0 auto;"></div>
		<script language="JavaScript">
			$(document).ready(function() {
				var count = $(".count");
				var sum = 0;
				for (var i = 0; i < count.length; i++) {
					sum += Number($(count[i]).text());
				}
				var type = $(".type");
				data = new Array();
				for (var i = 0; i < type.length; i++) {
					var tmp = new Array();
					tmp[0] = $(type[i]).text();
					tmp[1] = Number($(count[i]).text()) / sum;
					data[i] = tmp;
				}

			});
			$(document)
					.ready(
							function() {
								var chart = {
									plotBackgroundColor : null,
									plotBorderWidth : null,
									plotShadow : false
								};
								var title = {
									text : '${area }类型饼图'
								};
								var tooltip = {
									pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
								};
								var plotOptions = {
									pie : {
										allowPointSelect : true,
										cursor : 'pointer',
										dataLabels : {
											enabled : true,
											format : '<b>{point.name}%</b>: {point.percentage:.1f} %',
											style : {
												color : (Highcharts.theme && Highcharts.theme.contrastTextColor)
														|| 'black'
											}
										}
									}
								};

								var series = [ {
									type : 'pie',
									name : 'Browser share',
									data : data
								} ];

								var json = {};
								json.chart = chart;
								json.title = title;
								json.tooltip = tooltip;
								json.series = series;
								json.plotOptions = plotOptions;
								$('#container').highcharts(json);
							});
		</script>


	</div>
</body>
</html>
