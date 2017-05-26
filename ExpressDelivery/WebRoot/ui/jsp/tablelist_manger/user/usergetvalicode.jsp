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
	<div class="content" style="margin:100px auto;">
		<div class="form-group">
			<h3>忘记密码 ?</h3>
				<a href="index.jsp" style="margin-left: 260px;margin-top: -40px;"><button class="btn red " style="margin-top: -76px;"><i class="m-icon-swapleft m-icon-white"></i>返回</button></a>
			
			<p>请填写手机号进行身份确认</p>
			<div class="form-group row">
				<div class="input-icon col-md-6"
					style="padding: 0;margin-left: 15px">
					<i class="fa fa-phone-square"></i>
					<input class="form-control placeholder-no-fix" type="text"
						autocomplete="off" placeholder="手机号码" name="phoneNumber"
						id="useTelephoneinput" />
					<span class="userTelephoneIsRegisterPrompt"  style="color: #B94A48"></span>
				</div>
				<button type="submit" class="btn red pull-right"
					onclick="GetValidationCode()" id="getvalicodeBtn">
					<span id="show_time" style="margin-left: -10px;">免费获取验证码</span>
				</button>

			</div>
			<div class="form-group row">
				<div class="input-icon col-md-6"
					style="padding: 0;margin-left: 15px">
					<i class="fa fa-check-square"></i>
					<input class="form-control placeholder-no-fix" type="text"
						autocomplete="off" placeholder="验证码" name="erificationCode"
						id="useVerificationCodeinput" />
					<span class="useVerificationCodeIsCorrectPrompt" style="color: #B94A48"></span>
				</div>
				<button type="submit" class="btn red pull-right"
					onclick="sumbitinputvalicode()" id="sumbitinputvalicodeBtn">
					提交验证码<i class="m-icon-swapright m-icon-white"></i>
				</button>
			</div>
		</div>
	</div>
	<jsp:include page="/ui/jsp/commont/foot-script.jsp" />
	<script type="text/javascript">
	$(function(){
		$("#sumbitinputvalicodeBtn").attr("disabled", true);
	});
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
						$("#sumbitinputvalicodeBtn").attr("disabled", false);
						alert("验证码发送成功");
						$(".userTelephoneIsRegisterPrompt").html("");
						//短信过期时间 （小时）
						var time = 2;
						//电话号码输入正确以后，发送验证码到该电话号码
						$.ajax({
							url : "user/getIndustrySMS",
							type : "post",
							data : {
								"phone" : d["phone"],
								"time" : time
							},
							success : function(data) {
								/*倒计时setInterval() 方法可按照指定的周期（以毫秒计）来调用函数或计算表达式。
								 setInterval() 方法会不停地调用函数，直到 clearInterval() 被调用或窗口被关闭。
								 由 setInterval() 返回的 ID 值可用作 clearInterval() 方法的参数。 */
								var step = 120;
								$('#show_time').html('120秒后可重新发送');
								var _res = setInterval(function() {
									$("#getvalicodeBtn").attr("disabled", true);//设置disabled属性
									$('#show_time').html(step + '秒后可重新发送');
									step -= 1;
									if (step <= 0) {
										$("#getvalicodeBtn").removeAttr("disabled"); //移除disabled属性
										$('#show_time').html('免费获取验证码');
										clearInterval(_res);//清除setInterval
									}
								}, 1000);

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
