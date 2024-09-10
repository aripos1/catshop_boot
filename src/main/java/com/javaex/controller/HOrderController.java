package com.javaex.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.HOrderService;
import com.javaex.service.ShoppingService;
import com.javaex.vo.ItemVo;
import com.javaex.vo.ReceiptVo;
import com.javaex.vo.ShoppingVo;
import com.javaex.vo.UserVo;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class HOrderController {

	@Autowired
	private ShoppingService shoppingService;
	@Autowired
	private HOrderService hOrderService;

	// 결제 폼 페이지
	@RequestMapping(value = "/payform", method = { RequestMethod.GET, RequestMethod.POST })
	public String processPayment(@RequestParam("shoppingNo") List<Integer> shoppingNos, HttpSession session,
			Model model) {

		// 세션에서 사용자 정보 가져오기
		UserVo buyer = (UserVo) session.getAttribute("authUser");
		if (buyer == null) {
			// 로그인이 되어 있지 않다면 로그인 페이지로 리디렉트
			return "redirect:/user/login";
		}

		// 사용자 정보 및 기본 결제 정보 설정
		int userNo = buyer.getNo();
		String address = buyer.getAddress();
		String paymentMethod = "신용카드"; // 결제 방식
		String express = "주문완료"; // 배송 상태 초기값

		// 선택한 장바구니 항목 가져오기
		List<ShoppingVo> selectedItems = shoppingService.getSelectedItems(shoppingNos, userNo);

		// 총 결제 금액 계산
		int totalAmount = selectedItems.stream().mapToInt(item -> item.getPrice() * item.getCount()).sum();

		// 결제 후 모델에 데이터 추가
		model.addAttribute("selectedItems", selectedItems);
		model.addAttribute("totalAmount", totalAmount);
		model.addAttribute("buyer", buyer);

		return "order/pay"; // 결제 폼 페이지로 이동
	}

	// 결제 완료 처리
	@RequestMapping(value = "/successpayment", method = { RequestMethod.POST })
	public String successpayment(@RequestParam("shoppingNos") List<Integer> shoppingNos, // 장바구니 상품 번호 리스트
			HttpSession session, Model model, @RequestParam("paymentMethod") String paymentMethod) {

		// 세션에서 사용자 정보 가져오기
		UserVo buyer = (UserVo) session.getAttribute("authUser");
		if (buyer == null) {
			return "redirect:/user/login"; // 세션에 유저가 없으면 로그인으로 리디렉트
		}

		int userNo = buyer.getNo();
		String address = buyer.getAddress();
		String express = "주문완료"; // 초기 배송 상태 설정
		System.out.println(userNo);
		System.out.println(buyer);
		// 선택한 장바구니 상품 정보 가져오기
		List<ShoppingVo> selectedItems = shoppingService.getSelectedItems(shoppingNos, userNo);
		System.out.println(selectedItems);
		// 총 결제 금액 계산
		int totalAmount = selectedItems.stream().mapToInt(item -> item.getPrice() * item.getCount()).sum();

		// 영수증 정보 저장
		int receiptNo = hOrderService.saveReceipt(userNo, address, totalAmount, paymentMethod, express);

		// 각 상품 정보를 영수증에 연관지어 item 테이블에 저장
		selectedItems.forEach(item -> hOrderService.saveItem(item, receiptNo));

		// 결제 성공 후의 정보 전달
		model.addAttribute("selectedItems", selectedItems);
		model.addAttribute("totalAmount", totalAmount);
		model.addAttribute("buyer", buyer);

		return "redirect:/order/orderlist"; // 결제 성공 후 리스트 페이지로 이동
	}

	
	@RequestMapping(value = "/orderlist", method = { RequestMethod.GET, RequestMethod.POST })
	public String orderList(HttpSession session, Model model) {

	    UserVo authUser = (UserVo) session.getAttribute("authUser");
	    if (authUser == null) {
	        return "redirect:/user/login"; // 로그인하지 않았으면 로그인 페이지로 리디렉트
	    }

	    int userNo = authUser.getNo(); // 로그인한 사용자의 userNo 가져오기
	    System.out.println(userNo);
	    // 해당 유저의 영수증 목록 가져오기
        
	    List<Map<String, Object>> orderItemList = hOrderService.getOrderItemsByUserNo(userNo);

        System.out.println("orderItemList"+orderItemList);
        
        model.addAttribute("orderItemList", orderItemList); // 주문 내역을 JSP로 전달

        
		return "/order/orderList";
	}

	@RequestMapping(value = "/orderdetail", method = { RequestMethod.GET, RequestMethod.POST })
	public String orderdetail(@RequestParam("receiptNo") int receiptNo, Model model) {

			    
		    List<ItemVo> orderItemList = hOrderService.getItemsByReceiptNo(receiptNo);
		    ReceiptVo receiptVo = hOrderService.getReceiptByNo(receiptNo);
		    
		    System.out.println("orderItemList"+orderItemList);
	        System.out.println("receiptVo"+receiptVo);
	        
	        model.addAttribute("orderItemList", orderItemList); // 주문 내역을 JSP로 전달
	        model.addAttribute("receiptVo", receiptVo);
		
		
		
		return "/order/orderDetail";
	}

}
