package com.javaex.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.DUserDao;
import com.javaex.vo.UserVo;

@Service
public class DUserService {

	@Autowired
	private DUserDao duserDao;
	
/*회원가입*/
	
	public int exeJoin(UserVo userVo) {
		System.out.println("UserService.exeJoin()");
		int count=duserDao.insertUser(userVo);
		
		return count;
	}
	/*로그인*/
	public UserVo exeLogin(UserVo userVo) {
		System.out.println("UserService.exeLogin()");
		
		UserVo authUser=duserDao.selectUser(userVo);
		System.out.println(userVo);
		

		return authUser;
	}
	/*수정 폼*/
	public UserVo exeupdateForm(int no) {
		System.out.println("Service.exeupdateForm");
		UserVo updateUserForm = duserDao.updateUserForm(no);
	
		return updateUserForm;
	}
	/*수정*/
	public int exeUpdate(UserVo userVo) {
		int count = duserDao.updateUser(userVo);
		
		return count;
		
	}
}	
	

