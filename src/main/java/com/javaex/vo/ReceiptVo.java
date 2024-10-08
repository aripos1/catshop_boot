package com.javaex.vo;

import java.util.Date;

public class ReceiptVo {

	private int no;
	private int userNo;
	private String express;
	private String address;
	private int totalPrice;
	private Date paymentDate;
	private String payment;
	private String userName;
	private String userHp;
	private String goodsName;
	private String taste;
	
	public ReceiptVo() {
		super();
	}

	public ReceiptVo(int no, int userNo, String express, String address, int totalPrice, Date paymentDate,
			String payment, String userName, String userHp) {
		super();
		this.no = no;
		this.userNo = userNo;
		this.express = express;
		this.address = address;
		this.totalPrice = totalPrice;
		this.paymentDate = paymentDate;
		this.payment = payment;
		this.userName = userName;
		this.userHp = userHp;
	}

	
	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getTaste() {
		return taste;
	}

	public void setTaste(String taste) {
		this.taste = taste;
	}

	public String getUserHp() {
		return userHp;
	}

	public void setUserHp(String userHp) {
		this.userHp = userHp;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getExpress() {
		return express;
	}

	public void setExpress(String express) {
		this.express = express;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public Date getPaymentDate() {
		return paymentDate;
	}

	public void setPaymentDate(Date paymentDate) {
		this.paymentDate = paymentDate;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	@Override
	public String toString() {
		return "ReceiptVo [no=" + no + ", userNo=" + userNo + ", express=" + express + ", address=" + address
				+ ", totalPrice=" + totalPrice + ", paymentDate=" + paymentDate + ", payment=" + payment + "]";
	}

}
