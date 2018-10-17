package com.doing.src.dao.system;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.doing.src.entity.Search;
import com.doing.src.entity.system.SystemRecord;

@Repository("systemRecordMapper")
public interface SystemRecordMapper {
    int deleteByPrimaryKey(String adminId);

    int insert(SystemRecord record);

    int insertSelective(SystemRecord record);

    SystemRecord selectByPrimaryKey(String adminId);

    int updateByPrimaryKeySelective(SystemRecord record);

    int updateByPrimaryKey(SystemRecord record);

	List<SystemRecord> selectSystemRecordAll(Search search);

	int findCount();
	
}