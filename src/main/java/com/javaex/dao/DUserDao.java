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

		int count = sqlSession.insert("user.insert", userVo);

		return count;

	}

	public UserVo selectUser(UserVo userVo) {

		UserVo authUser = sqlSession.selectOne("user.selectByIdPW", userVo);

		return authUser;

	}

	public UserVo updateUserForm(int no) {

		UserVo updateUserForm = sqlSession.selectOne("user.selectUpdate", no);

		return updateUserForm;
	}

	public int updateUser(UserVo userVo) {

		int count = sqlSession.update("user.updateUser", userVo);

		return count;
	}

	public int selecUserById(String id) {

		int count = sqlSession.selectOne("user.selectById", id);

		return count;
	}
}