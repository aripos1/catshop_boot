package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javaex.service.DUserService;
import com.javaex.vo.UserVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class DUserController {

	@Autowired
	private DUserService duserService;

	/* 회원가입 폼 */
	@RequestMapping(value = "/user/joinform", method = { RequestMethod.GET, RequestMethod.POST })
	public String joinForm() {
		System.out.println("UserController.joinForm()");
		return "user/joinForm";
	}

	/* 회원가입 */
	@RequestMapping(value="/user/join", method= {RequestMethod.GET, RequestMethod.POST})
	public String join(@ModelAttribute UserVo userVo) {
		System.out.println("UserController.join()");
		
		duserService.exeJoin(userVo);
		
		return "user/joinOk";
	}
	/*로그인폼*/
	@RequestMapping(value ="/user/loginform", method = {RequestMethod.GET,RequestMethod.POST})
	public String loginForm() {
		System.out.println("UserController.loginForm()");
	
		return "user/loginForm";
	}
	
	
	
		/* 로그인 */
	@RequestMapping(value ="/user/login", method = {RequestMethod.GET,RequestMethod.POST})
	public String login(@ModelAttribute UserVo userVo, HttpSession session) {
		System.out.println("UserController.login()");
		
		UserVo authUser=duserService.exeLogin(userVo);
		System.out.println(authUser);
		
		session.setAttribute("authUser", authUser);
		
		return "redirect:/main";
}
	/*로그아웃*/
	@RequestMapping(value="/user/logout",method= {RequestMethod.GET, RequestMethod.POST})
	public String logout(HttpSession session) {
		System.out.println("UserController.logout");
		
		session.invalidate();
		return "redirect:/main";
		}

	/* 수정폼*/
	@RequestMapping(value="/user/updateform",method= {RequestMethod.GET, RequestMethod.POST})
	public String updateForm(@ModelAttribute UserVo userVo, HttpSession session, Model model) {
		System.out.println("UserController.updateform");
		
		UserVo authUser = (UserVo) session.getAttribute("authUser");
		
		int no = authUser.getNo();
		
		UserVo updateUser = duserService.exeupdateForm(no);
		
		model.addAttribute("UpdateUser", updateUser);
	
		return"/user/updateForm";
	}

	/*수정*/
	@RequestMapping(value="user/update", method= {RequestMethod.GET, RequestMethod.POST})
	public String update(@ModelAttribute UserVo userVo, HttpSession session) {
		System.out.println("UserController.update");
		
		UserVo authUser = (UserVo)session.getAttribute("authUser");
		int no=authUser.getNo();
		System.out.println(no);
		userVo.setNo(no);
		System.out.println(userVo);
		
		duserService.exeUpdate(userVo);
		authUser.setName(userVo.getName());
		
			 return"redirect:/main";
	}
	
}
