package com.javaex.service;

import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.ShoppingDao;
import com.javaex.vo.ShoppingVo;

@Service
public class ShoppingService {

	@Autowired
	private ShoppingDao shoppingDao;

	private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("MM/dd");

	// pickDate에 2일을 더한 값을 계산하는 메서드
	public String getFormattedPickDatePlusTwoDays(Date pickDate) {
		LocalDate localPickDate = pickDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
		LocalDate newDate = localPickDate.plusDays(2);
		return newDate.format(FORMATTER);
	}

	public List<ShoppingVo> exeShoppingList(ShoppingVo userNo) {
		List<ShoppingVo> shoppingList = shoppingDao.getShoppingList(userNo);

		// 장바구니 담은 날짜와 배송 예정일 계산
		for (ShoppingVo item : shoppingList) {
			LocalDate pickDate = item.getPickDate().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
			item.setFormattedPickDate(pickDate.format(FORMATTER));
			item.setFormattedEstimatedDeliveryDate(getFormattedPickDatePlusTwoDays(item.getPickDate()));
		}

		return shoppingList;
	}

	// 장바구니에 상품 추가
	public int addShoppingItem(ShoppingVo shoppingVo) {
		shoppingVo.setPickDate(new Date()); // 상품을 장바구니에 담은 날짜 설정
		return shoppingDao.addShoppingItem(shoppingVo);
	}

	// 장바구니에 상품 삭제
	public int deleteShoppingItem(int shoppingNo) {
		return shoppingDao.deleteShoppingItem(shoppingNo);
	}

	// 선택된 상품의 정보를 가져오는 메서드
	public List<ShoppingVo> getShoppingItemsWithConditions(Map<String, Object> params) {
		List<ShoppingVo> ShoppingVo = shoppingDao.getShoppingItemsWithConditions(params);
		return ShoppingVo;
	}

	// 총 결제 금액 계산
	public int calculateTotalAmount(List<ShoppingVo> shoppingList) {
		int totalAmount = 0;
		for (ShoppingVo item : shoppingList) {
			totalAmount += item.getPrice() * item.getCount();
		}
		return totalAmount;
	}

	// 옵션 번호로 상품 가격 조회
	public int getPriceByOptionsNo(int optionsNo) {
		return shoppingDao.getPriceByOptionsNo(optionsNo); // DAO에서 가격을 가져오는 메서드 호출
	}

    // 선택된 상품 정보 가져오기
    public List<ShoppingVo> getSelectedItems(List<Integer> shoppingNos, int userNo) {
        return shoppingDao.getSelectedItems(shoppingNos, userNo);
    }
    // 수량 업데이트 메서드
    public void updateItemCount(int shoppingNo, int count) {
        shoppingDao.updateItemCount(shoppingNo, count);
    }
}
