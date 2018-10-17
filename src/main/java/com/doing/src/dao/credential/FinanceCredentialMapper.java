package com.doing.src.dao.credential;

import com.doing.src.entity.credential.FinanceCredential;

public interface FinanceCredentialMapper {
    int deleteByPrimaryKey(String credentialId);

    int insert(FinanceCredential record);

    int insertSelective(FinanceCredential record);

    FinanceCredential selectByPrimaryKey(String credentialId);

    int updateByPrimaryKeySelective(FinanceCredential record);

    int updateByPrimaryKey(FinanceCredential record);
}