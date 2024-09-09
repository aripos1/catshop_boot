package com.javaex.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.javaex.service.HOrderService;
import com.javaex.service.ShoppingService;
import com.javaex.vo.ShoppingVo;
import com.javaex.vo.UserVo;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class HOrderController {

	@Autowired
	private ShoppingService shoppingService;
	private HOrderService hOrderService;
	
    @RequestMapping(value = "/payform", method = { RequestMethod.GET, RequestMethod.POST })
    public String processPayment(@RequestParam("shoppingNo") List<Integer> shoppingNos, // 선택한 장바구니 항목
                                 HttpSession session, Model model) {

        // 세션에서 사용자 정보 가져오기
        UserVo buyer = (UserVo) session.getAttribute("authUser");
        
        System.out.println(buyer);
        int userNo = buyer.getNo();
        String address = buyer.getAddress();  // 사용자의 주소
        String paymentMethod = "신용카드";  // 예시로 결제 수단 하드코딩. 실제로는 프론트엔드에서 가져와야 함
    
        // 파라미터 설정
        List<ShoppingVo> selectedItems = shoppingService.getSelectedItems(shoppingNos, userNo);
        int totalAmount = selectedItems.stream().mapToInt(item -> item.getPrice() * item.getCount()).sum();
      
     // 각 항목을 처리하는 로직
        int receiptNo = hOrderService.saveReceipt(userNo, address, totalAmount, paymentMethod);
        
        // 개별 아이템 저장 처리
        selectedItems.forEach(item -> {
            // 각 아이템을 영수증과 연계하여 DB에 저장
        	hOrderService.saveItem(item, receiptNo);
        });
        
        
        model.addAttribute("selectedItems", selectedItems);
        model.addAttribute("totalAmount", totalAmount);
        model.addAttribute("buyer", buyer);

        return "order/pay"; // 결제 페이지로 이동
	}
    
   
    
    @RequestMapping(value = "/orderlist", method = { RequestMethod.GET, RequestMethod.POST })
    public String orderlist() {
    	
    	return "/order/orderList";
    }
    
    @RequestMapping(value = "/orderdetail", method = { RequestMethod.GET, RequestMethod.POST })
    public String orderdetail() {
    	
    	return "/order/orderDetail";
    }
    
    
    
    
}
