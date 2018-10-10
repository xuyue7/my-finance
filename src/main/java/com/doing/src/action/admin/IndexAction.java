package com.doing.src.action.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.doing.common.util.UserManagerUtil;
import com.doing.src.entity.User;

@RequestMapping("admin")
@Controller("adminIndexAction")
public class IndexAction {

	@RequestMapping("index")
	public String index(Model model) {
		User user = UserManagerUtil.getCurrentUser();
		model.addAttribute("user", user);
		return "src/index";
	}

	@RequestMapping("home")
	public String home() {
		return "src/home/console";
	}
	
//	Entity -- dao  -- service -- action

}
