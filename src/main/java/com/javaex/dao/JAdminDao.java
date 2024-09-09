package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.GoodsVo;
import com.javaex.vo.JSeachVo;

@Repository
public class JAdminDao {
	
	@Autowired
	private SqlSession sqlSession; 
	
	//전체 리스트
	public List<GoodsVo> selectgoodslist2(Map<String,Object> fMap){
		System.out.println("dao selectgoodslist()");
		System.out.println(fMap);
		List<GoodsVo> admingoodsList = sqlSession.selectList("admingoodslist.adminselectgoodsList",fMap);
		System.out.println("////////**************admingoodsList"+admingoodsList);
		System.out.println("////////**************admingoodsList"+admingoodsList.size());
		
		return admingoodsList;
	}
	
	//상품 전체 토탈 카운트
	public int aselectgoodstotalcount(JSeachVo jseachVo) {
		System.out.println("dao goodstotalcnt j w!!");
		
		int admingoodstotalcount = sqlSession.selectOne("admingoodslist.admingoodstotalcountAll",jseachVo);
		System.out.println("admingoodstotalcount@@::" + admingoodstotalcount);
		
		return admingoodstotalcount;
	}
	
	

}
