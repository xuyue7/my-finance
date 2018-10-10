package com.doing.src.action.pay.wechat.controller;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom.JDOMException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doing.src.action.pay.wechat.util.ConfigUtil;
import com.doing.src.action.pay.wechat.util.PayCommonUtil;
import com.doing.src.action.pay.wechat.util.PayUtils;
import com.doing.src.action.pay.wechat.util.XMLUtil;

@Controller
@RequestMapping("pay")
public class Pay {

	/**
	 * 微信统一下单接口
	 * 
	 * @param request
	 * @param response
	 * @throws UnsupportedEncodingException
	 */
	@ResponseBody
	@RequestMapping("wxPrePay")
	public Map<String, Object> wxPrePay(HttpServletRequest request,
			HttpServletResponse response, String price, String body,
			String out_trade_no, String openid)
			throws UnsupportedEncodingException {

		Map<String, Object> resultMap = new HashMap<String, Object>();
		int price100 = new BigDecimal(price).multiply(new BigDecimal(100))
				.intValue();
		if (price100 <= 0) {
			resultMap.put("msg", "付款金额错误");
			resultMap.put("code", "500");
			return resultMap;
		}
		String notify_url = "http://www.ylcloudcastle.cn/pay/wxNotify";

		String currTime = PayCommonUtil.getCurrTime();
		String strTime = currTime.substring(8, currTime.length());
		String strRandom = PayCommonUtil.buildRandom(4) + "";
		String nonce_str = strTime + strRandom;
		String timeStamp = PayUtils.getTimeStamp();
		SortedMap<String, Object> parameters = new TreeMap<String, Object>();
		parameters.put("appid", ConfigUtil.APP_APPID);
		parameters.put("body", body);
		parameters.put("mch_id", ConfigUtil.APP_MCH_ID);
		parameters.put("nonce_str", nonce_str);
		parameters.put("notify_url", notify_url);
		parameters.put("out_trade_no", out_trade_no);
		parameters.put("spbill_create_ip", "202.98.201.21");
		parameters.put("total_fee", String.valueOf(price100));
		parameters.put("trade_type", "APP");
		String sign = PayUtils.createSign("UTF-8", parameters);
		parameters.put("sign", sign);
		String requestXML = PayCommonUtil.getRequestXml2(parameters);
		String result = PayCommonUtil.httpsRequest(
				ConfigUtil.UNIFIED_ORDER_URL, "POST", requestXML);
		try {
			Map<String, String> map = XMLUtil.doXMLParse(result);
			SortedMap<String, Object> parameterMap2 = new TreeMap<String, Object>();
			parameterMap2.put("appid", ConfigUtil.APP_APPID);
			parameterMap2.put("partnerid", ConfigUtil.APP_MCH_ID);
			parameterMap2.put("prepayid", map.get("prepay_id"));
			parameterMap2.put("package", "Sign=WXPay");
			parameterMap2.put("noncestr", PayCommonUtil.CreateNoncestr());
			parameterMap2.put("timestamp",timeStamp);
			String sign2 = PayUtils.getSign(parameterMap2);
			parameterMap2.put("sign", sign2);
			resultMap.put("code", "200");
			resultMap.put("msg", parameterMap2);
		} catch (JDOMException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return resultMap;
	}

	/**
	 * 微信异步通知
	 */
	@RequestMapping("wxNotify")
	public void wxNotify(HttpServletRequest request,
			HttpServletResponse response) throws IOException, JDOMException {
		System.out.println("进入微信异步通知");
		// 读取参数
		InputStream inputStream;
		StringBuffer sb = new StringBuffer();
		inputStream = request.getInputStream();
		String s;
		BufferedReader in = new BufferedReader(new InputStreamReader(
				inputStream, "UTF-8"));
		while ((s = in.readLine()) != null) {
			sb.append(s);
		}
		in.close();
		inputStream.close();
		// 解析xml成map
		Map<String, String> m = new HashMap<String, String>();
		m = XMLUtil.doXMLParse(sb.toString());
		for (Object keyValue : m.keySet()) {
			System.out.println(keyValue + "=" + m.get(keyValue));
		}
		// 过滤空 设置 TreeMap
		SortedMap<Object, Object> packageParams = new TreeMap<Object, Object>();
		Iterator it = m.keySet().iterator();
		while (it.hasNext()) {
			String parameter = (String) it.next();
			String parameterValue = m.get(parameter);

			String v = "";
			if (null != parameterValue) {
				v = parameterValue.trim();
			}
			packageParams.put(parameter, v);
		}

		// 判断签名是否正确
		String resXml = "";
		System.out.println("获取packageParams  === " + packageParams);
		if (PayCommonUtil.isTenpaySign("UTF-8", packageParams)) {
			if ("SUCCESS".equals((String) packageParams.get("result_code"))) {
				// 这里是支付成功
				// ////////执行自己的业务逻辑////////////////
				String mch_id = (String) packageParams.get("mch_id"); // 商户号
				String openid = (String) packageParams.get("openid"); // 用户标识
				String out_trade_no = (String) packageParams
						.get("out_trade_no"); // 商户订单号
				String total_fee = (String) packageParams.get("total_fee");
				String transaction_id = (String) packageParams
						.get("transaction_id"); // 微信支付订单号
				// GoodsTrade gt = new GoodsTrade();
				// gt.setTid(out_trade_no);
				// //查询订单 根据订单号查询订单 GoodsTrade -订单实体类
				// GoodsTrade trade = 订单查询;

				resXml = "<xml>"
						+ "<return_code><![CDATA[SUCCESS]]></return_code>"
						+ "<return_msg><![CDATA[OK]]></return_msg>" + "</xml> ";

			} else {
				System.out
						.println("支付失败,错误信息：" + packageParams.get("err_code"));
				resXml = "<xml>"
						+ "<return_code><![CDATA[FAIL]]></return_code>"
						+ "<return_msg><![CDATA[报文为空]]></return_msg>"
						+ "</xml> ";
			}

		} else {
			resXml = "<xml>" + "<return_code><![CDATA[FAIL]]></return_code>"
					+ "<return_msg><![CDATA[通知签名验证失败]]></return_msg>"
					+ "</xml> ";
			System.out.println("通知签名验证失败");
		}

		// ------------------------------
		// 处理业务完毕
		// ------------------------------
		BufferedOutputStream out = new BufferedOutputStream(
				response.getOutputStream());
		out.write(resXml.getBytes());
		out.flush();
		out.close();

	}
	
	
}
