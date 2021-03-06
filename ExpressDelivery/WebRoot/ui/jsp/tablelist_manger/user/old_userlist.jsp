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

				<li class="start "><a href="javascript:;"> <i
						class="fa fa-user"></i> <span class="title">表单列表</span> <span
						class="arrow "></span> <span class="selected"></span>
						<ul class="sub-menu">
							<%
								User user = (User) session.getAttribute("user");
								if (user.getUserType().equals("商家")) {
							%>

							<li class="start active"><a
								href="user/UserList?pageSize=10&pageNo=1&userType=${user.userType }&expressType=${user.expressType}">
									用户 </a></li>
							<%
								}
							%>
							<li class="start "><a
								href="order/OrderList?pageSize=10&pageNo=1"> 订单 </a></li>
							<li class="start"><a
								href="goods/goodsList?pageSize=10&pageNo=1"> 货物 </a></li>
							<li class="start"><a
								href="businessActivities/BusinessActivitiesList?pageSize=10&pageNo=1">
									商家活动 </a></li>
						</ul>
				</a></li>
			</ul>
		</div>
		<div class="page-content">
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box green">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-globe"></i>用户列表
							</div>
						</div>
						<div class="portlet-body">
							<%
								Map<String, Object> map = (Map) request.getAttribute("result");
								List<User> users = (List<User>) map.get("users");
								int pageNo = (Integer) map.get("pageNo");
								int pageSize = (Integer) map.get("pageSize");
								int count = (Integer) map.get("count");
								int pageCount = (count - 1) / pageSize + 1;
							%>
							<form action="user/UserList" method="post">
								<input type="text" class="input-medium search-query"
									name="keyword"
									value="<%=map.get("keyword") == null ? "" : map.get("keyword")%>">
								<input type="hidden" name="pageSize" value="<%=pageSize%>">
								<input type="hidden" name="pageNo" value="<%=pageNo%>">
								<input type="hidden" name="userType"
									value="<%=map.get("userType")%>">
								<input type="hidden" name="expressType"
									value="<%=map.get("expressType")%>">
								<button type="submit" class="btn">搜索</button>
							</form>						
							<table
								class="table table-striped table-bordered table-hover table-full-width"
								id="sample_2">
								<thead>
									<tr>
										<th>用户名</th>
										<th>昵称</th>
										<th class="hidden-xs">联系电话</th>
										<th class="hidden-xs">地址</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="user" items="${ result.users}">
										<tr>
											<td>${user.userName }</td>
											<td>${user.nickName }</td>
											<td>${user.telephone }</td>
											<td>${user.address }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<div class="pager row">
								<div class="col-md-8">
									<ul>
										<li><a
											href="user/UserList?pageSize=<%=pageSize%>&pageNo=1&userType=<%=map.get("userType")%>&expressType=<%=map.get("expressType")%>"
											<%=pageNo == 1 ? "onclick=\"return false;\"" : ""%>>首页</a></li>
										<li><a
											href="user/UserList?pageSize=<%=pageSize%>&pageNo=<%=pageNo - 1%>&userType=<%=map.get("userType")%>&expressType=<%=map.get("expressType")%>"
											<%=pageNo == 1 ? "onclick=\"return false;\"" : ""%>>上一页</a></li>
										<%
											for (int i = 1; i <= pageCount; i++) {
										%>
										<li><a
											href="user/UserList?pageSize=<%=pageSize%>&pageNo=<%=i%>&userType=<%=map.get("userType")%>&expressType=<%=map.get("expressType")%>"
											<%=pageNo == i ? "onclick=\"return false;\"" : ""%>><%=i%></a></li>
										<%
											}
										%>

										<li><a
											href="user/UserList?pageSize=<%=pageSize%>&pageNo=<%=pageNo + 1%>&userType=<%=map.get("userType")%>&expressType=<%=map.get("expressType")%>"
											<%=pageNo == pageCount ? "onclick=\"return false;\"" : ""%>>下一页</a></li>
										<li><a
											href="user/UserList?pageSize=<%=pageSize%>&pageNo=<%=pageCount%>&userType=<%=map.get("userType")%>&expressType=<%=map.get("expressType")%>"
											<%=pageNo == pageCount ? "onclick=\"return false;\"" : ""%>>尾页</a></li>
									</ul>
								</div>
								<div class="col-md-4">
									<span>当前第<%=pageNo%>页，共<%=pageCount%>页，共<%=count%>条数据
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/ui/jsp/main/foot.jsp" />
</body>
</html>