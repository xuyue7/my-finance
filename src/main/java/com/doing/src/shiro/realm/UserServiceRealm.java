package com.doing.src.shiro.realm;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.doing.src.entity.User;
import com.doing.src.service.UserService;

public class UserServiceRealm extends AuthorizingRealm {

	private Log log = LogFactory.getLog(UserServiceRealm.class);

	@Autowired
	private UserService userService;

	/**
	 * 获取用户权限
	 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(
			PrincipalCollection principals) {
		if (principals == null) {
			throw new AuthorizationException("Principal对象不能为空");
		}
		SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
		User user = (User) getAvailablePrincipal(principals);
		// if (user.getRoleNames() != null) {
		// info.addRole(user.getRoleNames());
		// }
		log.info("加载用户权限信息，当前登陆用户名:" + user.getUserName());

		return info;
	}

	/**
	 * 创建用户信息
	 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken token) throws AuthenticationException {
		String username = (String) token.getPrincipal(); // 得到用户名
		String password = new String((char[]) token.getCredentials()); // 得到密码
		User user = userService.findByUserName(username);
		if (user == null) {
			throw new UnknownAccountException(); // 如果用户名错误
		}
		if (!StringUtils.equals(user.getPassword(),
				DigestUtils.md5Hex(password))) {
			throw new IncorrectCredentialsException(); // 如果密码错误
		}
		// 如果身份认证验证成功，返回一个AuthenticationInfo实现;
		return new SimpleAuthenticationInfo(user, user.getPassword(), getName());
	}

	/**
	 * 重写凭证比对函数
	 */
	@Override
	protected void assertCredentialsMatch(AuthenticationToken token,
			AuthenticationInfo info) throws AuthenticationException {
	}

}
