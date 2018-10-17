package com.doing.src.dao.credential;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.doing.src.entity.Search;
import com.doing.src.entity.credential.FinanceSubject;

@Repository("financeSubjectMapper")
public interface FinanceSubjectMapper {
    int deleteByPrimaryKey(String subjectId);

    int insert(FinanceSubject record);

    int insertSelective(FinanceSubject record);

    FinanceSubject selectByPrimaryKey(String subjectId);

    int updateByPrimaryKeySelective(FinanceSubject record);

    int updateByPrimaryKey(FinanceSubject record);

	List<FinanceSubject> selectAll(Search search);

	int selectBySearchCount(Search search);
}