package com.doing.src.service.property;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doing.common.util.DateUtil;
import com.doing.common.vo.PageVo;
import com.doing.src.dao.property.PropertyInfoMapper;
import com.doing.src.dao.property.PropertyTypeMapper;
import com.doing.src.entity.Search;
import com.doing.src.entity.property.PropertyInfo;
import com.doing.src.entity.property.PropertyType;

@Service("propertyService")
public class PropertyService {
	
	@Autowired
	private PropertyInfoMapper propertyInfoMapper;
	@Autowired
	private PropertyTypeMapper propertyTypeMapper;

	/**
	 * 查询资产下资产管理的全部数据
	 * @param search 查询实体类
	 * @return pagVo
	 */
	public PageVo<PropertyInfo> selectSystemRecord(Search search) {
		// TODO Auto-generated method stub
		PageVo<PropertyInfo> pageVo = new PageVo<>(search.getPage());
		pageVo.setRows(search.getLimit());
		search.setPage(pageVo.getOffset());
		search.setLimit(pageVo.getRows());
		List<PropertyInfo> list = propertyInfoMapper.selectPeopertyInfoAll(search);
		for(int i = 0;i < list.size(); i++) {
			PropertyInfo propertyInfo = list.get(i);
			propertyInfo.setShowTime(DateUtil.Date2Stirng(propertyInfo.getPropertyDt()));
		}
		int count = propertyInfoMapper.findCount(search);
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}

	/**
	 * 查询资产下资产类型的全部数据
	 * @param search 查询实体类
	 * @return pagVo
	 */
	public PageVo<PropertyType> selectPropertyTypeAll(Search search) {
		PageVo<PropertyType> pageVo = new PageVo<>(search.getPage());
		pageVo.setRows(search.getLimit());
		search.setPage(pageVo.getOffset());
		search.setLimit(pageVo.getRows());
		List<PropertyType> list = propertyTypeMapper.selectPeopertyTypeAll(search);
		for(int i = 0;i < list.size(); i++) {
			PropertyType propertyType = list.get(i);
			propertyType.setShowTime(DateUtil.Date2Stirng(propertyType.getPropertyTypeDt()));
		}
		int count = propertyTypeMapper.findPeopertyTypeCount(search);
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}

}
