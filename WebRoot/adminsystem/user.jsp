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

<title>用户注册统计</title>

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
</head>

<body>
	<jsp:include page="frame.jsp"></jsp:include>
	<div id="rightcontent">
	<h2>注册用户统计</h2>
	<div> 注册总用户 ${totalregister }</div>
		<table
			class="table table-hover table-striped table-condensed table-bordered">
			<thead>
				<tr>
					<th>日期</th>
					<th>注册人数</th>

				</tr>
			</thead>
			<tbody>
				<s:iterator value="l" id="t">

					<tr>

						<td class="time">${t.month}</td>
						<td class="count">${t.count}</td>
					</tr>

				</s:iterator>
			</tbody>
		</table>


		<div id="container"
			style="width: 550px; height: 400px; margin: 0 auto"></div>
		<script language="JavaScript">
			$(document).ready(function(){
			    x= new Array();
			  
				var time=$(".time");
				var count=$(".count");
				data_d=new Array();
				for(var i=time.length-1,j=0;i>=0;i--,j++){
					x[j]=$(time[i]).text();
					data_d[j]=Number($(count[i]).text());
				}
				
			});
			$(document).ready(
					function() {
						var title = {
							text : '月份注册曲线图'
						};
						var subtitle = {
							text : 'Source: runoob.com'
						};
						var xAxis = {
							categories :x
						};
						var yAxis = {
							title : {
								text : '注册用户趋势图'
							}
						};
						var plotOptions = {
							line : {
								dataLabels : {
									enabled : true
								},
								enableMouseTracking : false
							}
						};
						var series =[
							{
								name:"注册人数",
								data:data_d
							}
						];
						
						var json = {};

						json.title = title;
						json.subtitle = subtitle;
						json.xAxis = xAxis;
						json.yAxis = yAxis;
						json.series = series;
						json.plotOptions = plotOptions;
						$('#container').highcharts(json);

					});
		</script>


	</div>
</body>
</html>
