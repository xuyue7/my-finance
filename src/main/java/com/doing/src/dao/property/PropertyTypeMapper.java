package com.doing.src.dao.property;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.doing.src.entity.Search;
import com.doing.src.entity.property.PropertyType;

@Repository("propertyTypeMapper")
public interface PropertyTypeMapper {
    int deleteByPrimaryKey(String propertyTypeId);

    int insert(PropertyType record);

    int insertSelective(PropertyType record);

    PropertyType selectByPrimaryKey(String propertyTypeId);

    int updateByPrimaryKeySelective(PropertyType record);

    int updateByPrimaryKey(PropertyType record);

	List<PropertyType> selectPeopertyTypeAll(Search search);

	int findPeopertyTypeCount(Search search);
}