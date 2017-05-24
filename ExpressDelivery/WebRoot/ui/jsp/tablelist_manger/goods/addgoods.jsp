<%@page import="org.express.deliver.pojo.User"%>
<%@page import="org.express.deliver.pojo.BusinessActivities"%>
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

<title>添加商家活动</title>
<jsp:include page="/ui/jsp/commont/head-script.jsp" />

</head>

<body class="page-header-fixed page-full-width">
	<div class="header navbar navbar-inverse navbar-fixed-top">
		<a class="navbar-brand" href="ui/jsp/main/frame.jsp"> <img
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
					<li><a href="ui/jsp/main/frame.jsp"> <i class="fa fa-user"></i>
							返回首页
					</a></li>
					<li><a href="user/exitLogin"> <i class="fa fa-key"></i>
							退出登录
					</a></li>
				</ul></li>
		</ul>
	</div>
	<div class="page-container">
		<div class="page-content">
			<div class="row profile">
				<div class="col-md-12">
					<div class="tabbable tabbable-custom tabbable-full-width">
						<ul class="nav nav-tabs">
							<li><a href="ui/jsp/main/frame.jsp">返回首页</a></li>
						</ul>
						<div class="tab-content">

							<!-- ----------------------------------  添加    --------------------------------- -->

							<div class="portlet box red ">
								<div class="portlet-title">
									<div class="caption">
										<i class="fa fa-edit"></i>添加快递信息
									</div>
								</div>
								<div class="portlet-body form" align="center">
									<form class="form-horizontal" role="form" action="goods/addGoods"
										method="post">
										<div class="form-body" style="width: 60%;">
											<div class="form-group">
												<label class="col-md-5 control-label">寄件人姓名:</label>
												<div class="col-md-6">
													<input type="text" class="form-control" placeholder="寄件人姓名"
														name="senderName">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-5 control-label">寄件人联系电话:</label>
												<div class="col-md-6">
													<input type="text" class="form-control"
														placeholder="寄件人联系电话" name="senderPhoneNumber">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-5 control-label">寄件人地址:</label>
												<div class="col-md-6">
													<input type="text" class="form-control" placeholder="寄件人地址"
														name="senderAddress">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-5 control-label">寄件日期:</label>
												<div class="col-md-6">
													<input type="date" class="form-control"
														placeholder="寄件日期" name="leaveTimeDate"
														>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-5 control-label">收件人姓名:</label>
												<div class="col-md-6">
													<input type="text" class="form-control" placeholder="收件人姓名"
														name="addresseeName">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-5 control-label">收件人联系电话:</label>
												<div class="col-md-6">
													<input type="text" class="form-control"
														placeholder="收件人联系电话" name="addresseePhoneNumber">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-5 control-label">收件人地址:</label>
												<div class="col-md-6">
													<input type="text" class="form-control" placeholder="收件人地址"
														name="addresseeAddress">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-5 control-label">签收日期:</label>
												<div class="col-md-6">
													<input type="date" class="form-control"
														placeholder="签收日期" name="arrivalTimeDate"
														>
												</div>
											</div>
											<div class="form-group row " >
												<label class="control-label col-md-5">快递站类别：</label>
												<div class="col-md-6">
													<select id="form_2_select2" class="form-control select2me"
														name="expressName">
														<option value="无">请选择</option>
														<option value="申通快递">申通快递</option>
														<option value="圆通快递">圆通快递</option>
														<option value="中通快递">中通快递</option>
														<option value="韵达快递">韵达快递</option>
														<option value="天天快递">天天快递</option>
														<option value="百世汇通">百世汇通</option>
														<option value="邮政">邮政</option>
														<option value="天猫商城">天猫商城</option>
													</select>
												</div>
											</div>
											<div class="form-group row " >
												<label class="control-label col-md-5">快递状态：</label>
												<div class="col-md-6">
													<select id="form_2_select2" class="form-control select2me"
														name="state">
														<option value="无">请选择</option>
														<option value="派送中">派送中</option>
														<option value="已签收">已签收</option>														
													</select>
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-5 control-label">快递单号:</label>
												<div class="col-md-6">
													<input type="text" class="form-control" placeholder="快递单号"
														name="orderNumber">
												</div>
											</div>
										</div>

										<div class="form-actions fluid">
											<div>
												<button type="submit" class="btn red">添加</button>
												<button type="reset" class="btn red default"
													style="margin-left: 90px;">重置</button>
											</div>
										</div>
									</form>
								</div>
							</div>
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
			<span class="go-top"> <i class="fa fa-angle-up"></i>
			</span>
		</div>
	</div>

	<div class="clearfix"></div>
	<jsp:include page="/ui/jsp/commont/foot-script.jsp" />
	<script src="ui/assets/scripts/index.js" type="text/javascript"></script>
	<script src="ui/assets/scripts/tasks.js" type="text/javascript"></script>
	<script type="text/javascript">
		
	</script>
</body>
</html>
