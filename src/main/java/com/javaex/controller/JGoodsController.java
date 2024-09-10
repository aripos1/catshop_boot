package com.javaex.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.JGoodsService;
import com.javaex.vo.GoodsVo;
import com.javaex.vo.JSeachVo;





@Controller
public class JGoodsController {

	@Autowired
	private JGoodsService jgoodsService;
	
	
	//list :리스트 출력 테스트용입니다. 이거 안씁니다~~
	@RequestMapping(value="/goods/list", method= {RequestMethod.GET, RequestMethod.POST})
	public String goodsListAll(Model model) {
		System.out.println("controller j w");
		
		List<GoodsVo> goodsList = jgoodsService.exeList();
		System.out.println("controller &&"+goodsList);
		
		model.addAttribute("goodsList", goodsList);
		
		return "";
	}
	
	//list+페이징+(카테고리나누기 +검색):커리문에서 if문으로 구분
	@RequestMapping(value="/goods/list2", method= {RequestMethod.GET, RequestMethod.POST})
	public String goodsListPasing(@ModelAttribute JSeachVo jseachVo,
								  Model model) {
		System.out.println("paging j w!");
		
		
		Map<String, Object> pMap = jgoodsService.exepagingList(jseachVo);
//		System.out.println("controller pMap : "+pMap);
		model.addAttribute("pMap",pMap);
		
		
		
		return "/goods/goodslistForm";
	}
	
	
	
	
}
