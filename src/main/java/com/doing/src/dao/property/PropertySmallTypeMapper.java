package com.doing.src.dao.property;

import com.doing.src.entity.property.PropertySmallType;

public interface PropertySmallTypeMapper {
    int deleteByPrimaryKey(String sId);

    int insert(PropertySmallType record);

    int insertSelective(PropertySmallType record);

    PropertySmallType selectByPrimaryKey(String sId);

    int updateByPrimaryKeySelective(PropertySmallType record);

    int updateByPrimaryKey(PropertySmallType record);
}