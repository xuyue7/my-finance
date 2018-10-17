package com.doing.src.service.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doing.common.util.DateUtil;
import com.doing.common.vo.PageVo;
import com.doing.src.dao.system.SystemRecordMapper;
import com.doing.src.entity.Search;
import com.doing.src.entity.system.SystemRecord;

@Service("systemService")
public class SystemService {

	@Autowired
	private SystemRecordMapper systemRecordMapper;
	
	public PageVo<SystemRecord> selectSystemRecord(Search search) {
		// TODO Auto-generated method stub
		PageVo<SystemRecord> pageVo = new PageVo<>(search.getPage());
		pageVo.setRows(search.getLimit());
		Search querySearch = new Search();
		querySearch.setPage(pageVo.getOffset());
		querySearch.setLimit(pageVo.getRows());
		List<SystemRecord> list = systemRecordMapper.selectSystemRecordAll(querySearch);
		for(int i = 0;i < list.size();i++) {
			SystemRecord systemRecord = list.get(i);
			if (search.getQueryContent() != null && search.getQueryContent() != "") {
				// 修改搜索关键字颜色
				String content = search.getQueryContent();
				String style = "<span style='color: #ff0000'>" + content+ "</span>";
				String str1 = systemRecord.getAdminId().replace(content, style);
				systemRecord.setAdminId(str1);
			}
			//时间转换
			String showTime = DateUtil.Date2Stirng2Second(systemRecord.getRecordDt());
			systemRecord.setShowTime(showTime);
		}
		int count = systemRecordMapper.findCount();
		pageVo.setList(list);
		pageVo.setCount(count);
		return pageVo;
	}

}
