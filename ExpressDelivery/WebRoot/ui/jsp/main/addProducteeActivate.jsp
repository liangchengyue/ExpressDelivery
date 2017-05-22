<%@page import="org.express.deliver.pojo.User"%>
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

<title>My JSP 'addProducteeActivate.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css"
	href="../ui/css/addProducterActivate.css">
</head>

<body>
	<%
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.setHeader("refresh", "0;" + basePath + "index.jsp");
		}
	%>
	<div class="main">
		<form action="" method="post">
			<h3>商家活动信息添加</h3>
			商家名：<span class="span1"><input type="text" class="input1" /></span><br>
			商家地址：<span class="span2"><input type="text" class="input1" /></span><br>
			活动开始时间：
			<input type="text" class="input1" />
			<br> 活动结束时间：
			<input type="text" class="input1" />
			<br> 活动内容：
			<textarea></textarea>
			<br>
			<input type="button" name="" value="添加" class="butn">
			<input type="reset" name="" value="重置" class="rest">
		</form>
	</div>
</body>
</html>
