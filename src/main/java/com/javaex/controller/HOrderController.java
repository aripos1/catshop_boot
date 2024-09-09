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

import com.javaex.service.ShoppingService;
import com.javaex.vo.ShoppingVo;
import com.javaex.vo.UserVo;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/order")
public class HOrderController {

	@Autowired
	private ShoppingService shoppingService;

    @RequestMapping(value = "/payform", method = { RequestMethod.GET, RequestMethod.POST })
    public String processPayment(@RequestParam("shoppingNo") int shoppingNo, // 선택한 장바구니 항목
                                 HttpSession session, Model model) {

        // 세션에서 사용자 정보 가져오기
        UserVo buyer = (UserVo) session.getAttribute("authUser");
        if (buyer == null) {
            // 세션에 사용자 정보가 없으면 임시로 하드코딩된 사용자 정보 설정
            buyer = new UserVo();
            buyer.setName("임현성");
            buyer.setHp("010-1234-5678");
            buyer.setAddress("서울특별시 강남구 테헤란로 123");
            buyer.setNo(1);
            session.setAttribute("authUser", buyer);
        }

        // 파라미터 설정
        Map<String, Object> params = new HashMap<>();
        params.put("shoppingNo", shoppingNo);
        params.put("userNo", buyer.getNo());

        // 선택된 장바구니 항목 가져오기
        List<ShoppingVo> selectedShoppingList = shoppingService.getSelectedShoppingItems(params);

        // 총 결제 금액 계산
        int totalAmount = selectedShoppingList.stream()
                                              .mapToInt(item -> item.getPrice() * item.getCount())
                                              .sum();

        // 모델에 데이터 전달
        model.addAttribute("selectedShoppingList", selectedShoppingList);
        model.addAttribute("totalAmount", totalAmount);
        model.addAttribute("buyer", buyer);

        return "order/pay"; // 결제 페이지로 이동
	}
}
