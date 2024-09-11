package com.javaex.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.HAdminService;
import com.javaex.service.HOrderService;
import com.javaex.vo.ReceiptVo;

@Controller
public class HAdminController {

	@Autowired
	private HOrderService hOrderService;
	@Autowired
	private HAdminService hAdminService;

	// 관리자의 주문 목록 페이지
	@RequestMapping(value = "/adminorderlist", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminOrderList(@RequestParam(value = "crtpage", required = false, defaultValue = "1") int crtPage,
	        Model model) {
	    // 페이징된 영수증 목록 불러오기
	    Map<String, Object> pMap = hAdminService.exeList(crtPage);
	    
	    // 영수증 목록과 페이징 데이터를 모델에 추가
	    model.addAttribute("receiptList", pMap.get("adminOrderList"));
	    model.addAttribute("prev", pMap.get("prev"));
	    model.addAttribute("next", pMap.get("next"));
	    model.addAttribute("startPageBtnNo", pMap.get("startPageBtnNo"));
	    model.addAttribute("endPageBtnNo", pMap.get("endPageBtnNo"));
	    
	    return "admin/adminOrderList"; // adminOrderList.jsp로 이동
	}

	@ResponseBody
	@RequestMapping(value = "/startdelivery", method = { RequestMethod.GET, RequestMethod.POST })
	public Map<String, String> startDelivery(@RequestParam("receiptNo") int receiptNo) {
		// 배송 상태를 '배송중'으로 변경
		hOrderService.updateExpressStatus(receiptNo, "배송중");

		// JSON 형식으로 성공 응답 반환
		Map<String, String> response = new HashMap<>();
		response.put("status", "success");

		return response; // JSON 응답으로 반환
	}

}
