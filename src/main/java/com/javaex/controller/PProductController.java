package com.javaex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.PProductService;
import com.javaex.vo.PProductVo;

@Controller
public class PProductController {

	@Autowired
	private PProductService service;

	// 상품정보 가져오기

	// 상품상세 폼 상품 정보 가져오기
	@RequestMapping(value = "/productinfo", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodinfo(@RequestParam(value = "goodsNo") int no, Model model) {
		System.out.println("ProductpageController.prodinfo");
		
		Map<String, Object> pMap = service.exeProduct(no);
		//System.out.println("김유찬"+pMap);
		model.addAttribute("pMap", pMap);
		
		return "goods/product";
		
	}


	// 등록
	@RequestMapping(value = "/reviewadd", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewadd(@ModelAttribute PProductVo productVo) {
		System.out.println("ProductpageController.reviewadd()");

		int count = service.exeAdd(productVo);
		System.out.println(count);
		return "redirect:/goods/product";
	}

}
