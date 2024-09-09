package com.javaex.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.JAdminService;
import com.javaex.vo.JSeachVo;
import com.javaex.vo.UserVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class JAdminCotroller {
	
	@Autowired
	private JAdminService jadminService;
	
	
	//list + serch + paging + session(임시)
	@RequestMapping(value="/admin/list2", method= {RequestMethod.GET, RequestMethod.POST})
	public String adminSelectListAll(HttpSession session, Model model,@ModelAttribute JSeachVo jseachVo){
		System.out.println("adminList j w");
		
		//임시 session no값 넣어주기
		UserVo row = new UserVo();
		row.setRoll(1);
		
		session.setAttribute("no", row);
//		System.out.println("row@@@@@@@@@@@############# : "+row);
		
		//리스트 가져오기
		Map<String,Object> jmap = jadminService.exeselectgoodslist2(jseachVo);
		System.out.println("왔니?? 왔어???? 진짜????????"+jmap);
		
		model.addAttribute("jmap",jmap);
		
		return "/admin/JgoodslistFrom";
	}
	
	//delete
	
	
	
	//수정
	
	
}
