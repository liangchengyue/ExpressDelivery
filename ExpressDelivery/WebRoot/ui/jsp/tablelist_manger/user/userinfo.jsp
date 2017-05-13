<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>详细信息</title>
   <jsp:include page="/ui/jsp/commont/head-script.jsp" />

  </head>
  
  <body class="page-header-fixed page-full-width">
    <div class="header navbar navbar-inverse navbar-fixed-top">
        <a class="navbar-brand" href="index.html">
            <img src="ui/assets/img/logo.png" alt="logo" class="img-responsive" />
        </a>
        <ul class="nav navbar-nav pull-right">
            <li class="dropdown user">
                <a href="#" class="dropdown-toggle"
                   data-toggle="dropdown" data-hover="dropdown"
                   data-close-others="true">
                    <img alt=""
                         src="ui/assets/img/avatar1_small.jpg" /> <span class="username">欢迎您：${user.userName}</span>
                    <i class="fa fa-angle-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="extra_profile.html">
                            <i class="fa fa-user"></i>
                            我的资料
                        </a>
                    </li>
                    <li>
                        <a href="ui/jsp/tablelist_manger/user/userinfo.jsp">
                            <i class="fa fa-envelope"></i>
                            我的消息 <span class="badge badge-danger">3</span>
                        </a>
                    </li>
                    <li>
                        <a href="user/exitLogin">
                            <i class="fa fa-key"></i>
                            退出登录
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
    <div class="page-container">
        <div class="page-content">
            <div class="row profile">
                <div class="col-md-12">
                    <div class="tabbable tabbable-custom tabbable-full-width">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab_1_1" data-toggle="tab">基本信息</a></li>
                            <li class=""><a href="#tab_1_2" data-toggle="tab">身份审核</a></li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tab_1_1">
                                <div class="portlet box green ">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="fa fa-reorder"></i>基本信息
                                        </div>
                                    </div>
                                    <div class="portlet-body form">
                                        <form class="form-horizontal" role="form">
                                            <div class="form-body">
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">昵称</label>
                                                    <div class="col-md-9">
                                                        <input type="text" class="form-control" placeholder="昵称">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">联系电话</label>
                                                    <div class="col-md-9">
                                                        <input type="text" class="form-control" placeholder="联系电话">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">联系地址</label>
                                                    <div class="col-md-9">
                                                        <input type="text" class="form-control" placeholder="联系地址">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">身份证号 </label>
                                                    <div class="col-md-9">
                                                        <input type="text" class="form-control" placeholder="身份证号">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="col-md-3 control-label">性别</label>
                                                    <div class="col-md-9">
                                                        <div class="radio-list">
                                                            <label class="radio-inline">
                                                                <input type="radio" name="optionsRadios" id="optionsRadios25" value="男" checked> 男
                                                            </label>
                                                            <label class="radio-inline">
                                                                <input type="radio" name="optionsRadios" id="optionsRadios26" value="女" checked> 女
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label for="exampleInputFile" class="col-md-3 control-label">上传头像</label>
                                                    <div class="col-md-9">
                                                        <input type="file" id="exampleInputFile">
                                                    </div>
                                            </div>
                                                </div>
                                            <div class="form-actions fluid">
                                                <div class="col-md-offset-3 col-md-9">
                                                    <button type="submit" class="btn green">Submit</button>
                                                    <button type="reset" class="btn default">Cancel</button>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab_1_2">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="footer-inner">2017 &copy; 老司机</div>
        <div class="footer-tools">
            <span class="go-top">
                <i class="fa fa-angle-up"></i>
            </span>
        </div>
    </div>

    <div class="clearfix"></div>
    <jsp:include page="/ui/jsp/commont/foot-script.jsp" />
    <script src="assets/scripts/index.js" type="text/javascript"></script>
    <script src="assets/scripts/tasks.js" type="text/javascript"></script>
  </body>
</html>
