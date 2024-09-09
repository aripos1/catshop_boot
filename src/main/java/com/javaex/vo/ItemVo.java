package com.javaex.vo;

public class ItemVo {

	private int no;
	private int amount;
	private int eachPrice;
	private String taste;
	private int optionsNo;
	private int receiptNo;

	public ItemVo() {
		super();
	}


	public ItemVo(int no, int amount, int eachPrice, String taste, int optionsNo, int receiptNo) {
		super();
		this.no = no;
		this.amount = amount;
		this.eachPrice = eachPrice;
		this.taste = taste;
		this.optionsNo = optionsNo;
		this.receiptNo = receiptNo;
	}

	

	public int getNo() {
		return no;
	}


	public void setNo(int no) {
		this.no = no;
	}


	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getEachPrice() {
		return eachPrice;
	}

	public void setEachPrice(int eachPrice) {
		this.eachPrice = eachPrice;
	}

	public String getTaste() {
		return taste;
	}

	public void setTaste(String taste) {
		this.taste = taste;
	}

	public int getOptionsNo() {
		return optionsNo;
	}

	public void setOptionsNo(int optionsNo) {
		this.optionsNo = optionsNo;
	}

	public int getReceiptNo() {
		return receiptNo;
	}

	public void setReceiptNo(int receiptNo) {
		this.receiptNo = receiptNo;
	}


	@Override
	public String toString() {
		return "ItemVo [no=" + no + ", amount=" + amount + ", eachPrice=" + eachPrice + ", taste=" + taste
				+ ", optionsNo=" + optionsNo + ", receiptNo=" + receiptNo + "]";
	}


}
