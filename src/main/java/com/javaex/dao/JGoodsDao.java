package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.GoodsVo;

@Repository
public class JGoodsDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	//list
	public List<GoodsVo> list(){
		System.out.println("dao j w");
		
		List<GoodsVo> goodsList = sqlSession.selectList("goods.goodsList");
		System.out.println("dao @@"+goodsList);
		
		return goodsList;
		
	}
	
	//전체 글 갯수
	public int selectTotalCnt() {
		System.out.println("selectTotalCnt() j w");
		
		int totalCnt = sqlSession.selectOne("goods.selectTotalCnt");
		System.out.println("totalCnt: " + totalCnt);
		
		return totalCnt;
	}
	
	public List<GoodsVo> selectgoodspagingList(Map<String,Object> limitMap){
//		System.out.println("dao limitMap :: " + limitMap);
		
		List<GoodsVo> goodsList2 = sqlSession.selectList("goods.selectList",limitMap);
		System.out.println("****goodsList2 :: " + goodsList2);
		
		return goodsList2;
	}
	
	//카테고리별 총갯수
	
	public int selectTotalGoods(String category, String keyword) {
		
		GoodsVo textVo = new GoodsVo(category, keyword);
		System.out.println("////////////////////goodsVo"+textVo);
		
		int goodsTotalCnt = sqlSession.selectOne("goods.goodsTotalCount",textVo);
		System.out.println("상품별 총 개수 안나올꺼냐????????"+goodsTotalCnt);
		
		return goodsTotalCnt;
		
	}
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
