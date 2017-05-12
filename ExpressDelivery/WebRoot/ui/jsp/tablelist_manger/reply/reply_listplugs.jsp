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

<title>My JSP 'userlistplugs.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css"
	href="ui/jsp/tablelist_manger/css/GridManager.css">
<script type="text/javascript"
	src="ui/jsp/tablelist_manger/js/GridManager.js"></script>
<title>用户信息列表</title>
<style>
html,body {
	width: 100%;
	/*height: 100%;*/
	overflow-x: hidden;
	margin: 0px;
	padding: 0px;
}

.plugin-action {
	display: inline-block;
	color: steelblue;
	margin-right: 10px;
	cursor: pointer;
}

.plugin-action:hover {
	text-decoration: underline;
}

.search-area {
	padding: 10px 20px;
	border: 1px solid #ccc;
	background: #efefef;
}

.search-area .sa-ele {
	display: inline-block;
	margin-right: 20px;
	font-size: 12px;
}

.search-area .sa-ele .se-title {
	display: inline-block;
	margin-right: 10px;
}

.search-area .sa-ele .se-con {
	display: inline-block;
	width: 180px;
	height: 24px;
	border: 1px solid #ccc;
	padding: 0px 4px;
	line-height: 24px;
}

.search-area .sa-ele .search-action,.search-area .sa-ele .reset-action {
	display: inline-block;
	width: 80px;
	height: 26px;
	border: 1px solid #ccc;
	background: #e8e8e8;
	padding: 0px 4px;
	line-height: 26px;
	text-align: center;
	cursor: pointer;
	margin-right: 10px;
}

.search-area .sa-ele .search-action:hover,.search-area .sa-ele .reset-action:hover
	{
	opacity: 0.7;
}
</style>

</head>

<body>
	<div class="search-area">
		<div class="sa-ele">
			<label class="se-title">关键字:</label>
			<input class="se-con" name="keyword" />
		</div>
		<div class="sa-ele">
			<button class="search-action">搜索</button>
			<button class="reset-action">重置</button>
		</div>
	</div>
	<br />
	<table></table>
	<script type="text/javascript">
		var table = document.querySelector('table');
		var TGM = table
				.GM(
						{
							supportRemind : true,
							gridManagerName : 'test',
							isCombSorting : true,
							height : '400px',
							supportAjaxPage : true,
							supportSorting : true,
							disableCache : false,
							ajax_url : 'reply/replyList',
							ajax_type : 'POST',
							query : {
								pageNo : 1,
								pageSize : 30,
								pluginId : 1,
								keyword : ""
							}
							//		,textAlign: 'center'
							,
							pageSize : 30,
							columnData : [
									{
										key : 'content',
										remind : 'content',
										width : '100px',
										text : '回复内容',
										sorting : ''

									},
									{
										key : 'replyDate',
										remind : 'the replyDate',
										width : '100px',
										text : '回复时间',
										sorting : '',
										template : function(replyDate,
												rowObject) {
											return new Date(replyDate)
													.format('YYYY-MM-DD HH:mm:ss');
										}
									},
									{
										key : 'action',
										remind : 'the action',
										width : '100px',
										text : '操作',
										template : function(action, rowObject) {
											return '<span class="plugin-action edit-action" learnLink-id="'+rowObject.id+'">编辑</span>'
													+ '<span class="plugin-action del-action" learnLink-id="'+rowObject.id+'">删除</span>';
										}
									} ]
							// 分页前事件
							,
							pagingBefore : function(query) {
								console.log('pagingBefore', query);
							}
							// 分页后事件
							,
							pagingAfter : function(data) {
								console.log('pagingAfter', data);
							}
							// 排序前事件
							,
							sortingBefore : function(data) {
								console.log('sortBefore', data);
							}
							// 排序后事件
							,
							sortingAfter : function(data) {
								console.log('sortAfter', data);
							}
							// 宽度调整前事件
							,
							adjustBefore : function(event) {
								console.log('adjustBefore', event);
							}
							// 宽度调整后事件
							,
							adjustAfter : function(event) {
								console.log('adjustAfter', event);
							}
							// 拖拽前事件
							,
							dragBefore : function(event) {
								console.log('dragBefore', event);
							}
							// 拖拽后事件
							,
							dragAfter : function(event) {
								console.log('dragAfter', event);
							}
						}, function(query) {
							// 渲染完成后的回调函数
							console.log(query);
						});

		console.log('GirdManger version => ', TGM.version)
		// 日期格式化,不是插件的代码,只用于处理时间格式化
		Date.prototype.format = function(fmt) {
			var o = {
				"M+" : this.getMonth() + 1, //月份
				"D+" : this.getDate(), //日
				"d+" : this.getDate(), //日
				"H+" : this.getHours(), //小时
				"h+" : this.getHours(), //小时
				"m+" : this.getMinutes(), //分
				"s+" : this.getSeconds(), //秒
				"q+" : Math.floor((this.getMonth() + 3) / 3), //季度
				"S" : this.getMilliseconds()
			//毫秒
			};
			if (/([Y,y]+)/.test(fmt)) {
				fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "")
						.substr(4 - RegExp.$1.length));
			}
			for ( var k in o) {
				if (new RegExp("(" + k + ")").test(fmt)) {
					fmt = fmt.replace(RegExp.$1,
							(RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k])
									.substr(("" + o[k]).length)));
				}
			}
			return fmt;
		};

		// 绑定搜索事件
		document
				.querySelector('.search-action')
				.addEventListener(
						'click',
						function() {
							var _query = {
								pageNo : 1,
								pageSize : 30,
								keyword : document
										.querySelector('[name="keyword"]').value
							};
							table.GM('setQuery', _query).GM('refreshGrid',
									function() {
										console.log('搜索成功...');
									});
						});

		// 绑定重置
		document.querySelector('.reset-action').addEventListener('click',
				function() {
					document.querySelector('[name="keyword"]').value = '';
				});
	</script>

</body>
</html>
