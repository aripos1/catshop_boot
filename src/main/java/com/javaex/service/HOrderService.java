package com.javaex.service;

import java.util.Date;
import java.util.HashMap;
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

	// 영수증 전체 내역 불러오기
	public List<ReceiptVo> getAllReceipts() {
		return hOrderDao.getAllReceipts();
	}

	// 배송 상태 업데이트
	public void updateExpressStatus(int receiptNo, String status) {
		hOrderDao.updateExpressStatus(receiptNo, status);
	}

	// 현재 배송 상태 가져오기
	public String getExpressStatus(int receiptNo) {
		return hOrderDao.getExpressStatus(receiptNo);
	}

	// 결제 완료 후 장바구니 전체 삭제 로직 추가
	@Transactional
	public void clearCartByUserNo(int userNo) {
		// 해당 사용자의 장바구니 전체 삭제
		shoppingDao.clearCartByUserNo(userNo);
	}

	public Map<String, Object> getOrderList(int crtPage, int userNo) {
	    int listCnt = 10; // 한 페이지당 보여줄 주문 수

	    // 현재 페이지가 1보다 작으면 1로 설정
	    crtPage = (crtPage < 1) ? 1 : crtPage;

	    // 총 주문 수 (해당 유저의 주문만 카운트)
	    int totalCnt = hOrderDao.selectTotalCnt(userNo);

	    // 시작 행 번호 계산 (0부터 시작)
	    int startRowNo = (crtPage - 1) * listCnt;

	    // 페이징 처리된 로그인한 유저의 주문 목록 가져오기
	    List<ReceiptVo> orderItemList = hOrderDao.selectList(startRowNo, listCnt, userNo);

	    // 페이징 버튼 수
	    int pageBtnCount = 5;

	    // 끝 페이지 버튼 번호 계산
	    int endPageBtnNo = (int) Math.ceil((double) crtPage / pageBtnCount) * pageBtnCount;

	    // 시작 페이지 버튼 번호 계산
	    int startPageBtnNo = endPageBtnNo - pageBtnCount + 1;

	    // 다음 버튼 표시 여부 결정
	    boolean next = endPageBtnNo * listCnt < totalCnt;

	    // 마지막 페이지 번호 수정
	    if (!next) {
	        endPageBtnNo = (int) Math.ceil((double) totalCnt / listCnt);
	    }

	    // 이전 버튼 표시 여부 결정
	    boolean prev = startPageBtnNo > 1;

	    // 페이징 데이터와 주문 목록을 담을 Map 생성
	    Map<String, Object> pMap = new HashMap<>();
	    pMap.put("orderItemList", orderItemList);
	    pMap.put("prev", prev);
	    pMap.put("next", next);
	    pMap.put("startPageBtnNo", startPageBtnNo);
	    pMap.put("endPageBtnNo", endPageBtnNo);

	    return pMap;
	}
}
