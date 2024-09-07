package com.javaex.vo;

public class UserVo {
   
   //필드
   private int userNo;
   private String name;
   private String id;
   private String password;
   private String adress;
   private String hp;
   private int roll;
   private String content;

   
   //생성자
   public UserVo() {
      super();
   }
   
   public UserVo(int userNo, String name, String id, String password, String adress, String hp, int roll,
         String content) {
      super();
      this.userNo = userNo;
      this.name = name;
      this.id = id;
      this.password = password;
      this.adress = adress;
      this.hp = hp;
      this.roll = roll;
      this.content = content;
   }

   
   
   //메서드 gs
   
   public int getUserNo() {
      return userNo;
   }

   public void setUserNo(int userNo) {
      this.userNo = userNo;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPassword() {
      return password;
   }

   public void setPassword(String password) {
      this.password = password;
   }

   public String getAdress() {
      return adress;
   }

   public void setAdress(String adress) {
      this.adress = adress;
   }

   public String getHp() {
      return hp;
   }

   public void setHp(String hp) {
      this.hp = hp;
   }

   public int getRoll() {
      return roll;
   }

   public void setRoll(int roll) {
      this.roll = roll;
   }

   public String getContent() {
      return content;
   }

   public void setContent(String content) {
      this.content = content;
   }

   
   
   //메서드 일반
   
   @Override
   public String toString() {
      return "UserVo [userNo=" + userNo + ", name=" + name + ", id=" + id + ", password=" + password + ", adress="
            + adress + ", hp=" + hp + ", roll=" + roll + ", content=" + content + "]";
   }
   
   

}
