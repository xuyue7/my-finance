package com.doing.src.dao;

import org.springframework.stereotype.Repository;


import com.doing.src.entity.PhoneCode;

@Repository("phoneCodeDao")
public interface PhoneCodeDao {

	/**
	 * 添加
	 */
	public void insert(PhoneCode record);

	public PhoneCode findByNew(String phone);

}
