package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HAdminController {

	  @RequestMapping(value="/adminorderlist", method= {RequestMethod.GET, RequestMethod.POST})
	   public String adminorderlist() {
	      
	      System.out.println("adminorderlist");
	      
	      return "admin/adminOrderList";
	   }
}
