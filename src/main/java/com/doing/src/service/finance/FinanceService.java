package com.doing.src.service.finance;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doing.common.util.DateUtil;
import com.doing.common.vo.PageVo;
import com.doing.src.dao.credential.FinanceSubjectMapper;
import com.doing.src.entity.Search;
import com.doing.src.entity.credential.FinanceSubject;

@Service("financeService")
public class FinanceService {

	@Autowired
	private FinanceSubjectMapper financeSubjectMapper;
	
	public PageVo<FinanceSubject> selectFinanceAll(Search search) {
		// TODO Auto-generated method stub
		PageVo<FinanceSubject> pageVo = new PageVo<>(search.getPage());
		pageVo.setRows(search.getLimit());
		search.setPage(pageVo.getOffset());
		search.setLimit(pageVo.getRows());
		List<FinanceSubject> list = financeSubjectMapper.selectAll(search);
		for(int i = 0; i < list.size();i++) {
			FinanceSubject financeSubject = list.get(i);
			financeSubject.setShowDate(DateUtil.Date2Stirng2Second(financeSubject.getSubjectDt()));
		}
		int count = financeSubjectMapper.selectBySearchCount(search);
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}

}
