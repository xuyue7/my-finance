package com.doing.common.util;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

public class UserManagerUtil {

	public final static void setSessionAttribute(Object key, Object value) {
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.getSession().setAttribute(key, value);
	}

	@SuppressWarnings("unchecked")
	public final static <T> T getSessionAttribute(Object key, Class<T> className) {
		Subject currentUser = SecurityUtils.getSubject();
		return (T) currentUser.getSession().getAttribute(key);
	}

	@SuppressWarnings("unchecked")
	public final static <T> T getCurrentUser() {
		Subject currentUser = SecurityUtils.getSubject();
		return (T) currentUser.getPrincipal();
	}
}
