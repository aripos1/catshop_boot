package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.ItemVo;
import com.javaex.vo.ReceiptVo;
import com.javaex.vo.ShoppingVo;
import com.javaex.vo.UserVo;

@Repository
public class HOrderDao {

    @Autowired
    private SqlSession sqlSession;

    // 유저의 장바구니에서 선택한 항목만 가져옴
    public List<ShoppingVo> getSelectedShoppingItems(Map<String, Object> params) {
        return sqlSession.selectList("shopping.selectSelectedItems", params);
    }

    // 유저 정보 조회
    public UserVo getUserOne(UserVo userVo) {
        return sqlSession.selectOne("user.selectOne", userVo);
    }
    
    // 영수증 정보 저장
    public void insertReceipt(ReceiptVo receiptVo) {
        sqlSession.insert("order.insertReceipt", receiptVo);
    }

    // 상품 정보 저장
    public void insertItem(ItemVo itemVo) {
        sqlSession.insert("order.insertItem", itemVo);
    }
    
    public List<Map<String, Object>> getOrderItemsByUserNo(int userNo) {
        return sqlSession.selectList("order.getOrderItemsByUserNo", userNo);
    }
    // 영수증 번호에 해당하는 상품 목록 가져오기
    public List<ItemVo> getItemsByReceiptNo(int receiptNo) {
        return sqlSession.selectList("order.getItemsByReceiptNo", receiptNo);
    }

    // 영수증 정보 가져오기
    public ReceiptVo getReceiptByNo(int receiptNo) {
        return sqlSession.selectOne("order.getReceiptByNo", receiptNo);
    }
    
    // 영수증 전체 내역 불러오기
    public List<ReceiptVo> getAllReceipts() {
        return sqlSession.selectList("order.getAllReceipts");
    }

    // 배송 상태 업데이트
    public void updateExpressStatus(int receiptNo, String status) {
        Map<String, Object> params = new HashMap<>();
        params.put("receiptNo", receiptNo);
        params.put("status", status);

		sqlSession.update("order.updateExpressStatus", params);
    }

    // 현재 배송 상태 가져오기
    public String getExpressStatus(int receiptNo) {
        return sqlSession.selectOne("order.getExpressStatus", receiptNo);
    }
    
    // 로그인한 유저의 페이징된 영수증 목록 가져오기
    public List<ReceiptVo> selectList(int startRowNo, int listCnt, int userNo) {
        Map<String, Object> map = new HashMap<>();
        map.put("startRowNo", startRowNo);
        map.put("listCnt", listCnt);
        map.put("userNo", userNo);
        return sqlSession.selectList("order.selectOrderListByUser", map);
    }

    // 로그인한 유저의 총 영수증 수 가져오기
    public int selectTotalCnt(int userNo) {
        return sqlSession.selectOne("order.selectTotalCntByUser", userNo);
    }
}
