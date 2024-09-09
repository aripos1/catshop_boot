package com.javaex.vo;

import java.util.Date;

public class ReceiptVo {

	private int receiptNo;
	private int userNo;
	private String exp;
	private String address;
	private int totalPrice;
	private Date paymentDate;
	private String payment;

	public ReceiptVo() {
		super();
	}

	public ReceiptVo(int receiptNo, int userNo, String exp, String address, int totalPrice, Date paymentDate,
			String payment) {
		super();
		this.receiptNo = receiptNo;
		this.userNo = userNo;
		this.exp = exp;
		this.address = address;
		this.totalPrice = totalPrice;
		this.paymentDate = paymentDate;
		this.payment = payment;
	}

	public int getReceiptNo() {
		return receiptNo;
	}

	public void setReceiptNo(int receiptNo) {
		this.receiptNo = receiptNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getExp() {
		return exp;
	}

	public void setExp(String exp) {
		this.exp = exp;
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
		return "receiptVo [receiptNo=" + receiptNo + ", userNo=" + userNo + ", exp=" + exp + ", address=" + address
				+ ", totalPrice=" + totalPrice + ", paymentDate=" + paymentDate + ", payment=" + payment + "]";
	}

}
