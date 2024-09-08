package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.DUserDao;

@Service
public class DUserService {

	@Autowired
	private DUserDao duserDao;
	
	/*회원가입*/
	
	public int exeJoin(userVo userVo) {
		System.out.println("");
	}
}
