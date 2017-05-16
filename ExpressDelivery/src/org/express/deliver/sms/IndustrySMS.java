package org.express.deliver.sms;

import org.express.deliver.sms.commom.Config;
import org.express.deliver.sms.commom.HttpUtil;
/**
 * 通过手机号发送验证码
 * @author 梁城月
 *
 */
public class IndustrySMS
{
	private static String operation = "/industrySMS/sendSMS";

	private static String accountSid = Config.ACCOUNT_SID;
	private static String to ;
	private static String smsContent;

	/**
	 * 获取验证码
	 * @param phone 手机号
	 * @param valiCode 验证码
	 * @param time 有效时间
	 * @return 短信状态
	 */
	public static String execute(String phone,String valiCode,int time)
	{
		to=phone;
		smsContent="【代取快递】您的验证码为"+valiCode+"，请于"+time+"分钟内正确输入，如非本人操作，请忽略此短信。";
		String url = Config.BASE_URL + operation;
		String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + smsContent
				+ HttpUtil.createCommonParam();

		//提交请求
		String result = HttpUtil.post(url, body);
		System.out.println("result:" + System.lineSeparator() + result);
		return System.lineSeparator()+result;
	}
}
