package com.javaex.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.PAdminVo;

@Repository
public class PAdminDao {

	@Autowired
	private SqlSession sqlSession;

//	// 파일 업로드
//	public int upload( Map<String, Object> aMap ) {
//		System.out.println("dao upload.");
//		System.out.println(aMap);
//
//		int count = sqlSession.insert("admin.insert", aMap);
//
//		System.out.println("yooooooooooooooooa!!" + count);
//		return count;
//	}
	
	// 파일 업로드
		public int upload( PAdminVo padminvo ) {
			System.out.println("dao upload.");
			System.out.println(padminvo);

			int count = sqlSession.insert("admin.insert", padminvo);

			System.out.println("yooooooooooooooooa!!" + count);
			return count;
		}

}
