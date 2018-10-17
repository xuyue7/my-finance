package com.doing.src.action.admin.system;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doing.common.vo.PageVo;
import com.doing.src.entity.Search;
import com.doing.src.entity.system.SystemRecord;
import com.doing.src.service.system.SystemService;

/**
 * 系统Action
 * @author xy7
 *
 */
@Controller
@RequestMapping("admin/system")

public class SystemAction {
	
	@Autowired
	private SystemService systemService;
	
	/**
	 * 加载系统系统信息下的操作日志主页
	 * @return system_record_index.ftl 页面
	 */
	@CrossOrigin(origins = "*", maxAge = 3600)
	@RequestMapping("system_record_index")
	public String systemRecordIndexPage() {
		return "src/system/system_record_index";
	}
	
	/**
	 * 查询系统信息下的操作日志数据
	 * @param page 页数
	 * @param limit 每页显示的行数
	 * @return map
	 */
	@CrossOrigin(origins = "*", maxAge = 3600)
	@RequestMapping("system_reord_data")
	@ResponseBody
	public Map<String, Object> systemReordData(Search search){
		Map<String, Object> map = new HashMap<>();
		PageVo<SystemRecord> pageVo = systemService.selectSystemRecord(search);
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", pageVo.getCount());
		map.put("data", pageVo.getList());
		return map;
	}
}












