<%@page import="org.express.deliver.pojo.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>后台管理</title>
<jsp:include page="/ui/jsp/commont/head-script.jsp" />
<script type="text/javascript">
	
</script>
</head>

<body class="page-header-fixed" style="background: red">
	<div class="header navbar navbar-inverse navbar-fixed-top" style="background-color: blue;">
		<a class="navbar-brand" href="index.html"> <img
			src="ui/assets/img/logo.png" alt="logo" class="img-responsive" />
		</a>
		<ul class="nav navbar-nav pull-right">
			<li class="dropdown user"><a href="#" class="dropdown-toggle"
				data-toggle="dropdown" data-hover="dropdown"
				data-close-others="true"> <img alt="" src="${user.imagePath }"
					width="30px" height="30px" /> <span class="username">欢迎您：${user.userName}</span>
					<i class="fa fa-angle-down"></i>
			</a>
				<ul class="dropdown-menu">
					<li><a href="ui/jsp/tablelist_manger/user/userinfo.jsp"><i
							class="fa fa-user"></i> 我的资料</a></li>
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
						<%
						User user=(User)session.getAttribute("user");
				if(user.getUserType().equals("商家")){
				%>
						<ul class="sub-menu">
							<li class="start active "><a> <i class="fa fa-home"></i>
									<span class="title "
									lang="user/UserList?pageSize=10&pageNo=1&userType=${user.userType }&expressType=${user.expressType}">用户列表</span>
									<b class="selected"></b>
							</a></li>
						</ul>
						<ul class="sub-menu">
							<li class="start active "><a> <i class="fa fa-home"></i>
									<span class="title "
									lang="ui/jsp/tablelist_manger/order/order_listplugs.jsp">订单</span>
									<b class="selected"></b>
							</a></li>
						</ul>
						<ul class="sub-menu">
							<li class="start active "><a> <i class="fa fa-home"></i>
									<span class="title "
									lang="ui/jsp/tablelist_manger/businessactivities/businessactivities_listplugs.jsp">商家活动</span>
									<b class="selected"></b>
							</a></li>
						</ul>
						<!-- <ul class="sub-menu">
							<li class="start active "><a> <i class="fa fa-home"></i>
									<span class="title "
									lang="ui/jsp/tablelist_manger/comment/comment_listplugs.jsp">评论</span>
									<b class="selected"></b>
							</a></li>
						</ul>
						<ul class="sub-menu">
							<li class="start active "><a> <i class="fa fa-home"></i>
									<span class="title "
									lang="ui/jsp/tablelist_manger/reply/reply_listplugs.jsp">回复</span>
									<b class="selected"></b>
							</a></li>
						</ul> -->
						<ul class="sub-menu">
							<li class="start active "><a> <i class="fa fa-home"></i>
									<span class="title "
									lang="ui/jsp/tablelist_manger/goods/goods_listplugs.jsp">货物</span>
									<b class="selected"></b>
							</a></li>


						</ul>
						<%
				}else if(user.getUserType().equals("管理员")){
					%>
					<ul class="sub-menu">
					<li class="start active "><a> <i class="fa fa-home"></i>
							<span class="title "
							lang="ui/jsp/tablelist_manger/order/order_listplugs.jsp">订单</span>
							<b class="selected"></b>
					</a></li>
				</ul>
				<ul class="sub-menu">
					<li class="start active "><a> <i class="fa fa-home"></i>
							<span class="title "
							lang="ui/jsp/tablelist_manger/businessactivities/businessactivities_listplugs.jsp">商家活动</span>
							<b class="selected"></b>
					</a></li>
				</ul>
				<!-- <ul class="sub-menu">
					<li class="start active "><a> <i class="fa fa-home"></i>
							<span class="title "
							lang="ui/jsp/tablelist_manger/comment/comment_listplugs.jsp">评论</span>
							<b class="selected"></b>
					</a></li>
				</ul>
				<ul class="sub-menu">
					<li class="start active "><a> <i class="fa fa-home"></i>
							<span class="title "
							lang="ui/jsp/tablelist_manger/reply/reply_listplugs.jsp">回复</span>
							<b class="selected"></b>
					</a></li>
				</ul> -->
				<ul class="sub-menu">
					<li class="start active "><a> <i class="fa fa-home"></i>
							<span class="title "
							lang="ui/jsp/tablelist_manger/goods/goods_listplugs.jsp">货物</span>
							<b class="selected"></b>
					</a></li>


				</ul>
					<%
					}
				%>
				</a></li>
			</ul>
		</div>
		<iframe class="page-content" name="iframe"></iframe>
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
		});
	</script>
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
						url : url,
						type:"get",
						success : function(data) {
							$(".page-content").html(data);
						}
					});
				}
			});
		});
	</script>

</body>
</html>
