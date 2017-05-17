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

<title>用户找回密码</title>
<jsp:include page="/ui/jsp/commont/head-script.jsp" />
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="ui/assets/css/pages/login.css" rel="stylesheet"
	type="text/css" />
</head>

<body class="login">
	<div class="content">
		<div class="form-group">
			<h3>忘记密码 ?</h3>
			<p>请填写手机号进行身份确认</p>
			<div class="form-group row">
				<div class="input-icon col-md-7"
					style="padding: 0;margin-left: 15px">
					<i class="fa fa-phone-square"></i>
					<input class="form-control placeholder-no-fix" type="text"
						autocomplete="off" placeholder="手机号码" name="phoneNumber"
						id="useTelephoneinput" />
					<span class="userTelephoneIsRegisterPrompt"></span>
				</div>
				<button type="submit" class="btn green pull-right"
					onclick="GetValidationCode()">
					获取验证码<i class="m-icon-swapright m-icon-white"></i>
				</button>

			</div>
			<div class="form-group row">
				<div class="input-icon col-md-7"
					style="padding: 0;margin-left: 15px">
					<i class="fa fa-check-square"></i>
					<input class="form-control placeholder-no-fix" type="text"
						autocomplete="off" placeholder="验证码" name="erificationCode"
						id="useVerificationCodeinput" />
					<span class="useVerificationCodeIsCorrectPrompt"></span>
				</div>
				<button type="submit" class="btn green pull-right"
					onclick="sumbitinputvalicode()">
					提交验证码<i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function sumbitinputvalicode() {
			var useVerificationCodeinput = $("#useVerificationCodeinput").val();
			$
					.ajax({
						url : "user/useVerificationCodeIsCorrect",
						type : "post",
						data : {
							"userinputvaliCode" : useVerificationCodeinput
						},
						success : function(data) {
							if (data=="true") {
								window.location.href = "ui/jsp/tablelist_manger/user/userupdatepassword.jsp";
							}
							
							else {
								alert("请输入正确的验证码");
								$(".useVerificationCodeIsCorrectPrompt").html(
										"请输入正确的验证码");
							}

						}
					});
		}
		/*判断用户输入的电话号码是否存在  */
		function GetValidationCode() {
			//电话号码输入错误提示清空
			$(".userTelephoneIsRegisterPrompt").html("");
			//取得输入的电话号码
			var userTelephone = $("#useTelephoneinput").val();
			$.ajax({
				url : "user/userTelephoneIsExist",
				type : "post",
				datatype : "json",
				data : {
					"userTelephone" : userTelephone
				},
				success : function(data) {
					var d = JSON.parse(data);
					if (d["flag"] == "true") {
						alert("验证码发送成功");
						$(".userTelephoneIsRegisterPrompt").html("");
						//短信过期时间 （小时）
						var time = 5;
						//电话号码输入正确以后，发送验证码到该电话号码
						$.ajax({
							url : "user/getIndustrySMS",
							type : "post",
							data : {
								"phone" : d["phone"],
								"time" : time
							},
							success : function(data) {
							}
						});

					} else {
						$(".userTelephoneIsRegisterPrompt").html("请输入正确的手机号码");
					}
				}
			});
		}
	</script>
	<jsp:include page="/ui/jsp/commont/foot-script.jsp" /></body>

</html>
