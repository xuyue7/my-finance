package com.doing.src.action.pay.wechat.util;


public class ConfigUtil {
	/**
	 * 服务号相关信息
	 */
	public final static String APPID = "wx94b9f9848e25f2e5";// 服务号的应用号
	public final static String APP_APPID = "wx7badf82fb96b140f";// 服务号的应用号
	public static final String APP_SECRET = "1c94653d0a6fa9df77b549017045acf4";// 公众号AppSecret
	public final static String MCH_ID = "1504941291";// 商户号
	public final static String APP_MCH_ID = "1510331101";// 商户号
	public final static String API_KEY = "9T2R88JWWnzd5QFbinlFGOkXwvi3DzDN";// API密钥
	public final static String SIGN_TYPE = "MD5";// 签名加密方式

	public final static String UNIFIED_ORDER_URL = "https://api.mch.weixin.qq.com/pay/unifiedorder";

	/**
	 * 通过code获取授权access_token的URL
	 */
	public static String Authtoken_URL(String code) {
		StringBuffer url = new StringBuffer();
		url.append("https://api.weixin.qq.com/sns/oauth2/access_token?appid=");
		url.append(ConfigUtil.APPID);
		url.append("&secret=");
		url.append(ConfigUtil.APP_SECRET);
		url.append("&code=");
		url.append(code);
		url.append("&grant_type=authorization_code");
		return url.toString();
	}
}