package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.DUserService;
import com.javaex.vo.UserVo;


@Controller
public class DUserController {
	
	@Autowired
	private DUserService duserService;
	
	/*회원가입 폼*/
	@RequestMapping(value="/user/joinform",method = {RequestMethod.GET, RequestMethod.POST})
	public String joinForm() {
		System.out.println("UserController.joinForm()");
		return "user/joinForm";
	}
	
	
	/*회원가입*/
	@RequestMapping(value="/user/join", method= {RequestMethod.GET, RequestMethod.POST})
	public String join(@ModelAttribute UserVo userVo) {
		System.out.println("UserController.join()");
		
		duserService.exeJoin(userVo);
		
		return "";
	/*아이디체크*/
	
	
	}
}
