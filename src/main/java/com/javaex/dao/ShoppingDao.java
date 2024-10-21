package com.javaex.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.ShoppingVo;

@Repository
public class ShoppingDao {

	@Autowired
	private SqlSession sqlSession;

	// 유저 ID로 장바구니 항목 가져오기
	public List<ShoppingVo> getShoppingList(ShoppingVo userNo) {
		List<ShoppingVo> shoppingList = sqlSession.selectList("shopping.selectList", userNo);

		return shoppingList;
	}

	// 장바구니 추가
	public int addShoppingItem(ShoppingVo shoppingVo) {
		return sqlSession.insert("shopping.addShoppingItem", shoppingVo);
	}

	// 장바구니 리스트 삭제
	public int deleteShoppingItem(int shoppingNo) {
		return sqlSession.delete("shopping.deleteShoppingItem", shoppingNo);
	}

	public List<ShoppingVo> getShoppingItemsWithConditions(Map<String, Object> params) {
		return sqlSession.selectList("shopping.selectShoppingItemsWithMap", params);
	}

	// 옵션 번호로 가격 가져오기
	public int getPriceByOptionsNo(int optionsNo) {
		return sqlSession.selectOne("shopping.getPriceByOptionsNo", optionsNo);
	}

	// 선택된 상품 정보 가져오기
    public List<ShoppingVo> getSelectedItems(List<Integer> shoppingNos, int userNo) {
        Map<String, Object> params = new HashMap<>();
        params.put("shoppingNos", shoppingNos);
        params.put("userNo", userNo);
        return sqlSession.selectList("shopping.getSelectedItems", params);
    }
    public void updateItemCount(int shoppingNo, int count) {
        Map<String, Object> params = new HashMap<>();
        params.put("shoppingNo", shoppingNo);
        params.put("count", count);
        sqlSession.update("shopping.updateItemCount", params);
    }
    
    // 특정 사용자의 모든 장바구니 항목 삭제
    public void clearCartByUserNo(int userNo) {
        sqlSession.delete("shopping.clearCartByUserNo", userNo);
    }
  
}
