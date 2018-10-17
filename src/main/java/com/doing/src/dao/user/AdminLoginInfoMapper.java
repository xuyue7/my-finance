package com.doing.src.dao.user;

import com.doing.src.entity.user.AdminLoginInfo;

public interface AdminLoginInfoMapper {
    int deleteByPrimaryKey(String adminId);

    int insert(AdminLoginInfo record);

    int insertSelective(AdminLoginInfo record);

    AdminLoginInfo selectByPrimaryKey(String adminId);

    int updateByPrimaryKeySelective(AdminLoginInfo record);

    int updateByPrimaryKey(AdminLoginInfo record);
}