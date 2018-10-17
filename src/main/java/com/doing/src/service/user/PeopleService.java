package com.doing.src.service.user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doing.common.util.DateUtil;
import com.doing.common.vo.PageVo;
import com.doing.src.dao.user.AdminInfoMapper;
import com.doing.src.dao.user.StaffInfoMapper;
import com.doing.src.entity.Search;
import com.doing.src.entity.user.AdminInfo;
import com.doing.src.entity.user.StaffInfo;

@Service("peopleService")
public class PeopleService {

	@Autowired
	private AdminInfoMapper adminInfoMapper;
	@Autowired
	private StaffInfoMapper staffInfoMapper;

	/**
	 * 查询用户管理下的所有管理员信息
	 * 
	 * @param search 查询内容实体
	 * @return pagVo
	 */
	public PageVo<AdminInfo> findAdminInfo(Search search) {
		// TODO Auto-generated method stub
		PageVo<AdminInfo> pageVo = new PageVo<>(search.getPage());
		pageVo.setRows(search.getLimit());
		search.setPage(pageVo.getOffset());
		search.setLimit(pageVo.getRows());
		List<AdminInfo> list = adminInfoMapper.selectByAll(search);
		int count = adminInfoMapper.selectCount(search);
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}

	/**
	 * 查询用户管理下的员工信息
	 * 
	 * @param search 查询内容实体
	 * @return pagVo
	 */
	public PageVo<StaffInfo> findStaffInfo(Search search) {
		// TODO Auto-generated method stub
		PageVo<StaffInfo> pageVo = new PageVo<>(search.getPage());
		pageVo.setRows(search.getLimit());
		search.setPage(pageVo.getOffset());
		search.setLimit(pageVo.getRows());
		List<StaffInfo> list = staffInfoMapper.selectByAll(search);
		for(int i = 0; i < list.size(); i++) {
			StaffInfo staffInfo = list.get(i);
			staffInfo.setShowBirth(DateUtil.Date2Stirng(staffInfo.getStaffBirth()));
		}
		int count = staffInfoMapper.selectCount(search);
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}

}
