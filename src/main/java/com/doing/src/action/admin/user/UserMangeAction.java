package com.doing.src.action.admin.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doing.common.vo.PageVo;
import com.doing.src.entity.Search;
import com.doing.src.entity.user.AdminInfo;
import com.doing.src.entity.user.StaffInfo;
import com.doing.src.service.user.PeopleService;


@Controller
@RequestMapping("admin/user")
public class UserMangeAction {

	@Autowired
	private PeopleService peopleService;
	
	/**
	 * 返回用户管理下的管理员管理页面
	 * @return
	 */
	@RequestMapping("admin_manage_page")
	public String adminManagePage() {
		return "src/peoplemanage/admin_manage_index";
	}
	
	/**
	 * 返回用户管理下的员工管理页面
	 * @return
	 */
	@RequestMapping("staff_manage_page")
	public String staffManagePage() {
		return "src/peoplemanage/staff_manage_index";
	}
	

	/**
	 * 查询用户管理下的所有管理员信息
	 * @param search 查询内容实体
	 * @return map
	 */
	@RequestMapping("admin_index_data")
	@ResponseBody
	public Map<String, Object> adminIndexData(Search search){
		Map<String, Object> map = new HashMap<>();
		PageVo<AdminInfo> pageVo = peopleService.findAdminInfo(search);
		map.put("code", 0);
		map.put("data", pageVo.getList());
		map.put("msg", "");
		map.put("count", pageVo.getCount());
		return map;
	}
	
	/**
	 * 查询用户管理下的所员工信息
	 * @param search 查询内容实体
	 * @return map
	 */
	@RequestMapping("staff_index_data")
	@ResponseBody
	public Map<String, Object> staffIndexData(Search search){
		Map<String, Object> map = new HashMap<>();
		PageVo<StaffInfo> pageVo = peopleService.findStaffInfo(search);
		map.put("code", 0);
		map.put("data", pageVo.getList());
		map.put("msg", "");
		map.put("count", pageVo.getCount());
		return map;
	}
}










