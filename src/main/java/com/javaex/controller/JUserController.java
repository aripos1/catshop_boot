package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.JUserService;

@Controller
public class JUserController {

	private JUserService juserService;
	
	// 리스트 출력준비
	@RequestMapping(value="/user/list", method= {RequestMethod.GET, RequestMethod.POST})
	public String list() {
		System.out.println("list j w");
		
		
		
		
		return "";
	}
}
