package com.javaex.vo;

import java.util.Date;

public class ShoppingVo {

	private int shoppingNo;
	private int userNo;
	private int goodsNo;
	private int count;
	private Date pickDate;
	private int price;
	private String taste;
	private String formattedPickDate;
	private String formattedEstimatedDeliveryDate;
	private String goodsName;
	private int optionsNo;
	private String saveNamef;

	public ShoppingVo() {
		super();
	}

	public ShoppingVo(int shoppingNo, int userNo, int goodsNo, int count, Date pickDate, int price, String taste,
			String formattedPickDate, String formattedEstimatedDeliveryDate, String goodsName, int optionsNo) {
		super();
		this.shoppingNo = shoppingNo;
		this.userNo = userNo;
		this.goodsNo = goodsNo;
		this.count = count;
		this.pickDate = pickDate;
		this.price = price;
		this.taste = taste;
		this.formattedPickDate = formattedPickDate;
		this.formattedEstimatedDeliveryDate = formattedEstimatedDeliveryDate;
		this.goodsName = goodsName;
		this.optionsNo = optionsNo;
	}

	public String getSaveNamef() {
		return saveNamef;
	}

	public void setSaveNamef(String saveNamef) {
		this.saveNamef = saveNamef;
	}

	public int getOptionsNo() {
		return optionsNo;
	}

	public void setOptionsNo(int optionsNo) {
		this.optionsNo = optionsNo;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public String getFormattedPickDate() {
		return formattedPickDate;
	}

	public void setFormattedPickDate(String formattedPickDate) {
		this.formattedPickDate = formattedPickDate;
	}

	public int getShoppingNo() {
		return shoppingNo;
	}

	public void setShoppingNo(int shoppingNo) {
		this.shoppingNo = shoppingNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getGoodsNo() {
		return goodsNo;
	}

	public void setGoodsNo(int goodsNo) {
		this.goodsNo = goodsNo;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getPickDate() {
		return pickDate;
	}

	public void setPickDate(Date pickDate) {
		this.pickDate = pickDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getTaste() {
		return taste;
	}

	public void setTaste(String taste) {
		this.taste = taste;
	}

	public String getFormattedEstimatedDeliveryDate() {
		return formattedEstimatedDeliveryDate;
	}

	public void setFormattedEstimatedDeliveryDate(String formattedEstimatedDeliveryDate) {
		this.formattedEstimatedDeliveryDate = formattedEstimatedDeliveryDate;
	}

	@Override
	public String toString() {
		return "ShoppingVo [shoppingNo=" + shoppingNo + ", userNo=" + userNo + ", goodsNo=" + goodsNo + ", count="
				+ count + ", pickDate=" + pickDate + ", price=" + price + ", taste=" + taste + ", formattedPickDate="
				+ formattedPickDate + ", formattedEstimatedDeliveryDate=" + formattedEstimatedDeliveryDate
				+ ", goodsName=" + goodsName + ", optionsNo=" + optionsNo + "]";
	}

}
