package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.JGoodsService;
import com.javaex.vo.GoodsVo;

@Controller
public class JGoodsController {

	@Autowired
	private JGoodsService jgoodsService;
	
	
	//list
	@RequestMapping(value="/goods/list", method= {RequestMethod.GET, RequestMethod.POST})
	public String goodsListAll() {
		System.out.println("controller j w");
		
		List<GoodsVo> goodsList = jgoodsService.exeList();
		System.out.println("controller &&"+goodsList);
		
		return "/goods/goodslistForm";
	}
	
}
