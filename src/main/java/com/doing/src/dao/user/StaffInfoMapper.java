package com.doing.src.dao.user;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.doing.src.entity.Search;
import com.doing.src.entity.user.StaffInfo;

@Repository("staffInfoMapper")
public interface StaffInfoMapper {
    int insert(StaffInfo record);

    int insertSelective(StaffInfo record);

	List<StaffInfo> selectByAll(Search search);

	int selectCount(Search search);
}