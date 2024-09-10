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
import com.javaex.vo.UserVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class PProductController {

	@Autowired
	private PProductService service;

	// 상품정보 가져오기

	// 상품상세 폼 상품 정보 가져오기
	@RequestMapping(value = "/productinfo", method = { RequestMethod.GET, RequestMethod.POST })
	public String prodinfo(@RequestParam(value = "goodsNo") int no, Model model, HttpSession session) {
		System.out.println("ProductpageController.prodinfo");

		UserVo buyer = (UserVo) session.getAttribute("authUser");

		Map<String, Object> pMap = service.exeProduct(no);
		// System.out.println("김유찬"+pMap);
		model.addAttribute("pMap", pMap);

		return "goods/product";

	}

	// 리뷰 폼
	@RequestMapping(value = "/reviewform", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewform() {
		
		return "";
	}

	// 등록
	@RequestMapping(value = "/reviewadd", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewadd(@ModelAttribute PProductVo productVo, HttpSession session) {
		System.out.println("ProductpageController.reviewadd()");

		UserVo buyer = (UserVo) session.getAttribute("authUser");

		int count = service.exeAdd(productVo);
		System.out.println(count);
		return "goods/product";
	}

}
