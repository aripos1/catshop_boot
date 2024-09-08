package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.PProductDao;

@Service
public class PProductService {
	
	@Autowired
	private PProductDao dao;
	
	public String exeProductInfo() {
		System.out.println("PProductService.exeProductInfo");
		
		return null;
	}

}
