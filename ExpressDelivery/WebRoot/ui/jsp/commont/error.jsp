<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<base href="<%=basePath%>">

<title>登录失败提示</title>
<jsp:include page="/ui/jsp/commont/head-script.jsp" />
<link href="ui/assets/css/pages/error.css" rel="stylesheet"
	type="text/css" />
</head>

<!-- BEGIN BODY -->
<script type="text/javascript">
	var time = 5;

	function countDown() {
		document.getElementById("time_span").innerHTML = time;
		time--;
		if (time >= 0) {
			// 设置定时调用
			window.setTimeout("countDown();", 1000);
		}
	}
</script>
<body class="page-500-full-page" onload="countDown();">
	<div class="row">
		<div class="col-md-12 page-500">
			<div class=" number">${message}</div>
			<div class=" details">
				<h3>
					<span id="time_span">5</span>秒后
				</h3>
				<p>
					<%
					
						// 设置定时跳转
						response.setHeader("refresh", "5;" + basePath + request.getAttribute("url"));
					%>
					自动跳转到登录页！<br /> 如果没有跳转，请点<a href="${url}">这里</a>！<br /> <br />
				</p>
			</div>
		</div>
	</div>
	<jsp:include page="/ui/jsp/commont/foot-script.jsp"/>
	<script>
		jQuery(document).ready(function() {
			App.init();
		});
	</script>
	<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>

