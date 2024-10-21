package com.javaex.vo;

public class JSeachVo {
	
	//필드
	private String category;
	private String keyword;
	private int page;
	
	//생성자
	public JSeachVo() {
		super();
	}
	
	public JSeachVo(String category, String keyword) {
		this.category = category;
		this.keyword = keyword;
	}

	public JSeachVo(String category, String keyword, int page) {
		super();
		this.category = category;
		this.keyword = keyword;
		this.page = page;
	}

	
	//메서드 gs
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
	//메서드 일반

	@Override
	public String toString() {
		return "JSeachVo [category=" + category + ", keywore=" + keyword + ", page=" + page + "]";
	}
	
	

}
