package com.javaex.dao;

import java.util.List;

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

}
