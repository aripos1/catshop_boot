package com.javaex.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javaex.service.ShoppingService;
import com.javaex.vo.ShoppingVo;
import com.javaex.vo.UserVo;

import jakarta.servlet.http.HttpSession;

@Controller
public class HShoppingController {

	@Autowired
	private ShoppingService shoppingService;

	// 장바구니 불러오기
	@RequestMapping(value = "/shopping/form", method = { RequestMethod.GET, RequestMethod.POST })
	public String form(@ModelAttribute ShoppingVo shoppingVo, Model model, HttpSession session) {

		
		  UserVo loginUser = (UserVo) session.getAttribute("authUser");
	      int userNo = loginUser.getNo();  // 로그인한 유저의 번호
           
		// ShoppingVo에 유저 번호 설정
		shoppingVo.setUserNo(userNo);

		System.out.println("form");
		List<ShoppingVo> shoppingList = shoppingService.exeShoppingList(shoppingVo);

		model.addAttribute("shoppingList", shoppingList);
		System.out.println(shoppingList);

		return "order/shopping";
	}

	// 장바구니 상품 추가
	
	 @RequestMapping(value = "/shopping/add", method = { RequestMethod.GET, RequestMethod.POST })
	    @ResponseBody
	    public Map<String, Object> addShoppingItem(@RequestParam("productId") int productId,  // 상품 ID
	                                               @RequestParam("optionsNo") int optionsNo,  // 옵션 번호
	                                               @RequestParam("count") int count,          // 수량
	                                               @RequestParam("pickDate") String pickDate, // 담은 날짜
	                                               HttpSession session) {
	        
	        Map<String, Object> response = new HashMap<>();

	        // 세션에서 로그인된 사용자 정보 가져오기
	        UserVo loginUser = (UserVo) session.getAttribute("authUser");
	        if (loginUser == null) {
	            response.put("status", "error");
	            response.put("message", "로그인이 필요합니다.");
	            return response;
	        }
	        
	        int userNo = loginUser.getNo();  // 로그인한 유저의 번호
	        
	        // ShoppingVo에 필요한 정보 설정
	        ShoppingVo shoppingVo = new ShoppingVo();
	        shoppingVo.setUserNo(userNo);
	        shoppingVo.setGoodsNo(productId);  // 클라이언트에서 받은 상품 ID
	        shoppingVo.setOptionsNo(optionsNo);  // 클라이언트에서 받은 옵션 번호
	        shoppingVo.setCount(count);  // 클라이언트에서 받은 수량
	        shoppingVo.setPickDate(new Date());  // 클라이언트에서 받은 담은 날짜

	        // 장바구니에 항목 추가
	        try {
	            shoppingService.addShoppingItem(shoppingVo);
	            response.put("status", "success");
	            response.put("message", "상품이 장바구니에 추가되었습니다.");
	        } catch (Exception e) {
	            response.put("status", "error");
	            response.put("message", "장바구니 추가 중 오류가 발생했습니다.");
	        }

	        return response;
	    }
	


//	@RequestMapping(value = "/shopping/add", method = { RequestMethod.GET, RequestMethod.POST })
//	public String addShoppingItem(@ModelAttribute ShoppingVo shoppingVo, HttpSession session) {
//		System.out.println("add");
//		ShoppingVo shoppingVo1 = new ShoppingVo();
//		shoppingVo1.setUserNo(2);
//		shoppingVo1.setGoodsNo(3); // 임시 상품 번호
//		shoppingVo1.setCount(1); // 임시 수량
//		shoppingVo1.setOptionsNo(4);
//		System.out.println(shoppingVo1);
//
//		shoppingService.addShoppingItem(shoppingVo1);
//		return "redirect:/shopping/form"; // 장바구니 목록 페이지로 리다이렉트
//	}

	// 장바구니 상품 삭제
	@RequestMapping(value = "/shopping/delete", method = RequestMethod.POST)
	public String deleteShoppingItem(@RequestParam("shoppingNo") int shoppingNo) {
		shoppingService.deleteShoppingItem(shoppingNo);
		return "redirect:/shopping/form"; // 장바구니 목록으로 리다이렉트
	}

	// 옵션 번호와 수량을 받아 가격을 계산하는 컨트롤러 (AJAX 요청 처리)
	@PostMapping("/shopping/calculatePrice")
	@ResponseBody
	public Map<String, Object> calculatePrice(@RequestParam("optionsNo") int optionsNo,
			@RequestParam("count") int count) {
		Map<String, Object> result = new HashMap<>();
		try {
			// 옵션 번호로 가격을 조회하고 수량에 따른 총 가격 계산
			int price = shoppingService.getPriceByOptionsNo(optionsNo);
			int totalPrice = price * count;

			// 계산된 총액을 반환
			result.put("totalPrice", totalPrice);
			result.put("status", "success");
		} catch (Exception e) {
			result.put("status", "error");
			result.put("message", "가격 계산 중 오류가 발생했습니다.");
		}
		return result;
	}

	@RequestMapping(value = "/shopping/updateQuantity", method = RequestMethod.POST)
	@ResponseBody
	public String updateQuantity(@RequestParam("shoppingNo") int shoppingNo, @RequestParam("count") int count) {
		shoppingService.updateItemCount(shoppingNo, count);
		return "success";
	}
}
