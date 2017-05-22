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

<title>详细信息</title>
<jsp:include page="/ui/jsp/commont/head-script.jsp" />

</head>

<body class="page-header-fixed page-full-width">
	<%
		User useri = (User) session.getAttribute("user");
		if (useri == null) {
			response.setHeader("refresh", "0;" + basePath + "index.jsp");
		} else {
	%>
	<div class="header navbar navbar-inverse navbar-fixed-top">
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
							<li class="active"><a href="#tab_1_1" data-toggle="tab">基本信息</a></li>
							<li class=""><a href="#tab_1_2" data-toggle="tab">修改信息</a></li>
							<li class=""><a href="#tab_1_4" data-toggle="tab">修改头像</a></li>
							<li class=""><a href="#tab_1_3" data-toggle="tab">身份审核</a></li>
						</ul>
						<div class="tab-content">
							<!-- ----------------------------------  基本信息   --------------------------------- -->
							<div class="tab-pane active" id="tab_1_1">
								<div class="portlet box green ">
									<div class="portlet-title">
										<div class="caption">
											<i class="fa fa-reorder"></i>基本信息
										</div>
									</div>
									<div class="portlet-body form">
										<form class="form-horizontal" role="form" style="width: 50%;">
											<div class="form-body">
												<div class="form-group">
													<label class="col-md-6 control-label"
														style="text-align: right;">用户名:</label> <label
														class="col-md-3 control-label" style="text-align: left;">${user.userName}</label>
												</div>
												<div class="form-group">
													<label class="col-md-6 control-label"
														style="text-align: right;">昵称:</label> <label
														class="col-md-3 control-label" style="text-align: left;">${user.nickName}</label>
												</div>
												<div class="form-group">
													<label class="col-md-6 control-label"
														style="text-align: right;">性别:</label> <label
														class="col-md-3 control-label" style="text-align: left;">${user.gender}</label>
												</div>
												<div class="form-group">
													<label class="col-md-6 control-label"
														style="text-align:right;">用户类型:</label> <label
														class="col-md-3 control-label" style="text-align: left;">${user.userType}</label>
												</div>
												<div class="form-group">
													<label class="col-md-6 control-label"
														style="text-align: right;">联系电话:</label> <label
														class="col-md-3 control-label" style="text-align: left;">${user.telephone}</label>
												</div>
												<div class="form-group">
													<label class="col-md-6 control-label"
														style="text-align: right;">联系地址:</label> <label
														class="col-md-3 control-label" style="text-align: left;">${user.address}</label>
												</div>
												<div class="form-group">
													<label class="col-md-6 control-label"
														style="text-align: right;">身份证号: </label> <label
														class="col-md-3 control-label left"
														style="text-align: left;">${user.idCard}</label>
												</div>
											</div>

										</form>
										<div class="form-actions fluid"
											style="width:50%;height:398px;float:right;margin-top: -380px;background-color: white;">
											<div class="form-group">
												<label for="exampleInputFile" class="col-md-3 control-label"
													style="text-align: right;">头像:</label> <label
													for="exampleInputFile" class="col-md-3 control-label"
													style="text-align: left;"><img alt=""
													src="${user.imagePath }" width="240px;" height="240px;"></label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- ----------------------------------  修改信息    --------------------------------- -->
							<div class="tab-pane" id="tab_1_2">
								<div class="portlet box green ">
									<div class="portlet-title">
										<div class="caption">
											<i class="fa fa-edit"></i>修改资料
										</div>
									</div>
									<div class="portlet-body form">
										<form class="form-horizontal" role="form"
											action="user/updateUserInfo" method="post">
											<div class="form-body" style="width: 60%;">
												<div class="form-group">
													<label class="col-md-5 control-label">昵称:</label>
													<div class="col-md-6">
														<input type="text" class="form-control" placeholder="昵称"
															value="${user.nickName}" name="nickName">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-5 control-label">联系电话:</label>
													<div class="col-md-6">
														<input type="text" class="form-control" placeholder="联系电话"
															value="${user.telephone}" name="telephone">
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-5 control-label">联系地址:</label>
													<div class="col-md-6">
														<input type="text" class="form-control" placeholder="联系地址"
															value="${user.address}" name="address">
													</div>
												</div>
												<%
													String gender = ((User) session.getAttribute("user"))
																.getGender();
												%>
												<div class="form-group">
													<label class="col-md-5 control-label">性别:</label>
													<div class="col-md-6">
														<div class="radio-list" name="gender">
															<label class="radio-inline col-md-3"
																style="float:left;margin-left: 20px;"> <input
																	type="radio" name="gender" id="optionsRadios25"
																	value="男"
																	<%=gender != null && gender.equals("男")
						? "checked=\"checked\""
						: ""%>>
																男
															</label> <label class="radio-inline"> <input type="radio"
																	name="gender" id="optionsRadios26" value="女"
																	<%=gender != null && gender.equals("女")
						? "checked=\"checked\""
						: ""%>>
																女
															</label>
														</div>
													</div>
												</div>


											</div>
											<div class="form-actions fluid">
												<div class="col-md-offset-5 col-md-6">
													<button type="submit" class="btn green">提交修改</button>
													<button type="reset" class="btn default"
														style="margin-left: 30px;">重置</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<!-- ---------------------------------- 修改头像     --------------------------------- -->
							<div class="tab-pane" id="tab_1_4">
								<div class="portlet box green ">
									<div class="portlet-title">
										<div class="caption">
											<i class="fa fa-edit"></i>修改头像
										</div>
									</div>
									<form class="form-horizontal" role="form"
										action="user/updateUserImg" method="post"
										enctype="multipart/form-data" onsubmit="return ISChioceImg()">
										<div class="col-md-9">
											<label class="col-md-6 control-label"
												style="margin-top: 30px"><img alt=""
												src="${user.imagePath }" width="300px;" height="300px;"></label><br>
											<input class="col-md-3" type="file" name="userImg"
												id="input_ChioceImg">
										</div>
										<div class="col-md-offset-5 col-md-6">
											<button type="submit" class="btn green">提交修改</button>
											<button type="reset" class="btn default"
												style="margin-left: 30px;">重置</button>
										</div>
									</form>
								</div>


							</div>
							<!-- ---------------------------------- 身份认证     --------------------------------- -->

							<div class="tab-pane" id="tab_1_3">
								<div class="portlet box green ">
									<div class="portlet-title">
										<div class="caption">
											<i class="fa fa-edit"></i>实名认证
										</div>
									</div>
									<div class="portlet-body form" id="realNameValidata">
										<%
											User user = (User) session.getAttribute("user");
												if (user.getIdCard() == null) {
										%>
										<form class="form-horizontal" role="form"
											action="user/updateUserInfo" method="post"
											enctype="multipart/form-data" onsubmit="return false;">
											<div class="form-body">

												<div class="form-group" style="height: 50px;"></div>

												<div class="form-group">
													<label class="col-md-4 control-label">真实姓名:</label>
													<div class="col-md-4">
														<input type="text" class="form-control" placeholder="真实姓名"
															value="${user.trueName}" name="trueName" id="trueName">
													</div>
												</div>
												<span id="trueNameS"></span>
												<div class="form-group">
													<label class="col-md-4 control-label">身份证号:</label>
													<div class="col-md-4">
														<input type="text" class="form-control" placeholder="身份证号"
															value="${user.idCard}" name="idCard" id="idcard">
													</div>
												</div>
												<span id="idCardS"></span>
												<div class="form-actions fluid">
													<div class="col-md-offset-5 col-md-6">
														<button type="button" class="btn green"
															onclick="valiIDCard()">提交修改</button>
														<button type="reset" class="btn default"
															style="margin-left: 30px;">重置</button>
													</div>
												</div>
											</div>
										</form>
										<%
											} else {
										%>
										<h2>恭喜你通过实名认证</h2>
										<%
											}
										%>
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
		function valiIDCard() {
			var trueName = $("#trueName").val();
			var idCard = $("#idcard").val();
			var p = /^[1-9]{1}[0-9]{14}$|^[1-9]{1}[0-9]{16}([0-9]|[xX])$/;
			if (trueName == "") {
				$("#trueNameS").html("真实姓名不能为空！");
				return;
			}
			if (!p.test(idCard)) {
				$("#idCardS").html("身份证格式不正确！");
				return;
			}
			var data = {
				"trueName" : trueName,
				"idCard" : idCard
			};
			$.ajax({
				url : "user/IdCard",
				type : "post",
				data : data,
				success : function(data) {
					console.log(data);
					if (data) {
						$("#realNameValidata").html("<h2>恭喜你通过实名认证</h2>");
					} else {
						$("#idCardS").html("身份证信息错误");
					}
				}
			});
		}
		//判断修改头像时是否选择图片
		function ISChioceImg() {
			var ISChioceimg = $("#input_ChioceImg").val();
			if (ISChioceimg == "") {
				alert("请先选择图片！");
				return false;

			}
			return true;
		}
	</script>
	<%
		}
	%>

</body>
</html>
