<%@page import="org.express.deliver.pojo.User"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>后台管理</title>
<jsp:include page="/ui/jsp/commont/head-script.jsp" />
</head>

<body class="page-header-fixed">
	<%
		User user = (User) session.getAttribute("user");
		if (user == null) {
			response.setHeader("refresh", "0;" + basePath + "index.jsp");
		}
	%>
	<jsp:include page="/ui/jsp/main/head.jsp" />
	<div class="page-container">
		<div class="page-sidebar navbar-collapse collapse">
			<ul class="page-sidebar-menu">
				<li>
					<div class="sidebar-toggler hidden-phone"></div>
				</li>

				<li class="start active"><a href="javascript:;"> <i
						class="fa fa-user"></i> <span class="title">表单列表</span> <span
						class="arrow "></span> <span class="selected"></span>
						<ul class="sub-menu">
							<!-- <li class="start"><a
								href="user/UserList?pageSize=10&pageNo=1"><span
									class="title">用户 </span> </a></li> -->
							<%
								if (user.getUserType().equals("商家")) {
							%>
							<li class="start active"><a href="javascript:;"> <span
									class="title">商家</span> <span class="arrow "></span>
							</a>
								<ul class="sub-menu">
									<li><a
										href="user/UserListBybussiness?pageNo=1&pageSize=10&userType=${user.userType}&expressType=${user.expressType } ">
											我的快递员</a></li>
									<li><a href="javascript:;"> <span class="title">我的快递</span>
											<span class="arrow "></span></a>
										<ul class="sub-menu">
											<li><a href="">已发出</a>
											<li><a href="">已寄送</a>
										</ul></li>

								</ul></li>
							<%
								}
							%>
							<%
								if (user.getUserType().equals("快递员")) {
							%>
							<li class="start active"><a href="javascript:;"> <span
									class="title">快递员</span> <span class="arrow "></span>
							</a>
								<ul class="sub-menu">
									<li><a href=""> 我的快递</a></li>
									<li><a href=""> 发送短信</a></li>

								</ul></li>
							<%
								}
							%>
							<%
								if (user.getUserType().equals("管理员")) {
							%>
							<li class="start active"><a href="javascript:;"> <span
									class="title">管理员</span> <span class="arrow "></span>
							</a>
								<ul class="sub-menu">
									<li><a
										href="ui/jsp/tablelist_manger/businessactivities/addbusinessactivities.jsp">
											添加商品活动</a></li>
									<li><a href="businessActivities/BusinessActivitiesList?pageNo=1&pageSize=10">商品活动</</a></li>
									<li><a href="user/UserListByAdmin?pageNo=1&pageSize=10">
											用户列表</a></li>
								</ul></li>
							<%
								}
							%>
						</ul>
				</a></li>
			</ul>
		</div>
		<div class="page-content"></div>
	</div>
	<jsp:include page="/ui/jsp/main/foot.jsp" />
</body>
</html>
