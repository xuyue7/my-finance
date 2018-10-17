package com.doing.src.dao.property;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.doing.src.entity.Search;
import com.doing.src.entity.property.PropertyInfo;

@Repository("propertyInfoMapper")
public interface PropertyInfoMapper {
    int deleteByPrimaryKey(String propertyId);

    int insert(PropertyInfo record);

    int insertSelective(PropertyInfo record);

    PropertyInfo selectByPrimaryKey(String propertyId);

    int updateByPrimaryKeySelective(PropertyInfo record);

    int updateByPrimaryKey(PropertyInfo record);

	List<PropertyInfo> selectPeopertyInfoAll(Search search);

	int findCount(Search search);
}