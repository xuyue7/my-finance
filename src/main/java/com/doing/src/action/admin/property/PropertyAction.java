package com.doing.src.action.admin.property;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.doing.common.vo.PageVo;
import com.doing.src.entity.Search;
import com.doing.src.entity.property.PropertyInfo;
import com.doing.src.entity.property.PropertyType;
import com.doing.src.service.property.PropertyService;

/**
 * 资产管理
 * @author xy7
 *
 */
@Controller
@RequestMapping("admin/property")

public class PropertyAction {
	
	@Autowired
	private PropertyService propertyService;
	
	/**
	 * 获取资产管理页面
	 * @return src/property/property_manage_page.ftl
	 */
	@RequestMapping("property_manage_page")
	public String propertyManagePage() {
		return "src/property/property_manage_page";
	}
	
	/**
	 * 资产下资产管理页面数据
	 * @param search 查询实体
	 * @return map
	 */
	@RequestMapping("property_manage_data")
	@ResponseBody
	public Map<String, Object> propertyManageData(Search search){
		Map<String, Object> map = new HashMap<>();
		PageVo<PropertyInfo> pageVo = propertyService.selectSystemRecord(search);
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", pageVo.getCount());
		map.put("data", pageVo.getList());
		return map;
	}
	
	/**
	 * 获取资产下资产统计页面
	 * @return src/property/property_count_page.ftl
	 */
	@RequestMapping("property_count_page")
	public String propertyCountPage() {
		return "src/property/property_count_page";
	}
	
	/**
	 * 获取资产下资产类型设置页面
	 * @return src/property/property_type_page.ftl
	 */
	@RequestMapping("property_type_page")
	public String propertyTypePage() {
		return "src/property/property_type_page";
	}
	
	/**
	 * 获取资产下资产类型页面数据
	 * @param search 查询实体
	 * @return map
	 */
	@RequestMapping("property_type_data")
	@ResponseBody
	public Map<String, Object> propertyTypeData(Search search){
		Map<String, Object> map = new HashMap<>();
		PageVo<PropertyType> pageVo = propertyService.selectPropertyTypeAll(search);
		map.put("code", 0);
		map.put("msg", "");
		map.put("count", pageVo.getCount());
		map.put("data", pageVo.getList());
		return map;
	}
	
	/**
	 * 获取资产下资产详情页面
	 * @return  src/property/property_detail_page.ftl
	 */
	@RequestMapping("property_detail_page")
	public String propertyDetailPage() {
		return "src/property/property_detail_page";
	}
	
	
}
