package com.javaex.dao;

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
}
