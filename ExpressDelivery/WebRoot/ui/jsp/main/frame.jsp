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
	<jsp:include page="/ui/jsp/main/head.jsp" />
	<div class="page-container">
		<div class="page-sidebar navbar-collapse collapse">
			<ul class="page-sidebar-menu">
				<li>
					<div class="sidebar-toggler hidden-phone"></div>
				</li>

				<li class="start active"><a href="javascript:;"> <i
						class="fa fa-user"></i> <span class="title">表单列表</span> <span
						class="arrow "></span> <span class="selected"></span> <%
 	User user = (User) session.getAttribute("user");
 	if (user.getUserType().equals("商家")) {
 %>
						<ul class="sub-menu">
							<li class="start active"><a
								href="user/UserList?pageSize=10&pageNo=1&userType=${user.userType }&expressType=${user.expressType}">
									用户 </a></li>
							<%
								}
							%>
							<li class="start"><a
								href="order/OrderList?pageSize=10&pageNo=1"> 订单 </a></li>
							<li class="start"><a
								href="goods/goodsList?pageSize=10&pageNo=1"> 货物 </a></li>
								<li class="start"><a
								href="businessActivities/BusinessActivitiesList?pageSize=10&pageNo=1"> 商家活动 </a></li>
						</ul>
			</ul>
			</a>
			</li>
			</ul>
		</div>
		<div class="page-content"></div>
	</div>
	<jsp:include page="/ui/jsp/main/foot.jsp" />
</body>
</html>
