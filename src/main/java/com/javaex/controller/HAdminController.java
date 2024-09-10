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

import com.javaex.service.HOrderService;
import com.javaex.vo.ReceiptVo;

@Controller
public class HAdminController {

	@Autowired
	private HOrderService hOrderService;

	// 관리자의 주문 목록 페이지
	@RequestMapping(value = "/adminorderlist", method = { RequestMethod.GET, RequestMethod.POST })
	public String adminOrderList(Model model) {
		// 영수증 전체 내역 불러오기
		List<ReceiptVo> receiptList = hOrderService.getAllReceipts();
		System.out.println(receiptList);
		// 모델에 데이터를 추가하여 JSP에 전달
		model.addAttribute("receiptList", receiptList);

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

        return response;  // JSON 응답으로 반환
    }
}
