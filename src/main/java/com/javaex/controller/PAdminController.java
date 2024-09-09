package com.javaex.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.service.PAdminService;
import com.javaex.vo.PAdminVo;

@Controller
public class PAdminController {

	@Autowired
	private PAdminService service;
	

	// 상품등록 폼
	@RequestMapping(value = "/admin/insertform", method = { RequestMethod.GET, RequestMethod.POST })
	public String goodsInsertForm() {
		System.out.println("PAdminController.goodsInsertForm");
		return "admin/insertForm";
	}


	// 상품등록 + 사진 업로드
	@RequestMapping(value = "/admin/upload", method = { RequestMethod.GET, RequestMethod.POST })
	public String upload(@RequestParam(value = "file") MultipartFile file,
						 @RequestParam(value = "file2") MultipartFile file2,
						 @ModelAttribute PAdminVo padminvo ,Model model) {
		
		System.out.println("PAdminController.upload()");
		System.out.println(file.getOriginalFilename());
		System.out.println(file2.getOriginalFilename());
//		System.out.println("@@@@@@"+file);
//		System.out.println("@@@@@@"+file2);
//		System.out.println("@@@@@@"+padminvo);

		String saveName = service.exeupload(file,file2,padminvo);
//		model.addAttribute("saveName.", saveName);
		
		return "admin/insertForm";

	}
	

}
