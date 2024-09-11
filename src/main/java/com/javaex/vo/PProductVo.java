package com.javaex.vo;

public class PProductVo {

	// 필드
	// 굿즈
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

	// 옵션
	private int optionsNo;
	private String taste;

	// 리뷰
	private int r_no;
	private String r_name;
	private int user_no;
	private int item_no;
	private String review_date;
	private String r_content;
	private int point;


	
	public PProductVo() {
		super();
	}

	public PProductVo(int no, String category, String name, String content, int price, String regDate, String saveNamef,
			String filePathf, String saveNameb, String filePathb, int optionsNo, String taste, int r_no, String r_name,
			int user_no, int item_no, String review_date, String r_content, int point) {
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
		this.optionsNo = optionsNo;
		this.taste = taste;
		this.r_no = r_no;
		this.r_name = r_name;
		this.user_no = user_no;
		this.item_no = item_no;
		this.review_date = review_date;
		this.r_content = r_content;
		this.point = point;
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

	public int getOptionsNo() {
		return optionsNo;
	}

	public void setOptionsNo(int optionsNo) {
		this.optionsNo = optionsNo;
	}

	public String getTaste() {
		return taste;
	}

	public void setTaste(String taste) {
		this.taste = taste;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getItem_no() {
		return item_no;
	}

	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}

	public String getReview_date() {
		return review_date;
	}

	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}

	public String getR_content() {
		return r_content;
	}

	public void setR_content(String r_content) {
		this.r_content = r_content;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
	
	

	@Override
	public String toString() {
		return "PProductVo [no=" + no + ", category=" + category + ", name=" + name + ", content=" + content
				+ ", price=" + price + ", regDate=" + regDate + ", saveNamef=" + saveNamef + ", filePathf=" + filePathf
				+ ", saveNameb=" + saveNameb + ", filePathb=" + filePathb + ", optionsNo=" + optionsNo + ", taste="
				+ taste + ", r_no=" + r_no + ", r_name=" + r_name + ", user_no=" + user_no + ", item_no=" + item_no
				+ ", review_date=" + review_date + ", r_content=" + r_content + ", point=" + point + "]";
	}
	
	

}
