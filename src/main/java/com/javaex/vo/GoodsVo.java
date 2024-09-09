package com.javaex.vo;

public class GoodsVo {

	//필드
	private int no;
	private String category;
	private String name;
	private String content;
	private int price;
	private String regDate;
	private String taste;
	private String saveName;
	private String filePath;
	private String keyword;
	

	//생성자
		
	public GoodsVo() {
		
	}
	
	public GoodsVo(String category, String keyword) {
		this.category = category;
		this.keyword = keyword;
	}
	
	public GoodsVo(int no, String category, String name, String content, int price, String regDate, String taste,
			String saveName, String filePath) {
		super();
		this.no = no;
		this.category = category;
		this.name = name;
		this.content = content;
		this.price = price;
		this.regDate = regDate;
		this.taste = taste;
		this.saveName = saveName;
		this.filePath = filePath;
	}

		
	//메서드gs
	
	
	
	public int getNo() {
		return no;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getTaste() {
		return taste;
	}

	public void setTaste(String taste) {
		this.taste = taste;
	}

	public String getSaveName() {
		return saveName;
	}

	public void setSaveName(String saveName) {
		this.saveName = saveName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	

	
	//메서드 일반
	@Override
	public String toString() {
		return "GoodsVo [no=" + no + ", category=" + category + ", name=" + name + ", content=" + content + ", price="
				+ price + ", regDate=" + regDate + ", taste=" + taste + ", saveName=" + saveName + ", filePath="
				+ filePath + ", keyword=" + keyword + "]";
	}

	
}