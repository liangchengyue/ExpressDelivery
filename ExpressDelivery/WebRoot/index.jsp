<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>登录</title>
    <base href="<%=basePath%>">
    <jsp:include page="ui/jsp/commont/head-script.jsp"/>
	</head>
  
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
     <jsp:include page="ui/jsp/commont/foot-script.jsp"/>
  </body>
</html>
