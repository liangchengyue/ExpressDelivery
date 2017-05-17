<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<jsp:include page="/ui/jsp/commont/head-script.jsp" />
</head>

<body>
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
					<input type="text" class="input-medium search-query" n>
					<button type="submit" class="btn">搜索</button>
					<table
						class="table table-striped table-bordered table-hover table-full-width"
						id="sample_2">
						<thead>
							<tr>
								<th>用户名</th>
								<th>昵称</th>
								<th class="hidden-xs">联系电话</th>
								<th class="hidden-xs">地址</th>
								<th class="hidden-xs">操作</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach items="${result.list }" var="r">
							<tr>
								<td>${r.userName }</td>
								<td>${r.nickName }</td>
								<td>${r.telephone}</td>
								<td>${r.address }</td>
								<td>修改|删除</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="pager row">
						<div class="col-md-6">
						<ul>
						<li><a href="#">首页</a></li>
							<li><a href="#">上一页</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">4</a></li>
							<li><a href="#">下一页</a></li>
							<li><a href="#">尾页</a></li>
						</ul></div>
						<div class="col-md-2">转到第<input type="text" style="width:30px; ">页</div>
						<div class="col-md-4">
						<span>当前第1页，共10页，共${result.count }条数据</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="ui/assets/scripts/table-advanced.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init();
			TableAdvanced.init();
		});
	</script>
	<jsp:include page="/ui/jsp/commont/foot-script.jsp" />
</body>
</html>
