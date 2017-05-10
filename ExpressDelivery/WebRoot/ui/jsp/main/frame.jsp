<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台管理</title>
    <jsp:include page="/ui/jsp/commont/head-script.jsp"/>
  </head>
  
  <body class="page-header-fixed">
  	<div class="header navbar navbar-inverse navbar-fixed-top">
        <a class="navbar-brand" href="index.html">
            <img src="ui/assets/img/logo.png" alt="logo" class="img-responsive" />
        </a>
        <ul class="nav navbar-nav pull-right">
            <li class="dropdown user">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                    <img alt="" src="ui/assets/img/avatar1_small.jpg" />
                    <span class="username">欢迎您：${user.userName}</span>
                    <i class="fa fa-angle-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="extra_profile.html"><i class="fa fa-user"></i> 我的资料</a></li>
                    <li><a href="inbox.html"><i class="fa fa-envelope"></i> 我的消息 <span class="badge badge-danger">3</span></a></li>
                    <li><a href="login.html"><i class="fa fa-key"></i> 退出登录</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="clearfix"></div>
    <div class="page-container">
        <div class="page-sidebar navbar-collapse collapse">
            <ul class="page-sidebar-menu">
                <li>
                    <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                    <div class="sidebar-toggler hidden-phone"></div>
                    <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                </li>
                <li>
                    <!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
                    <form class="sidebar-search" action="extra_search.html" method="POST">
                        <div class="form-container">
                            <div class="input-box">
                                <a href="javascript:;" class="remove"></a>
                                <input type="text" placeholder="Search..." />
                                <input type="button" class="submit" value=" " />
                            </div>
                        </div>
                    </form>
                    <!-- END RESPONSIVE QUICK SEARCH FORM -->
                </li>
            </ul>
        </div>
        <div class="page-content"></div>
    </div>
    <div class="footer">
        <div class="footer-inner">
            2017 &copy; Metronic by keenthemes.
        </div>
        <div class="footer-tools">
            <span class="go-top">
                <i class="fa fa-angle-up"></i>
            </span>
        </div>
    </div>
    <jsp:include page="/ui/jsp/commont/foot-script.jsp"/>
  </body>
</html>
