package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.PProductDao;
import com.javaex.vo.PProductVo;

@Service
public class PProductService {

	@Autowired
	private PProductDao dao;

	
	// 상세 폼 상품데이터 가져오기
	public Map<String, Object> exeProduct(int no) {
		System.out.println(no);
		
		//상품넘버로 정보 가져오기
		PProductVo pVo = dao.productSelectOne(no);
		// System.out.println("service##############"+pVo);

		//상품넘버로 옵션 리스트 가져오기
		List<PProductVo> oList = dao.optionList(no);
		// System.out.println("service@@@@@@@@@@@@@@"+oList);

		//상품넘버로 리뷰 리스트 가져오기
		List<PProductVo> rList = dao.reviewListr(no);
		System.out.println("service##########3#####" + rList);

		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("pVo", pVo);
		pMap.put("oList", oList);
		pMap.put("rList", rList);

		System.out.println("service췤!!!!!!!!!!!!!!" + pMap);

		return pMap;
	}

	// 등록
	public int exeAdd(PProductVo productVo) {
		System.out.println("PProductService.exeAdd()");

		int count = dao.reviewInsert(productVo);
		return count;
	}

}