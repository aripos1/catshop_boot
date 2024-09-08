package com.javaex.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.PProductService;

@Controller
public class PProductController {
	
//	@Autowired
	private PProductService service;
	
	//상품정보 가져오기
	@RequestMapping(value = "/productinfo", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodinfo() {
		System.out.println("ProductpageController.prodinfo");
		
		return "goods/product";
	}

}
