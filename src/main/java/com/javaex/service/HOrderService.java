package com.javaex.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.javaex.dao.HOrderDao;
import com.javaex.dao.ShoppingDao;
import com.javaex.vo.ItemVo;
import com.javaex.vo.ReceiptVo;
import com.javaex.vo.ShoppingVo;
import com.javaex.vo.UserVo;

@Service
public class HOrderService {

	@Autowired
	private HOrderDao hOrderDao;

	@Autowired
	private ShoppingDao shoppingDao;

	public List<ShoppingVo> getSelectedShoppingItems(Map<String, Object> params) {
		return hOrderDao.getSelectedShoppingItems(params);
	}

	public UserVo exeUserOne(UserVo userVo) {
		return hOrderDao.getUserOne(userVo);
	}

	// 영수증 저장 (receipt 테이블에 저장)
	@Transactional
	public int saveReceipt(int userNo, String address, int totalPrice, String paymentMethod, String express) {
		ReceiptVo receiptVo = new ReceiptVo();
		receiptVo.setUserNo(userNo);
		receiptVo.setAddress(address);
		receiptVo.setTotalPrice(totalPrice);
		receiptVo.setPayment(paymentMethod);
		receiptVo.setPaymentDate(new Date());
		receiptVo.setExpress(express); // 배송 상태 초기값
		System.out.println(receiptVo);
		hOrderDao.insertReceipt(receiptVo);
		System.out.println(receiptVo);
		return receiptVo.getNo(); // 저장된 영수증 번호 반환
	}

	// 상품 저장 (item 테이블에 저장)
	@Transactional
	public void saveItem(ShoppingVo item, int receiptNo) {
		ItemVo itemVo = new ItemVo();
		itemVo.setReceiptNo(receiptNo);
		itemVo.setAmount(item.getCount());
		itemVo.setEachPrice(item.getPrice());
		itemVo.setTaste(item.getTaste());
		itemVo.setOptionsNo(item.getOptionsNo());
		System.out.println(itemVo);
		hOrderDao.insertItem(itemVo);
	}

	   public List<Map<String, Object>> getOrderItemsByUserNo(int userNo) {
	        // 쿼리 결과를 가져옴 (Map으로 반환)
		   
	        List<Map<String, Object>> orderItemList = hOrderDao.getOrderItemsByUserNo(userNo);
	        
	        return orderItemList;
	   }
	    // 영수증 번호에 해당하는 상품 목록 가져오기
	    public List<ItemVo> getItemsByReceiptNo(int receiptNo) {
	        return hOrderDao.getItemsByReceiptNo(receiptNo);
	    }

	    // 영수증 정보 가져오기
	    public ReceiptVo getReceiptByNo(int receiptNo) {
	        return hOrderDao.getReceiptByNo(receiptNo);
	    }

}
