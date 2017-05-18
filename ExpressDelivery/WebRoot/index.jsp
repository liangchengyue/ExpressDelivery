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
<title>登录</title>
<base href="<%=basePath%>">
<jsp:include page="ui/jsp/commont/head-script.jsp" />
<link href="ui/assets/css/pages/login.css" rel="stylesheet"
	type="text/css" />

</head>
<body class="login">
	<div class="logo">
		<img src="ui/assets/img/logo-big.png" alt="" />
	</div>
	<div class="content">
		<form class="login-form" action="user/login" method="post">
			<h3 class="form-title">登录</h3>
			<div class="alert alert-danger display-hide">
				<button class="close" data-close="alert"></button>
				<span>请输入用户名或密码</span>
			</div>
			<div class="form-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">用户名</label>
				<div class="input-icon">
					<i class="fa fa-user"></i>
					<input class="form-control placeholder-no-fix required" type="text"
						autocomplete="off" placeholder="用户名" name="userName" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">密码</label>
				<div class="input-icon">
					<i class="fa fa-lock"></i>
					<input class="form-control placeholder-no-fix" type="password"
						autocomplete="off" placeholder="密码" name="password" />
				</div>
			</div>
			<div class="form-group">
				<div class="radio-inline row">
					<label> <input class="col-md-6" type="radio"
							name="userType" id="optionsRadios1" value="商家" checked>商家
					</label> <label> <input class="col-md-6" type="radio"
							name="userType" id="optionsRadios2" value="管理员"> 管理员
					</label>
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">快递站类别</label>
				<div class="col-md-8">
					<select id="form_2_select2" class="form-control select2me"
						name="expressType">
						<option value="其他">请选择</option>
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
			<div class="form-actions">
				<button type="submit" class="btn green pull-right">
					登录<i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
			<div class="forget-password">
				<h4>忘记密码 ?</h4>
				<p>
					点击 <a href="javascript:;" onclick="queryAllUserTelephone()">这里</a>
					重置密码.
					<!-- id="forget-password" -->
				</p>
			</div>
			<div class="create-account">
				<p>
					还没注册?&nbsp; <a href="javascript:;" id="register-btn"
						onclick="queryAllUser()">注册账号</a>
				</p>
			</div>

		</form>

		<form class="register-form" action="user/regster" method="post">
			<h3 class="center-block">注册</h3>

			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">用户名</label>
				<div class="input-icon" style="height:34px;">
					<i class="fa fa-user"></i>
					<input class="form-control placeholder-no-fix required" type="text"
						autocomplete="off" placeholder="用户名" name="userName"
						id="userNameinput" />
					<br>
				</div>

			</div>
			<span class="userNameIsEmptyPrompt"></span>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">密码</label>
				<div class="input-icon">
					<i class="fa fa-lock"></i>
					<input class="form-control placeholder-no-fix" type="password"
						autocomplete="off" id="register_password" placeholder="密码"
						name="password" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">确认密码</label>
				<div class="controls">
					<div class="input-icon">
						<i class="fa fa-check"></i>
						<input class="form-control placeholder-no-fix" type="password"
							autocomplete="off" placeholder="确认密码" name="rpassword" />
					</div>
				</div>
			</div>

			<div class="form-group">
				<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
				<label class="control-label visible-ie8 visible-ie9">联系电话</label>
				<div class="input-icon">

					<i class="fa fa-check-circle"></i>

					<input class="form-control placeholder-no-fix required" type="text"
						placeholder="联系电话" name="telephone" id="userTelephoneinput" />
					<span class="userTelephoneIsEmptyPrompt"></span>
				</div>
			</div>
			<div class="input-icon col-md-7">
				<i class="fa fa-check-square"></i>
				<input class="form-control placeholder-no-fix" type="text"
					autocomplete="off" placeholder="验证码" name="erificationCode"
					id="useVerificationCodeinput" />
				<span class="useVerificationCodeIsCorrectPrompt"></span>
			</div>
			<button type="submit" class="btn green pull-right"
				onclick="getvalicode()" id="getvalicodeBtn">
				获取验证码<i class="m-icon-swapright m-icon-white"></i>
			</button>
			<div class="form-group row">
				<label class="col-md-4 control-label">性别</label>
				<div class="col-md-8 row">
					<label> <input class="col-md-6" type="radio" name="gender"
							id="optionsRadios1" value="男" checked>男
					</label> <label> <input class="col-md-6" type="radio" name="gender"
							id="optionsRadios2" value="女"> 女
					</label>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-md-4 control-label">用户类型</label>
				<div class="col-md-8 row">
					<label> <input class="col-md-6" type="radio"
							name="userType" id="optionsRadios1" value="管理员" checked>管理员
					</label> <label> <input class="col-md-6" type="radio"
							name="userType" id="optionsRadios2" value="商家"> 商家
					</label>
				</div>
			</div>
			<div class="form-group row">
				<label class="control-label col-md-4">快递站类别</label>
				<div class="col-md-8">
					<select id="form_2_select2" class="form-control select2me"
						name="expressType">
						<option value="">请选择</option>
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
			<div class="form-actions">
				<button id="register-back-btn" type="button" class="btn">
					<i class="m-icon-swapleft"></i>返回
				</button>
				<button type="submit" id="register-submit-btn"
					class="btn green pull-right">
					注册 <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
		</form>
	</div>
	<div class="copyright">2017 &copy;老司机</div>
	<jsp:include page="ui/jsp/commont/foot-script.jsp" />
	<script src="ui/assets/scripts/login.js" type="text/javascript"></script>
	<!-- END PAGE LEVEL SCRIPTS -->
	<script>
		jQuery(document).ready(function() {
			App.init();
			Login.init();
		});
		//定义一个全局变量存放获取验证码是后台返回来的验证码
		var returnedValicode = "";
		/* 登录页点击注册时，查询数据库的所有用户名 
		        使用ajax异步加载 调用controllor里面的方法
		 */
		function queryAllUser() {
			$.ajax({
				url : "user/preRegister"
			})
		}
		/* 注册时点击获得验证码，调用ajax发送验证码，并返回验证码 */
		function getvalicode() {
			//取得注册时用户输入的手机号码
			var phone = $("#userTelephoneinput").val();
			//短信过期时间 （小时）
			var time = 5;
			$.ajax({
				url : "user/getIndustrySMS",
				type : "post",
				data : {
					"phone" : phone,
					"time" : time
				},
				success : function(data) {
					//把返回來验证码复制给全局变量，用来判断用户输入的验证码是否正确
					returnedValicode = data;
					

				}
			});
		}
		/* 登录页点击找回密码时，查询数据库的所有用户电话号码  
		使用ajax异步加载 调用controllor里面的方法
		 */
		function queryAllUserTelephone() {
			$
					.ajax({
						url : "user/preSeekPassword",
						success : function(data) {
							window.location.href = "ui/jsp/tablelist_manger/user/usergetvalicode.jsp";
						}
					});
		}

		$(function() {
			$(".useVerificationCodeIsCorrectPrompt").html(
			"");
			//绑定注册时验证码输入框的input和chang事件
			$("#useVerificationCodeinput").bind(
					"change input",
					function() {
						//清空验证码输入提示
						$(".useVerificationCodeIsCorrectPrompt").html(
						"");
						//取得输入的验证码
						var getuseVerificationCodeinput = $(
								"#useVerificationCodeinput").val();
						
						if (getuseVerificationCodeinput == returnedValicode) {
							$(".useVerificationCodeIsCorrectPrompt").html(
									"验证码输入正确√");
							//注册时输入验证码正确，则注册按钮点亮
							$("#register-submit-btn").attr("disabled", false);
						}
						else {
							$(".useVerificationCodeIsCorrectPrompt").html(
									"验证码输入错误");
							//注册时输入验证码错误，则注册按钮不能点亮
							$("#register-submit-btn").attr("disabled", true);
						}
					});
			//获取验证码按钮的可点击状态
			var flag_getvalicodeBtn = false;
			//注册时输入号码为空或错误，获取验证码不能点亮 
			$("#getvalicodeBtn").attr("disabled", true);
			//注册时输入号码为空或错误，获取验证码不能点亮，则注册按钮不能点亮
			$("#register-submit-btn").attr("disabled", true);
			//电话号码输入错误提示清空
			$("#userTelephoneinput")
					.bind(
							"change input",
							function() {
								var userTelephoneinput = $(
										"#userTelephoneinput").val();

								var regex = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
								if (userTelephoneinput != "") {

									if (regex.test(userTelephoneinput)) {
										//注册时输入号码符合规范，获取验证码能点亮 
										$("#getvalicodeBtn").attr("disabled",
												false);
										
										$(".userTelephoneIsEmptyPrompt").html(
												"√");
									} else {
										$(".userTelephoneIsEmptyPrompt").html(
												"电话号码不符合规范");
									}
								} else {
									$(".userTelephoneIsEmptyPrompt").html(
											"手机号不能为空");
								}
							});

			/*判断用户输入的名字是否已存在  */
			$(".userTelephoneIsRegisterPrompt").html("");
			$("#userNameinput").bind("change input", function() {
				var userName = $("#userNameinput").val();
				$.ajax({
					url : "user/userNameIsExist",
					type : "post",
					data : {
						"userName" : userName
					},
					success : function(data) {
						if (data == "true") {

							$(".userNameIsEmptyPrompt").html("用户名已经存在！");
						} else {
							$(".userNameIsEmptyPrompt").html("");
						}
					}
				});
			});
		});
	</script>
</body>
</html>
