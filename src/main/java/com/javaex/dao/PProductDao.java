package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class PProductDao {
	
	private SqlSession session;
	
	public String productInfo() {
		System.out.println("PProductDao.productInfo");
		
		return null;
	}

}
