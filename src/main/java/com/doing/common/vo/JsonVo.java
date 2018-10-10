package com.doing.common.vo;

import java.util.HashMap;

public class JsonVo<T> {

	public static final int CODE_NO_LOGIN = 100;
	private boolean success;
	/**
	 * 错误代码 100 用户未登�?
	 */
	private Integer code;

	private String msg;

	public boolean isSuccess() {
		return success;
	}

	public void setSuccess(boolean success) {
		this.success = success;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	/**
	 * 具体每个输入错误的消�?
	 */
	private HashMap<String, String> errors = new HashMap<String, String>();

	/**
	 * 返回的数�?
	 */
	private T t;

	public HashMap<String, String> getErrors() {
		return errors;
	}

	public void setErrors(HashMap<String, String> errors) {
		this.errors = errors;
	}

	public T getT() {
		return t;
	}

	public void setT(T t) {
		this.t = t;
	}

	public void check() throws ValidateException {
		if (this.getErrors().size() > 0) {
			this.setSuccess(false);
			throw new ValidateException("有错误发�?");
		} else {
			this.setSuccess(true);
		}
	}

}
