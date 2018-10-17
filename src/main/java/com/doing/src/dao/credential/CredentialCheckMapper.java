package com.doing.src.dao.credential;

import com.doing.src.entity.credential.CredentialCheck;

public interface CredentialCheckMapper {
    int deleteByPrimaryKey(String credentialId);

    int insert(CredentialCheck record);

    int insertSelective(CredentialCheck record);

    CredentialCheck selectByPrimaryKey(String credentialId);

    int updateByPrimaryKeySelective(CredentialCheck record);

    int updateByPrimaryKey(CredentialCheck record);
}