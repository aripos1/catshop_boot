package com.javaex.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.JAdminService;
import com.javaex.vo.JOptionVo;
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
	@RequestMapping(value="/admin/delete",method= {RequestMethod.POST,RequestMethod.GET})
	public String deletegoods(@RequestParam("user_no") int option_no) {
		System.out.println("delete j w");
		System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"+option_no);
		jadminService.exedeletegoodsone(option_no);
		
		  
		return "redirect:/admin/JgooslistForm";
	}
	
	//option form 사용x
	@RequestMapping(value="/admin/optioninsertform",method= {RequestMethod.GET,RequestMethod.POST})
	public String optioninsertForm() {
		System.out.println("insert option form");
		
		return "/admin/optioninsertForm";  
	}
	
	
	//option insert
	@RequestMapping(value="/admin/insert",method= {RequestMethod.GET, RequestMethod.POST} )
	public String admininsertoption(@ModelAttribute JOptionVo optionVo){
		System.out.println("********************controller j w");
		
		System.out.println(optionVo);
		jadminService.exeinsertoption(optionVo);
		
		return "redirect:/admin/optionlist?goods_no="+optionVo.getGoods_no();
	}
	
	//option page list
	@RequestMapping(value="/admin/optionlist", method= {RequestMethod.GET, RequestMethod.POST})
	public String adminoptionnumlist(@RequestParam(value="goods_no") int no, Model model) {
		System.out.println("controller j w");
		System.out.println(no);
		
		List<JOptionVo> optionList = jadminService.exeoptionselectlist(no);
		
		model.addAttribute("optionList",optionList);
		System.out.println(optionList);
		return "/admin/optioninsertForm";
	}
	
	
	
	
}
