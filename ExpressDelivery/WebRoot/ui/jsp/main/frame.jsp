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

<title>后台管理</title>
<jsp:include page="/ui/jsp/commont/head-script.jsp" />
<script type="text/javascript">
	
</script>
</head>

<body class="page-header-fixed">
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<a class="navbar-brand" href="index.html"> <img
			src="ui/assets/img/logo.png" alt="logo" class="img-responsive" />
		</a>
		<ul class="nav navbar-nav pull-right">
			<li class="dropdown user"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" data-hover="dropdown"
				data-close-others="true"> <img alt=""
					src="ui/assets/img/avatar1_small.jpg" /> <span class="username">欢迎您：${user.userName}</span>
					<i class="fa fa-angle-down"></i>
			</a>
				<ul class="dropdown-menu">
					<li><a href="extra_profile.html"><i class="fa fa-user"></i>
							我的资料</a></li>
					<li><a href="inbox.html"><i class="fa fa-envelope"></i>
							我的消息 <span class="badge badge-danger">3</span></a></li>
					<li><a href="user/exitLogin"><i class="fa fa-key"></i>
							退出登录</a></li>
				</ul></li>
		</ul>
	</div>
	<div class="clearfix"></div>
	<div class="page-container">
		<div class="page-sidebar navbar-collapse collapse">
			<ul class="page-sidebar-menu clic">
				<li>
					<div class="sidebar-toggler hidden-phone"></div>
				</li>
				<li class="start active ">
					<a> 
						<i class="fa fa-home"></i>
						 <span class="title">首页</span>
						  <span class="" lang="index.jsp"></span>
					</a>
				</li>
					<li class="start">
					<a> 
						<i class="fa fa-home"></i>
						 <span class="title">尾页</span>
						  <span class="" lang="index.jsp"></span>
					</a>
				</li>
			</ul>
		</div>
		<div class="page-content"></div>
	</div>
	<div class="footer">
		<div class="footer-inner">2017 &copy; 老司机</div>
		<div class="footer-tools">
			<span class="go-top"> <i class="fa fa-angle-up"></i>
			</span>
		</div>
	</div>
	<jsp:include page="/ui/jsp/commont/foot-script.jsp" />
	<script src="ui/assets/scripts/index.js" type="text/javascript"></script>
	<script src="ui/assets/scripts/tasks.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script>
		jQuery(document).ready(function() {
			App.init(); // initlayout and core plugins
			Index.init();
			Index.initJQVMAP(); // init index page's custom scripts
			Index.initCalendar(); // init index page's custom scripts
			Index.initCharts(); // init index page's custom scripts
			Index.initChat();
			Index.initMiniCharts();
			Index.initDashboardDaterange();
			Index.initIntro();
			Tasks.initDashboardWidget();
		});
		$(function() {
			$(".clic").click(function() {
				var a= $(this).find("span").html();
				console.log(a);
			});
		});
	</script>

</body>
</html>
