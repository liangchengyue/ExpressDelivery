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
		User useri = (User) session.getAttribute("user");
		if (useri == null) {
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
							<%
								if (useri.getUserType().equals("商家")) {
							%>

							<li class="start active"><a href="javascript:;"> <span
									class="title">商家</span> <span class="arrow "></span>
							</a>
								<ul class="sub-menu">
									<li class="start active"><a
										href="user/UserListBybussiness?pageNo=1&pageSize=10&userType=${user.userType} }&expressType=${user.expressType } ">
											我的快递员</a></li>
									<li><a href=""> 我的活动</a></li>
									<li><a href=""> <span class="title">我的快递</span>
											<span class="arrow "></span></a>
										<ul class="sub-menu">
											<li><a href="">已发出</a>
											<li><a href="">已寄送</a>
										</ul></li>

								</ul></li>
							<%
								}
							%>																
						</ul>
				</a></li>
			</ul>
		</div>
		<div class="page-content">
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box red">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-globe"></i>快递员列表
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
							<form action="user/UserListByAdmin" method="post">
								<input type="text" class="input-medium search-query"
									name="keyword"
									value="<%=map.get("keyword") == null ? "" : map.get("keyword")%>">
								<input type="hidden" name="pageSize" value="<%=pageSize%>">
								<input type="hidden" name="pageNo" value="<%=pageNo%>">
								<button type="submit" class="btn"
									style="width:60px;height:25px;margin-top: -2px;line-height: 10px;margin-left: -3px;">搜索</button>
							</form>
							<table
								class="table table-striped table-bordered table-hover table-full-width"
								id="sample_2" align="center">
								<thead>
									<tr>
										<th>用户名</th>
										<th>昵称</th>
										<th>用户类型</th>
										<th class="hidden-xs">联系电话</th>
										<th class="hidden-xs">地址</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="user" items="${ result.users}">
										<tr>
											<td>${user.userName }</td>
											<td>${user.nickName }</td>
											<td>${user.userType }</td>
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
											href="user/UserList?pageSize=<%=pageSize%>&pageNo=1"
											<%=pageNo == 1 ? "onclick=\"return false;\"" : ""%>>首页</a></li>
										<li><a
											href="user/UserList?pageSize=<%=pageSize%>&pageNo=<%=pageNo - 1%>"
											<%=pageNo == 1 ? "onclick=\"return false;\"" : ""%>>上一页</a></li>
										<%
											for (int i = 1; i <= pageCount; i++) {
										%>
										<li><a
											href="user/UserList?pageSize=<%=pageSize%>&pageNo=<%=i%>"
											<%=pageNo == i ? "onclick=\"return false;\"" : ""%>><%=i%></a></li>
										<%
											}
										%>

										<li><a
											href="user/UserList?pageSize=<%=pageSize%>&pageNo=<%=pageNo + 1%>"
											<%=pageNo == pageCount ? "onclick=\"return false;\"" : ""%>>下一页</a></li>
										<li><a
											href="user/UserList?pageSize=<%=pageSize%>&pageNo=<%=pageCount%>"
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