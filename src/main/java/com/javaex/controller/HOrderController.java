package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HOrderController {

	  @RequestMapping(value="/shopping", method= {RequestMethod.GET, RequestMethod.POST})
	   public String shopping() {
	      
	      System.out.println("shopping");
	      
	      return "order/shopping";
	   }
	
	  @RequestMapping(value="/orderdetail", method= {RequestMethod.GET, RequestMethod.POST})
	   public String orderdetail() {
	      
	      System.out.println("orderdetail");
	      
	      return "order/orderDetail";
	   }
	  @RequestMapping(value="/orderlist", method= {RequestMethod.GET, RequestMethod.POST})
	   public String orderlist() {
	      
	      System.out.println("orderlist");
	      
	      return "order/orderList";
	   }
	  @RequestMapping(value="/pay", method= {RequestMethod.GET, RequestMethod.POST})
	   public String pay() {
	      
	      System.out.println("pay");
	      
	      return "order/pay";
	   }
}
