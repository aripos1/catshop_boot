package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.UserVo;

@Repository
public class DUserDao {

	@Autowired
	private SqlSession sqlSession;

	/* 회원가입 */
	public int insertUser(UserVo userVo) {
		System.out.println("UserDao.insertUser()");

		int count = sqlSession.insert("user.insert", userVo);

		return count;

	}

	public UserVo selectUser(UserVo userVo) {
		System.out.println("UserDao.selectUser()");
		
		UserVo authUser =sqlSession.selectOne("user.selectByIdPW", userVo);
		
		return authUser;
	}

}
