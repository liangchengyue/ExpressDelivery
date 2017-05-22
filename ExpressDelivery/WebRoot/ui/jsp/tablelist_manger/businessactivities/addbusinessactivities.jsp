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

							<!-- ----------------------------------  添加商家活动    --------------------------------- -->

							<div class="portlet box red ">
								<div class="portlet-title">
									<div class="caption">
										<i class="fa fa-edit"></i>添加商家活动
									</div>
								</div>
								<div class="portlet-body form" align="center">
									<form class="form-horizontal" role="form"
										action="businessActivities/addBusinessActivities"
										method="post" enctype="multipart/form-data"
										onsubmit=" return submitBusinessActivities()">
										<div class="form-body" style="width: 60%;">
											<div class="form-group">
												<label class="col-md-5 control-label">商家名:</label>
												<div class="col-md-6">
													<input type="text" class="form-control" placeholder="商家名"
														name="businessName" id="input_businessName">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-5 control-label">联系电话:</label>
												<div class="col-md-6">
													<input type="text" class="form-control" placeholder="联系电话"
														name="telephone" id="input_telephone">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-5 control-label">联系地址:</label>
												<div class="col-md-6">
													<input type="text" class="form-control" placeholder="联系地址"
														name="businessAddress" id="input_businessAddress">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-5 control-label">活动开始时间:</label>
												<div class="col-md-6">
													<input type="date" class="form-control"
														placeholder="活动开始时间" name="activeStartDate"
														id="input_activeStartDate">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-5 control-label">活动结束时间:</label>
												<div class="col-md-6">
													<input type="date" class="form-control"
														placeholder="活动结束时间" name="activeEndDate"
														id="input_activeEndDate">
												</div>
											</div>
											<div class="form-group">
												<label class="col-md-5 control-label">活动内容:</label>
												<div class="col-md-6">
													<textarea placeholder="活动内容" name="activeContent"
														class="form-control" id="input_activeContent"></textarea>

												</div>
											</div>
											<div class="form-group">
												<label class="col-md-5 control-label">添加活动图片:</label>
												<div class="col-md-6">
													<input type="file" name="businessactivitiesimg"
														id="ChoiceBusinessActivitiesImg">
												</div>
											</div>

										</div>

										<div class="form-actions fluid">
											<div>
												<button type="submit" class="btn red">添加</button>
												<button type="reset" class="btn default"
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
		function submitBusinessActivities() {
			var ISinput_businessName = $("#input_businessName").val();
			var ISinput_businessAddress = $("#input_businessAddress").val();
			var ISinput_telephone = $("#input_telephone").val();
			var ISactiveStartDate = $("#input_activeStartDate").val();
			var ISactiveEndDate = $("#input_activeEndDate").val();
			var ISinput_activeContent = $("#input_input_activeContent").val();
			var ISChoiceBusinessActivitiesImg = $(
					"#ChoiceBusinessActivitiesImg").val();
			if (ISinput_businessName == "" || ISinput_businessAddress == ""
					|| ISinput_telephone == "" || ISactiveStartDate == ""
					|| ISactiveEndDate == "" || ISinput_activeContent == ""
					|| ISChoiceBusinessActivitiesImg == "") {
				alert("请填写完整信息再添加！");
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>
</html>
