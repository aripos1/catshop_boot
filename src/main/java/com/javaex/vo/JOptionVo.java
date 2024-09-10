package com.javaex.vo;

public class JOptionVo {
	
	//필드
	private int no;
	private String taste;
	private int goods_no;

	
	//생성자
	
	public JOptionVo() {
		super();
	}
	
	public JOptionVo(int goods_no, String taste) {
		this.goods_no = goods_no;
		this.taste = taste;
	}
	
	public JOptionVo(int no, String taste, int goods_no) {
		super();
		this.no = no;
		this.taste = taste;
		this.goods_no = goods_no;
	}
	//메서드 gs

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTaste() {
		return taste;
	}

	public void setTaste(String taste) {
		this.taste = taste;
	}

	public int getGoods_no() {
		return goods_no;
	}

	public void setGoods_no(int goods_no) {
		this.goods_no = goods_no;
	}

	
	
	//메서드 일반
	@Override
	public String toString() {
		return "JOptionVo [no=" + no + ", taste=" + taste + ", goods_no=" + goods_no + "]";
	}
	
	

}
