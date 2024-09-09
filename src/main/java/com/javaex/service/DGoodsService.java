package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.DGoodsDao;
import com.javaex.vo.GoodsVo;

@Service
public class DGoodsService {

	@Autowired
	private DGoodsDao dgoodsDao;
	
	public List<GoodsVo> exemainList() {
		System.out.println("DGoodsService.exemainList");
		List<GoodsVo> dgoodsList =dgoodsDao.getmainList();
		System.out.println(dgoodsList);
		
		return dgoodsList;
	}
}
