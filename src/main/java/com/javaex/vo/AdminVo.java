package com.javaex.vo;

public class AdminVo {
   
   //필드
   private int goodsNo;
   private String category;
   private String name;
   private String content;
   private int price;
   private String regDate;
   private String taste;
   
   //생성자
   public AdminVo() {
      super();
   }
   
   public AdminVo(int goodsNo, String category, String name, String content, int price, String regDate, String taste) {
      super();
      this.goodsNo = goodsNo;
      this.category = category;
      this.name = name;
      this.content = content;
      this.price = price;
      this.regDate = regDate;
      this.taste = taste;
   }

   
   
   //메서드 gs
   
   public int getGoodsNo() {
      return goodsNo;
   }

   public void setGoodsNo(int goodsNo) {
      this.goodsNo = goodsNo;
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


   
   //메서드 일반
   
   @Override
   public String toString() {
      return "AdminVo [goodsNo=" + goodsNo + ", category=" + category + ", name=" + name + ", content=" + content
            + ", price=" + price + ", regDate=" + regDate + ", taste=" + taste + "]";
   }
   

}
