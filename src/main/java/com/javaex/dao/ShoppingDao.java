package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.ShoppingVo;

@Repository
public class ShoppingDao {

	@Autowired
	private SqlSession sqlSession;
	
	 // 유저 ID로 장바구니 항목 가져오기
    public ShoppingVo getShoppingOne(ShoppingVo shoppingVo) {
    	ShoppingVo shoppingOne  = sqlSession.selectOne("shopping.selectOne",shoppingVo);
    			
        return shoppingOne;
    }
	
	
	
	
}
