package com.doing.src.action.pay.ali.util;

import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;

public class AlipayConfig {
	// 商户appid
	public static String APPID = "2018032102420346";
	// 私钥 pkcs8格式的
	public static String RSA_PRIVATE_KEY = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCtsRQNdq5WOnzZ94XMhQbZbjVvK0v//7t6BhJpMNIY9hJT3GNSsCrrvhB/VYCDy7NVBWwhxkP2TRyLoOEdA6KihXTosGxJeUm9a5iRj2FBhztHNk4nQECaHHFzpiypegdyMdWW6IiVvuhTKci8r74SGRPs+Veh1wYPrgSXSz/dQU8Hvt4/5Gcw7PkPDj8K1kRjzLElpFrhhMw0552HgGvDeIVjLACUz/FLwjjUNuyZka8ag7q9yv0/tH9BgrMKVLgBqjsE0Nw1yJoes1w+7bhSHSVpASj1uVZQA9ZUF89wx9miQO3AlxU7vHAOytFBGteIhXvI7ru7pnNYdrFFhQM5AgMBAAECggEAeJ365eqf4IOXRipMwR00B3QwKTYw/eLSh0eGK4RasjjXu2LVmot6EuGXRUXUDDI+I/GzCLVNZtJf21rqWSK4IxJ4gEpbuJ5Apgj9F0Axcrb9ZFOC7GEDO8I6yuwAIeT7HMMcp0Jt70d2wKHIo7eLT7gYjT0OLPZMYEEhMQtxmyxgvJ3uyX/BKU3WeRuApKe+BpkAhRGN6zLN3mDopv0IiCLtRVCsEkd2sJAeMMXFxgoHmmUukAfq1TOxFUZsnStjyp7FQ1XDJGAQaYu4nJS8l7sdcT6qgnN9XqLutCUQoXGq9rpdLCIdNRrMQoZl1IcUd6+/N84jYrIjp2DbY4TDPQKBgQD71jy8z99DSNQTsyotfOgPlNlyJwEr8MYYJXrEy0R29PPDCU38GT/ljTD8cZkdLSgPgK4ANS/JwbKNRVP5DaM9tw0lZtLfF3CjQfLJw6Oq30xGdaI2W2teLQAqyuZwclym12++/T0ZeXMlo3ZmDxTxNDmgLS5i6xSHAP2mZzrCiwKBgQCwkCJYedUqmw6b6dgITlZpVTamYz2KGFuba/JYS1eJ1bou6wbUl3FfcziqceIIcI8wdaIs9kqUHjdeumDVsrxOWrtTPoTFy7YEBuwWH0GnResvCZ9yCWpcF7HyrM5d0Lmeu+okM7+4nKY4MUDgHJp+6LpcnW/VxQwKUIGVIQkdywKBgQCv+pEOz6OP/QBVk8lRaAsxeC5K2n6zGdkTXn1frzr0dU8xZvsbwvkni3ZDsY3xGXD5BE6SzpfKQJRoq512V9VOdu+0xxlr05FeQ+NIonFoIgnG4sSrf06TzJZlUMueoAumer0XlRZxCrEwB/3ga4GS24+5IllbvjHl9QdKlLA26QKBgCEie3+VJZ8ASGaUJPmyEd9koYPqPeNLnO12/Zz6TqxMUst5Sefdn+Ykzm6WPrAMx6J1gQDlG6veW8/INGIGT/Z4ao09v1cLWtY4oleod/63TWKfcK/K+o3b2IZNTdEnWZ5jb5Zpq8Iui7ch7yXf2FKWxFqbJSC+APtyjk75SyevAoGBANIWdmz6jfbdRZlUfzh6nlkq8KWZYc3nnOGNxe9CgyKX9GL9P6hRbqyxwCKCoAT1hpJc8X3frVbELCEabhfBIgHFPSnZsn2UZEqxO2/uxZNYMg3znAnu51roVLa6bMQVlPBy35p5arzYhzol/ECmxO69pomsTHWT/zybX9UroMYF";
	// 服务器异步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	// http://www.ylcloudcastle.cn/app/user/spay
	public static String notify_url = "http://www.ylcloudcastle.cn/app/pay/notify_url.json";
	// 页面跳转同步通知页面路径 需http://或者https://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	// 商户可以自定义同步跳转地址
	public static String return_url = "http://www.ylcloudcastle.cn/app/pay/return_url.json";
	// 请求网关地址
	public static String URL = "https://openapi.alipay.com/gateway.do";
	// 编码
	public static String CHARSET = "UTF-8";
	// 返回格式
	public static String FORMAT = "json";
	// 支付宝公钥
	public static String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArAzFyUGFp+0RH49ZlkBClPBmDq+8yWSjkIbDi6FPfdOmSAmm6ZXc0Rix9MEPbR44t3d2IXFQsjoTlfo8I+ETpQBbr32N2+Dd6OxKNoTK3ont80wdD+z6kfa5kDSwTHuBz/eIMYYvi1MvjWcb/9yNnuwSoDiw8xk6K1wtmiUXoNsI5gInsPKMfWrCWzDRkp3QoAaETteDF/NNAqB6SS6aLnVZQhETf/3HSQQnyVn/Gy7DmzcEGAzwsw2LeaCi7yYwcPm0chEVx6FbjDCCj9MIm+ysY0lf1Yavtp2WFgwzqOrxTBqd5BAv9i86jUXplOQO4eQmqx21F6y8IKpaGyfzDwIDAQAB";
	// 日志记录目录
	public static String log_path = "/log";
	// RSA2
	public static String SIGNTYPE = "RSA2";

	// 统一收单交易创建接口
	private static AlipayClient alipayClient = null;

	/**
	 * 获得初始化的AlipayClient
	 * 
	 * @return 支付宝客户端
	 */
	public static AlipayClient getAlipayClient() {
		if (alipayClient == null) {
			synchronized (AlipayConfig.class) {
				if (null == alipayClient) {
					alipayClient = new DefaultAlipayClient(URL, APPID,
							RSA_PRIVATE_KEY, FORMAT, CHARSET,
							ALIPAY_PUBLIC_KEY, SIGNTYPE);
				}
			}
		}
		return alipayClient;
	}

}
