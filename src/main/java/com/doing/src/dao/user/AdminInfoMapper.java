package com.doing.src.dao.user;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.doing.src.entity.Search;
import com.doing.src.entity.user.AdminInfo;

@Repository("adminInfoMapper")
public interface AdminInfoMapper {
    int deleteByPrimaryKey(String adminId);

    int insert(AdminInfo record);

    int insertSelective(AdminInfo record);

    AdminInfo selectByPrimaryKey(String adminId);

    int updateByPrimaryKeySelective(AdminInfo record);

    int updateByPrimaryKey(AdminInfo record);

	List<AdminInfo> selectByAll(Search search);

	int selectCount(Search search);
}