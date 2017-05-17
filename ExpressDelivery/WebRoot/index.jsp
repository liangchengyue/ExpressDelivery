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
<<<<<<< HEAD
		</form>
		<!-- <form class="forget-form" action="index.html" method="post"> -->
		<div class="forget-form">
			<h3>忘记密码 ?</h3>
			<p>输入您的手机号码重置登录密码。</p>
			<div class="form-group row">
				<div class="input-icon col-md-7"
					style="padding: 0;margin-left: 15px">
					<i class="fa fa-phone-square"></i>
					<input class="form-control placeholder-no-fix" type="text"
						autocomplete="off" placeholder="手机号码" name="phoneNumber"
						id="useTelephoneinput" />
					<span class="userTelephoneIsRegisterPrompt"></span>
				</div>
				<div class="col-md-4" style="">
					<span
						style="display:block; cursor: pointer;padding-top: 8px;margin-left: 15px;"
						onclick="GetValidationCode()">获取验证码</span>
				</div>
			</div>
			<div class="form-group">
				<div class="input-icon">
					<i class="fa fa-check-square"></i>
					<input class="form-control placeholder-no-fix" type="text"
						autocomplete="off" placeholder="验证码" name="erificationCode"
						id="useVerificationCodeinput" />
					<span class="useVerificationCodeIsCorrectPrompt"></span>
				</div>
				<button type="submit" class="btn green pull-right"
					onclick="sumbitinputvalicode()">
					提交 <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
			<!-- <div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">密码</label>
				<div class="input-icon">
					<i class="fa fa-lock"></i>
					<input class="form-control placeholder-no-fix" type="password"
						  placeholder="密码"
						name="password" />
				</div>
			</div>
			<div class="form-group">
				<label class="control-label visible-ie8 visible-ie9">确认密码</label>
				<div class="controls">
					<div class="input-icon">
						<i class="fa fa-check"></i>
						<input class="form-control placeholder-no-fix" type="password"
							 placeholder="确认密码" name="rpassword" />
					</div>
				</div>
			</div> 


			<div class="form-actions">
				<button type="button" id="back-btn" class="btn">
					<i class="m-icon-swapleft"></i> 返回
				</button>
				<button type="submit" class="btn green pull-right">
					确定 <i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>-->
			<!-- </form> -->
=======
		</form>		
>>>>>>> branch 'master' of https://github.com/liangchengyue/ExpressDelivery.git
		</div>
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
						placeholder="联系电话" name="telephone" />
				</div>
			</div>
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
		function sumbitinputvalicode() {
			var useVerificationCodeinput = $("#useVerificationCodeinput").val();
			$.ajax({
				url : "user/useVerificationCodeIsCorrect",
				type : "post",
				data : {
					"userinputvaliCode" : useVerificationCodeinput
				},
				success : function(data) {
				}
			});
		}
		/* 登录页点击注册时，查询数据库的所有用户名 
		        使用ajax异步加载 调用controllor里面的方法
		 */
		function queryAllUser() {
			$.ajax({
				url : "user/preRegister"
			})
		}
		/* 登录页点击找回密码时，查询数据库的所有用户电话号码 
		使用ajax异步加载 调用controllor里面的方法
		 */
		function queryAllUserTelephone() {
			$.ajax({
				url : "user/preSeekPassword",
				success : function(data) {
					   window.location.href = "ui/jsp/tablelist_manger/user/usergetvalicode.jsp";
				}
			})
		}
		/*判断用户输入的名字是否已存在  */
		$(function() {
			//电话号码输入错误提示清空
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
		/*判断用户输入的电话号码是否存在  */
		function GetValidationCode() {
			//电话号码输入错误提示清空
			$(".userTelephoneIsRegisterPrompt").html("");
			//取得输入的电话号码
			var userTelephone = $("#useTelephoneinput").val();
			$.ajax({
				url : "user/userTelephoneIsExist",
				type : "post",
				data : {
					"userTelephone" : userTelephone
				},
				success : function(data) {
					if (data == "true") {
						$(".userTelephoneIsRegisterPrompt").html("");
						//短信过期时间 （小时）
						var time = 5;
						//电话号码输入正确以后，发送验证码到该电话号码
						$.ajax({
							url : "user/getIndustrySMS",
							type : "post",
							data : {
								"userTelephone" : userTelephone,
								"time" : time
							},
							success : function(data) {
								/* //判断验证码输入是否正确
								$(function(){//start
								$("#useVerificationCodeinput")
										.bind(
												"change input",
												function() {
													var useVerificationCode = $(
															"#useVerificationCodeinput")
															.val();
													alert(useVerificationCode);
													alert(data);
													if (data == useVerificationCode) {
														$(
																".useVerificationCodeIsCorrectPrompt")
																.html(
																		"");
													} else {
														$(
																".useVerificationCodeIsCorrectPrompt")
																.html(
																		"验证码错误，重新输入");
													}
												});
								}) ;//end */

							}
						});

					} else {
						$(".userTelephoneIsRegisterPrompt").html("请输入正确的手机号码");
					}
				}
			});
		}
	</script>
</body>
</html>
