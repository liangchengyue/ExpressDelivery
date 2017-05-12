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
			<ul class="page-sidebar-menu">
				<li>
					<div class="sidebar-toggler hidden-phone"></div>
				</li>
				<li class="start"><a> <i class="fa fa-home"></i> <span
						class="title ">表单管理</span> <b class=""></b>
						<ul class="sub-menu">
							<li class="start active "><a> <i class="fa fa-home"></i>
									<span class="title " lang="ui/jsp/tablelist_manger/user/userlistplugs.jsp">用户列表</span> <b class="selected"></b>
							</a></li>
						</ul>
				</a></li>
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
		$(function() {
			$(".page-sidebar-menu").find("li").click(function() {
				$(".page-sidebar-menu").find("li").attr("class", "start");
				$(".page-sidebar-menu").find("li").find("b").attr("class", "");
				$(this).attr("class", "start active");
				$(this).find("b").attr("class", "selected");
				$(this).find("b").attr("class", "selected");
				var url = $(this).find("span").attr("lang");
				if (url != undefined) {
					$.ajax({
		                url: url,
		                success: function (data) {
		                    $(".page-content").html(data);
		                }
		            });
		        }
			});
		});
	</script>

</body>
</html>
