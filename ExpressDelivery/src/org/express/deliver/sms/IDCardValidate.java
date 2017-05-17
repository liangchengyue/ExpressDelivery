package org.express.deliver.sms;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.util.EntityUtils;


public class IDCardValidate {
	/**
	 * 身份证实名认证
	 * @param idCard 身份证号
	 * @param realName 真实姓名
	 * @return 验证结果
	 */
		public static String getIdCard(String idCard,String realName){
		    String host = "http://jisusfzsm.market.alicloudapi.com";
		    String path = "/idcardverify/verify";
		    String method = "GET";
		    String appcode = "93c05f5683a646ada688dc9afcc12a2a";
		    Map<String, String> headers = new HashMap<String, String>();
		    //最后在header中的格式(中间是英文空格)为Authorization:APPCODE 83359fd73fe94948385f570e3c139105
		    headers.put("Authorization", "APPCODE " + appcode);
		    Map<String, String> querys = new HashMap<String, String>();
		    querys.put("idcard", idCard);
		    querys.put("realname", realName);
		    String string="";

		    try {
		    	HttpResponse response = HttpUtils.doGet(host, path, method, headers, querys);
		    	
		    	string=EntityUtils.toString(response.getEntity());
		    } catch (Exception e) {
		    	e.printStackTrace();
		    }
		    return string;
	}
}
