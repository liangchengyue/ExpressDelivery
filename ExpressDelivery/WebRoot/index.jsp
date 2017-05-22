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
			<h3 class="form-title">管理员登录</h3>
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
				<label class="control-label visible-ie8 visible-ie9" >密码</label>
				<div class="input-icon">
					<i class="fa fa-lock"></i>
					<input class="form-control placeholder-no-fix required" type="password"
						autocomplete="off" placeholder="密码" name="password" />
				</div>
			</div>
			<div class="form-actions">
				<button type="reset" class="btn red pull-left">重置</button>
				<button type="submit" class="btn red pull-right">
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
			<span class="userNameIsEmptyPrompt" style="color: #B94A48"></span>
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
						<input class="form-control placeholder-no-fix required" type="password"
							autocomplete="off" placeholder="确认密码" name="rpassword"
							id="input_rpassword" />
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
					<span class="userTelephoneIsEmptyPrompt" style="color: #B94A48"></span>
				</div>

			</div>
				<div class="form-group">
				<label class="col-md-4 control-label left" style="margin-top: -1px;margin-left: -13px;">性别:</label>
				<div class="row">
					<label style="margin-left: 15px;"> <input class="col-md-4" type="radio" name="gender"
							id="optionsRadios1" value="男" checked>男
					</label> <label  style="margin-left: 20px;"> <input class="col-md-6" type="radio" name="gender"
							id="optionsRadios2" value="女"> 女
					</label>
				</div>
			</div>
			<div class="form-group">
				<div class="input-icon ">
					<i class="fa fa-check-square" style="margin-top:12px; "></i>
					<input class="form-control placeholder-no-fix required" type="text"
						autocomplete="off" placeholder="验证码" id="useVerificationCodeinput" />
					
					<button type="button" class="btn red " onclick="getvalicode()"
					id="getvalicodeBtn" style="margin-top: -33px;margin-left: 200px">
					获取验证码<i class="m-icon-swapright m-icon-white"></i>
				</button>
				<span class="useVerificationCodeIsCorrectPrompt" style="color: #B94A48"></span>
				</div>
			</div>
		
			<div class="form-actions">
				<button id="register-back-btn" type="button" class="btn">
					<i class="m-icon-swapleft"></i>返回
				</button>
				<button type="submit" id="register-submit-btn"
					class="btn red pull-right">
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
		var returnedValicode = "xxxxx";
		/* 登录页点击注册时，查询数据库的所有用户名 
		        使用ajax异步加载 调用controllor里面的方法
		 */
		function queryAllUser() {
			$.ajax({
				url : "user/preRegister"
			});
		}
		/* 注册时点击获得验证码，调用ajax发送验证码，并返回验证码 */
		function getvalicode() {
			//取得注册时用户输入的手机号码
			var phone = $("#userTelephoneinput").val();
			var regex = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
			if (phone == "") {
				alert("请先填写完整的电话号码");
			} else if (!regex.test(phone)) {
				alert("请先填写完整的电话号码");
			}	
			else {
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
			$("#useVerificationCodeinput").readOnly=true;
			//清空填写电话号码提示
			$("userTelephoneIsEmptyPrompt").html("");
			$(".useVerificationCodeIsCorrectPrompt").html("");
			//绑定注册时验证码输入框的input和chang事件
			$("#useVerificationCodeinput").bind(
					"change input",
					function() {
						//清空验证码输入提示
						$(".useVerificationCodeIsCorrectPrompt").html("");
						//取得输入的验证码
						var getuseVerificationCodeinput = $(
								"#useVerificationCodeinput").val();
						if (getuseVerificationCodeinput =="") {
							$(".useVerificationCodeIsCorrectPrompt").html("");
						}else
						if (getuseVerificationCodeinput == returnedValicode) {
							$("#register-submit-btn").attr("disabled", false);
							$(".useVerificationCodeIsCorrectPrompt").html(
									"验证码输入正确√");
						} else {
							//注册时输入验证码错误，则注册按钮不能点亮
							$("#register-submit-btn").attr("disabled", true);
							$(".useVerificationCodeIsCorrectPrompt").html(
									"验证码输入错误");
						}
					});
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
										$(".userTelephoneIsEmptyPrompt").html(
												"");
									} else {
										$(".userTelephoneIsEmptyPrompt").html(
												"请输入规范的电话号码");
									}
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
