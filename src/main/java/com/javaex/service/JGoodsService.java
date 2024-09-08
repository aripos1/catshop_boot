package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.JGoodsDao;
import com.javaex.vo.GoodsVo;

@Service
public class JGoodsService {

	@Autowired
	private JGoodsDao jgoodsDao;
	
	//list
	public List<GoodsVo> exeList(){
		System.out.println("service j w");
		
		List<GoodsVo> goodsList = jgoodsDao.list();
		System.out.println("service ##"+goodsList);
		
		return goodsList;
	}
	
}
