package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HShoppingController {

	  @RequestMapping(value="/shopping/form", method= {RequestMethod.GET, RequestMethod.POST})
	   public String form() {
	      
	      System.out.println("form");
	      
	      return "order/shopping";
	   }
	
	  
	  @RequestMapping(value="/shopping/test", method= {RequestMethod.GET, RequestMethod.POST})
	   public String test() {
	      
	      System.out.println("test");
	      
	      return "order/testproduct";
	   }
	  
}
