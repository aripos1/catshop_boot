package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.GoodsVo;

@Repository
public class DGoodsDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<GoodsVo> getmainList(){
		
		List<GoodsVo> petfoodList = sqlSession.selectList("Dgoods.selectGoods");

		
		return petfoodList;
	}
	

	
}
	
