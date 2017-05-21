<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
	<div class="header navbar navbar-inverse navbar-fixed-top"
		style="background-color: blue;">
		<a class="navbar-brand" href="index.jsp"> <img
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
					<li><a href="user/exitLogin"><i class="fa fa-key"></i>
							退出登录</a></li>
				</ul></li>
		</ul>
	</div>
	<div class="clearfix"></div>