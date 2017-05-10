<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>登录</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- BEGIN GLOBAL MANDATORY STYLES -->          
	<link href="ui/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
	<link href="ui/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="ui/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
	<!-- END GLOBAL MANDATORY STYLES -->
	<!-- BEGIN PAGE LEVEL STYLES --> 
	<link rel="stylesheet" type="text/css" href="assets/plugins/select2/select2_metro.css" />
	<!-- END PAGE LEVEL SCRIPTS -->
	<!-- BEGIN THEME STYLES --> 
	<link href="ui/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
	<link href="ui/assets/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="ui/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
	<link href="ui/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
	<link href="ui/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
	<link href="ui/assets/css/pages/login.css" rel="stylesheet" type="text/css"/>
	<link href="ul/assets/css/custom.css" rel="stylesheet" type="text/css"/>
	<!-- END THEME STYLES -->
	<link rel="shortcut icon" href="favicon.ico" />
  
  <body class="login">
   <div class="logo">
        <img src="ui/assets/img/logo-big.png" alt="" />
    </div>
    <div class="content">

        <form class="login-form" action="user/login" method="post">
            <h3 class="form-title">登录</h3>
            <div class="alert alert-danger display-hide">
                <button class="close" data-close="alert"></button>
                <span>请输入用户名或密码</span>
                <span>请输入用户名或密码</span>
            </div>
            <div class="form-group">
                <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                <label class="control-label visible-ie8 visible-ie9">用户名</label>
                <div class="input-icon">
                    <i class="fa fa-user"></i>
                    <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="userName" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label visible-ie8 visible-ie9">密码</label>
                <div class="input-icon">
                    <i class="fa fa-lock"></i>
                    <input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password" />
                </div>
            </div>
            <div class="form-group">
                <div class="radio-inline row" >
                    <label>
                        <input class="col-md-3" type="radio" name="optionsRadios" id="optionsRadios1" value="普通用户" checked>普通用户
                    </label>
                    <label>
                        <input class="col-md-3" type="radio" name="optionsRadios" id="optionsRadios2" value="管理员"> 管理员
                    </label>
                </div>
            </div>
            <div class="form-actions">
                <label class="checkbox">
                    <input type="checkbox" name="remember" value="1" />记住我
                </label>
                <button type="submit" class="btn green pull-right">
                    登录<i class="m-icon-swapright m-icon-white"></i>
                </button>
            </div>
            <div class="forget-password">
                <h4>忘记密码 ?</h4>
                <p>
                    点击 <a href="javascript:;" id="forget-password">这里</a>
                   重置密码.
                </p>
            </div>
            <div class="create-account">
                <p>
                   还没注册?&nbsp;
                    <a href="javascript:;" id="register-btn">注册账号</a>
                </p>
            </div>
        </form>
    </div>
    <div class="copyright">
        2013 &copy; Metronic. Admin Dashboard Template.
    </div>
     <script src="ui/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script src="ui/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
    <script src="ui/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="ui/assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
    <script src="ui/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="ui/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="ui/assets/plugins/jquery.cookie.min.js" type="text/javascript"></script>
    <script src="ui/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="ui/assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="ui/assets/plugins/select2/select2.min.js"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="ui/assets/scripts/app.js" type="text/javascript"></script>
    <script src="ui/assets/scripts/login.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    <script>
		jQuery(document).ready(function() {
		  App.init();
		  Login.init();
		});
    </script>
    <!-- END JAVASCRIPTS -->
  </body>
</html>
