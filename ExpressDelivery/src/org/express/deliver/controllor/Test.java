package org.express.deliver.controllor;

public class Test {

	public static void main(String[] args) {
		String string="{\"status\":\"0\",\"msg\":\"ok\",\"result\":{\"idcard\":\"520122199508310031\",\"realname\":\"梁城月\",\"province\":\"贵州\",\"city\":\"贵阳\",\"town\":\"息烽县\",\"sex\":\"男\",\"birth\":\"1995年08月31日\",\"verifystatus\":\"0\",\"verifymsg\":\"恭喜您，身份证校验一致！\"}}";
		String tString=string.substring(string.indexOf("msg"),string.indexOf("result"));
		tString=tString.substring(tString.indexOf(":")+2, tString.indexOf(",")-1);
		System.out.println(tString);

	}

}
