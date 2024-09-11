package com.javaex.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.PProductVo;

@Repository
public class PProductDao {

	@Autowired
	private SqlSession session;


	// 데이터 1개 가져오기 no 1명데이터 가져오기
	public PProductVo productSelectOne(int no) {
		//System.out.println("PProductDao.productSelectOne()");

		PProductVo pVo = session.selectOne("product.selectOne", no);
		System.out.println("dao" + pVo);
		return pVo;
	}

	// 옵션리스트
	public List<PProductVo> optionList(int no) {
		System.out.println("PProductDao.selectListr()");
			List<PProductVo> oList = session.selectList("product.optionList", no);
			//System.out.println("list췤!!!!!!!!!!!"+oList);

		return oList;
	}

	// 리뷰리스트
	public List<PProductVo> reviewListr(int no) {
		System.out.println("PProductDao.reviewListr()");
		List<PProductVo> rList = session.selectList("product.reviewListr", no);
		System.out.println("list췤!!!!!!!!!!!"+rList);

		return rList;
	}

	// 리뷰등록
	//public int reviewInsert(PProductVo productVo) {
	//	System.out.println("PProductDao.reviewInsert()");

	//	int count = session.insert("product.insert", productVo);
	//	return count;
	//}
	
	//review insert
	
	public int reviewinsert(PProductVo insertVo) {
		System.out.println("dao insert review j w");
		
		int count = session.insert("product.reviewinsert", insertVo);
		
		return count;
	}

}
