package com.javaex.vo;

public class GoodsVo {

	//필드
	private int no;
	private String category;
	private String name;
	private String content;
	private int price;
	private String regDate;
	private String saveNamef;
	private String filePathf;
	private String saveNameb;
	private String filePathb;


	

	private int userNo;

	public GoodsVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GoodsVo(int no, String category, String name, String content, int price, String regDate, String saveNamef,
			String filePathf, String saveNameb, String filePathb, int userNo) {
		super();
		this.no = no;
		this.category = category;
		this.name = name;
		this.content = content;
		this.price = price;
		this.regDate = regDate;
		this.saveNamef = saveNamef;
		this.filePathf = filePathf;
		this.saveNameb = saveNameb;
		this.filePathb = filePathb;
		this.userNo = userNo;
	}
	public int getNo() {
		return no;
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
	public String getSaveNamef() {
		return saveNamef;
	}
	public void setSaveNamef(String saveNamef) {
		this.saveNamef = saveNamef;
	}
	public String getFilePathf() {
		return filePathf;
	}
	public void setFilePathf(String filePathf) {
		this.filePathf = filePathf;
	}
	public String getSaveNameb() {
		return saveNameb;
	}
	public void setSaveNameb(String saveNameb) {
		this.saveNameb = saveNameb;
	}
	public String getFilePathb() {
		return filePathb;
	}
	public void setFilePathb(String filePathb) {
		this.filePathb = filePathb;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	@Override
	public String toString() {
		return "GoodsVo [no=" + no + ", category=" + category + ", name=" + name + ", content=" + content + ", price="
				+ price + ", regDate=" + regDate + ", saveNamef=" + saveNamef + ", filePathf=" + filePathf
				+ ", saveNameb=" + saveNameb + ", filePathb=" + filePathb + ", userNo=" + userNo + "]";
	}

}