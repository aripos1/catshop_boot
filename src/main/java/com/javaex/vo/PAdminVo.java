package com.javaex.vo;

public class PAdminVo {

	// 필드
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
	
	

	// 생성자

	public PAdminVo() {
	}


	public PAdminVo(int no, String category, String name, String content, int price, String regDate, String saveNamef,
			String filePathf, String saveNameb, String filePathb) {
		
		this.category = category;
		this.name = name;
		this.content = content;
		this.price = price;
		this.regDate = regDate;
		this.saveNamef = saveNamef;
		this.filePathf = filePathf;
		this.saveNameb = saveNameb;
		this.filePathb = filePathb;
	}

	// 메서드gs

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

	public void setFilePathf(String filePath) {
		this.filePathf = filePath;
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


	@Override
	public String toString() {
		return "PAdminVo [no=" + no + ", category=" + category + ", name=" + name + ", content=" + content + ", price="
				+ price + ", regDate=" + regDate + ", saveNamef=" + saveNamef + ", filePathf="
				+ filePathf + ", saveNameb=" + saveNameb + ", filePathb=" + filePathb + "]";
	}


}
