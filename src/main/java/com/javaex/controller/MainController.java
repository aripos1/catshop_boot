package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.DGoodsService;
import com.javaex.vo.GoodsVo;



@Controller
public class MainController {

	@Autowired
	private DGoodsService dgoodsService;
	
	@RequestMapping(value = "/main", method = { RequestMethod.GET, RequestMethod.POST })
	public String main(Model model) {
		System.out.println("MainController.main()");
	List<GoodsVo> goodsList = dgoodsService.exemainList();
	model.addAttribute("goodsList", goodsList);
	System.out.println(goodsList);
		return "main/index";
	}
}