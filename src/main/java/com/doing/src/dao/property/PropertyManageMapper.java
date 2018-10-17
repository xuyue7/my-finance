package com.doing.src.dao.property;

import com.doing.src.entity.property.PropertyManage;

public interface PropertyManageMapper {
    int deleteByPrimaryKey(String propertyId);

    int insert(PropertyManage record);

    int insertSelective(PropertyManage record);

    PropertyManage selectByPrimaryKey(String propertyId);

    int updateByPrimaryKeySelective(PropertyManage record);

    int updateByPrimaryKey(PropertyManage record);
}