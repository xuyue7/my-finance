package com.doing.src.action.admin;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import com.doing.src.entity.User;

public class BasicManageAction {
	protected Log log = LogFactory.getLog(getClass());

	/**
	 * 登录用户名
	 */
	public String getCurrentLoginName() {
		Subject currentUser = SecurityUtils.getSubject();
		User user = currentUser.getPrincipals().oneByType(User.class);
		return user.getUserName();
	}
}
