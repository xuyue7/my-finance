package com.doing.src.entity;

public class Search {

	private Integer page;
	
	private Integer limit;
	
	private String queryContent;

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}


	public String getQueryContent() {
		return queryContent;
	}

	public void setQueryContent(String queryContent) {
		this.queryContent = queryContent;
	}
	
	
}
