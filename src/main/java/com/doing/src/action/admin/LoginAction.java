package com.doing.src.action.admin;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doing.common.vo.JsonVo;

/**
 * 登陆Controller
 * 
 * @author yangxiaobing
 * @date 2017/7/17
 *
 */
@Controller("manageLoginAction")
@RequestMapping("admin")
public class LoginAction extends BasicManageAction {

	/**
	 * 跳转到登录页面
	 *
	 * @return
	 */
	@RequestMapping("/login")
	public String toLoginPage() {
		return "src/login";
	}
	

	/**
	 * 登录验证处理
	 * 
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/loginCheck")
	public JsonVo<String> loginCheck(String userName, String Pd) {
//		String userName = new String(DecryptUtil.decode(username));
//		String Pd = new String(DecryptUtil.decode(password));
		log.info("登陆验证处理开始");
		long start = System.currentTimeMillis();
		JsonVo<String> json = new JsonVo<String>();
		try {
			// 1.用户名不能为空
			if (StringUtils.isEmpty(userName)) {
				log.error("登陆验证失败,原因:用户名不能为空");
				json.setSuccess(false);
				json.setMsg("用户名不能为空");
				return json;
			}
			// 2.密码不能为空
			if (StringUtils.isEmpty(Pd)) {
				log.error("登陆验证失败,原因:密码不能为空");
				json.setSuccess(false);
				json.setMsg("密码不能为空");
				return json;
			}
			UsernamePasswordToken token = new UsernamePasswordToken(userName,
					Pd);
			token.setRememberMe(true);
			Subject currentUser = SecurityUtils.getSubject();

			currentUser.login(token);
			if (!currentUser.isAuthenticated()) {
				json.setSuccess(false);
				json.setMsg("请输入正确的用户名或密码");
				return json;
			}
			json.setSuccess(true);
			json.setCode(200);
			return json;
		} catch (IncorrectCredentialsException ice) {
			log.error("登陆验证失败,原因:用户名或密码不匹配");
			json.setSuccess(false);
			json.setMsg("请输入正确的用户名或密码");
			return json;
		} catch (AccountException e) {
			log.error("登陆验证失败,原因:用户名或密码不匹配");
			json.setSuccess(false);
			json.setMsg("请输入正确的用户名或密码");
			return json;
		} catch (Exception e) {
			log.error("登陆验证失败,原因:系统登陆异常", e);
			json.setSuccess(false);
			json.setMsg("请输入正确的用户名或密码");
			return json;
		} finally {
			log.info("登陆验证处理结束,用时" + (System.currentTimeMillis() - start)
					+ "毫秒");
		}

	}

	/**
	 * 用户退出
	 */
	@RequestMapping("/logout")
	public String logout() {
		Subject currentUser = SecurityUtils.getSubject();
		currentUser.logout();
		return "src/login";
	}

}
