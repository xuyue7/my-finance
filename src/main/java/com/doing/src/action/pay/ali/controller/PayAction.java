package com.doing.src.action.pay.ali.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.domain.AlipayTradePagePayModel;
import com.alipay.api.domain.AlipayTradeWapPayModel;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradeAppPayRequest;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.response.AlipayTradeAppPayResponse;
import com.doing.common.vo.JsonVo;
import com.doing.src.action.pay.ali.util.AlipayConfig;

@Controller
@RequestMapping("app/pay")
public class PayAction {

	@RequestMapping("pay.htm")
	public String pay() {
		return "admin/index";
	}

	/**
	 * 支付接口app支付
	 * 
	 * @throws IOException
	 */
	@CrossOrigin(origins = "*", maxAge = 3600)
	@ResponseBody
	@RequestMapping("mobilepay")
	public String pay_mobile(String WIDout_trade_no, String WIDsubject,
			String WIDtotal_amount, String WIDbody, HttpServletResponse response)
			throws IOException {
		JsonVo<String> json = new JsonVo<String>();
		String orderStr = "";
		if (StringUtils.equals(WIDout_trade_no, "")) {
			json.setCode(0);
		} else {

			String timeout_express = "2m";
			String product_code = "QUICK_WAP_WAY";
			AlipayClient client = new DefaultAlipayClient(AlipayConfig.URL,
					AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY,
					AlipayConfig.FORMAT, AlipayConfig.CHARSET,
					AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.SIGNTYPE);
			AlipayTradeAppPayRequest request = new AlipayTradeAppPayRequest();

			AlipayTradeWapPayModel model = new AlipayTradeWapPayModel();
			model.setOutTradeNo(WIDout_trade_no);
			model.setSubject(WIDsubject);
			model.setTotalAmount(WIDtotal_amount);
			model.setBody(WIDbody);
			model.setTimeoutExpress(timeout_express);
			model.setProductCode(product_code);
			request.setBizModel(model);
			request.setNotifyUrl(AlipayConfig.notify_url);
			try {
				AlipayTradeAppPayResponse response1 = client
						.sdkExecute(request);
				orderStr = response1.getBody();
			} catch (AlipayApiException e) {
				e.printStackTrace();
			}
		}
		return orderStr;
	}

	/**
	 * 支付接口网页支付和网页支付合一
	 * 
	 * @throws IOException
	 */
	@CrossOrigin(origins = "*", maxAge = 3600)
	@ResponseBody
	@RequestMapping("mobilepay_pc")
	public void goPay(String WIDout_trade_no, String WIDsubject,
			String WIDtotal_amount, String WIDbody, HttpServletRequest request,
			HttpServletResponse response, String rechargeMon, String jumpurl)
			throws Exception {

		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.URL,
				AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY, "json",
				AlipayConfig.CHARSET, AlipayConfig.ALIPAY_PUBLIC_KEY,
				AlipayConfig.SIGNTYPE);
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(jumpurl);
		AlipayTradePagePayModel model = new AlipayTradePagePayModel();
		model.setOutTradeNo(WIDout_trade_no);
		model.setSubject(WIDsubject);
		model.setTotalAmount(WIDtotal_amount);
		model.setBody(WIDbody);
		model.setTimeoutExpress("");
		model.setProductCode("FAST_INSTANT_TRADE_PAY");
		alipayRequest.setBizModel(model);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

		String form = alipayClient.pageExecute(alipayRequest).getBody();
		response.setContentType("text/html;charset=" + AlipayConfig.CHARSET);
		response.getWriter().write(form);// 直接将完整的表单html输出到页面
		response.getWriter().flush();
		response.getWriter().close();
	}

	/**
	 * 支付宝回调地址
	 * 
	 * @param requestParams
	 * @throws UnsupportedEncodingException
	 * @throws AlipayApiException
	 */
	@ResponseBody
	@RequestMapping("notify_url.json")
	public void notify_url(HttpServletRequest request,
			HttpServletResponse httpResponse)
			throws UnsupportedEncodingException, AlipayApiException {// 获取支付宝POST过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		Set<String> keySet = requestParams.keySet();
		String out_trade_no = "";
		String trade_status = "";
		String total_amount = "";
		for (String key : keySet) {
			StringBuffer buffer = new StringBuffer();
			for (String string : requestParams.get(key)) {
				buffer.append(string);
			}
			params.put(key, buffer.toString());
			if (key.equals("out_trade_no")) {
				out_trade_no = buffer.toString();// 商户订单号
				System.out.println(key + " : " + buffer.toString());
			} else if (key.equals("trade_status")) {
				trade_status = buffer.toString();// 交易状态
				System.out.println(key + " : " + buffer.toString());
			} else if (key.equals("total_amount")) {
				total_amount = buffer.toString().substring(0,
						buffer.toString().length() - 3)
						+ "";// 充值金额
				System.out.println(key + " : " + total_amount);
			}
		}
		try {
			// 计算得出通知验证结果
			boolean verify_result = AlipaySignature.rsaCheckV1(params,
					AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.CHARSET,
					AlipayConfig.SIGNTYPE);

			if (verify_result) {// 验证成功
				if (trade_status.equals("TRADE_SUCCESS")) {
					System.out.println("支付成功notify_url.json");
				}
			} else {// 验证失败
				httpResponse.getWriter().println("fail");
				System.out.println("支付失败notify_url.json");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@ResponseBody
	@RequestMapping("return_url.json")
	public String return_url(Map requestParams) throws AlipayApiException,
			UnsupportedEncodingException {
		Map<String, String> params = new HashMap<String, String>();
		for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}

		// 获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
		// 商户订单号

		String out_trade_no = new String(params.get("out_trade_no").getBytes(
				"ISO-8859-1"), "UTF-8");

		// 支付宝交易号

		String trade_no = new String(params.get("trade_no").getBytes(
				"ISO-8859-1"), "UTF-8");

		boolean verify_result = AlipaySignature.rsaCheckV1(params,
				AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.CHARSET, "RSA2");

		if (verify_result) {// 验证成功
			// 订单支付成功业务逻辑
			System.out.println("支付成功，获取回调return_url.json");

			return "success";

		} else {
			return "0";
		}

	}

//	/**
//	 * 提现
//	 * 
//	 * @param userid
//	 * @param orderNo
//	 * @param payeeAccount
//	 * @param amount
//	 * @param payerShowName
//	 * @param payeeRealName
//	 * @param remark
//	 * @param alipayid
//	 * @return
//	 * @throws AlipayApiException
//	 */
//	@RequestMapping("withdraw")
//	@ResponseBody
//	public JsonVo<String> withdraw(
//			@RequestParam(value = "userid", required = false) Integer userid,
//			String orderNo, String payeeAccount, String amount,
//			String payerShowName, String payeeRealName, String remark,
//			@RequestParam(value = "alipayid", required = false) String alipayid)
//			throws AlipayApiException {
//		JsonVo<String> json = new JsonVo<String>();
//
//		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.URL,
//				AlipayConfig.APPID, AlipayConfig.RSA_PRIVATE_KEY,
//				AlipayConfig.FORMAT, AlipayConfig.CHARSET,
//				AlipayConfig.ALIPAY_PUBLIC_KEY, AlipayConfig.SIGNTYPE);
//
//		AlipayFundTransToaccountTransferRequest request = new AlipayFundTransToaccountTransferRequest();
//		User user = userService.findById(userid);
//		if (user.getAliPayId() == null) {
//			json.setCode(0);
//			json.setMsg("请先绑定支付宝账号");
//		} else if (user.getAliPayId() != null) {
//			alipayid = user.getAliPayId();
//			orderNo = "123321123321";
//			payeeAccount = user.getAliPayId();
//			payerShowName = "云屯网";
//			// payeeRealName=alipayService.selectalipayid(userid);
//			System.out.println(orderNo);
//			request.setBizContent("{"
//					+ "    \"out_biz_no\":\""
//					+ orderNo
//					+ "\","
//					+ // 订单号唯一
//					"    \"payee_type\":\"ALIPAY_LOGONID\","
//					+ "    \"payee_account\":\"" + payeeAccount + "\","
//					+ "    \"amount\":\"" + amount + "\","
//					+ "    \"payee_account\":\"" + alipayid + "\","
//					+ "    \"payer_show_name\":\"" + payerShowName + "\"," + // 付款方姓名
//					/*
//					 * "    \"payee_real_name\":\""+payeeRealName+"\"," + //
//					 * 收款方姓名 "    \"remark\":\""+remark+"\"," +
//					 */
//					"  }");
//
//			AlipayFundTransToaccountTransferResponse response = alipayClient
//					.execute(request);
//			if (response.isSuccess()) {
//				System.out.println("调用成功");
//				json.setCode(1);
//				json.setMsg("提现成功");
//				return json;
//			} else {
//				System.out.println("调用失败");
//				json.setCode(0);
//				json.setMsg("提现失败");
//				return json;
//			}
//		}
//		return json;
//	}
}
