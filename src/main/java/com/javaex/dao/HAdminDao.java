package com.javaex.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.javaex.vo.ReceiptVo;

@Repository
public class HAdminDao {

	
    @Autowired
    private SqlSession sqlSession;
    
    
    public List<ReceiptVo> selectList(Map<String, Integer> limitMap) {

		System.out.println("selectList2");
		List<ReceiptVo> adminOrderList = sqlSession.selectList("admin.selectList", limitMap);
		System.out.println(adminOrderList.size());

		return adminOrderList;
	}
    
    public int selectTotalCnt() {
        System.out.println("selectTotalCnt");
        int totalCount = sqlSession.selectOne("admin.selectTotalCnt"); // MyBatis에서 영수증 총 개수 가져오는 쿼리로 변경
        System.out.println("totalCount" + totalCount);
        return totalCount;
    }
}
