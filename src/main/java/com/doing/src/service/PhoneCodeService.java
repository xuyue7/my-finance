package com.doing.src.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.doing.src.dao.PhoneCodeDao;
import com.doing.src.entity.PhoneCode;

@Service("phoneCodeService")
public class PhoneCodeService {

	@Resource(name = "phoneCodeDao")
	private PhoneCodeDao phoneCodeDao;

	/**
	 * 添加
	 */
	public void insert(PhoneCode record) {
		phoneCodeDao.insert(record);
	}
	
	public PhoneCode findByNew(String phone){
		return phoneCodeDao.findByNew(phone);
	}

}
