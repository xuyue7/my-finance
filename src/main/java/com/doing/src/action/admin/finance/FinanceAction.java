package com.doing.src.action.admin.finance;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doing.common.vo.PageVo;
import com.doing.src.entity.Search;
import com.doing.src.entity.credential.FinanceSubject;
import com.doing.src.service.finance.FinanceService;

@Controller
@RequestMapping("admin/finance")
public class FinanceAction {

	@Autowired
	private FinanceService financeServicece;
	
	/**
	 * 获取凭证管理下的新增凭证页面
	 * @return src/finance/finance_credential_add.ftl
	 */
	@RequestMapping("fiance_credential_page")
	public String fianceCredentialPage() {
		return "src/finance/finance_credential_add";
	}
	
	/**
	 * 获取凭证管理下查看凭证页面
	 * @return src/finance/finance_credential_see.ftl
	 */
	@RequestMapping("fiance_credential_see")
	public String fianceCredentialSee() {
		return "src/finance/finacne_credential_see";
	}
	
	/**
	 * 获取凭证管理下全部凭证页面
	 * @return src/finance/finance_credential_all.ftl
	 */
	@RequestMapping("fiance_credential_all")
	public String fianceCredentialAll() {
		return "src/finance/finance_credential_all";
	}
	
	/**
	 * 获取设置下的科目页面
	 * @return
	 */
	@RequestMapping("finance_subject_page")
	public String financeSubjectPage() {
		return "src/finance/finance_subject_page";
	}
	
	/**
	 * 获取设置下科目页面数据 
	 * @param search 查询实体类
	 * @return map
	 */
	@RequestMapping("finance_subject_data")
	@ResponseBody
	public Map<String, Object> financeSubjectData(Search search){
		Map<String, Object> map = new HashMap<>();
		PageVo<FinanceSubject> pageVo = financeServicece.selectFinanceAll(search);
		map.put("code", 0);
		map.put("data", pageVo.getList());
		map.put("msg", "");
		map.put("count", pageVo.getCount());
		return map;
	}
	
}



