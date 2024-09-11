package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.JGoodsDao;
import com.javaex.vo.GoodsVo;
import com.javaex.vo.JSeachVo;

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
	
	//################ list + paging + category + serch #######################
	
	public Map<String, Object> exepagingList(JSeachVo jseachVo) {
		System.out.println("service paging j w!!");
		int page = jseachVo.getPage();
		System.out.println(page);
		
		//한페이지 출력 갯수
		int listcnt = 9;	//한페이지 출력갯수
		int totalcnt = jgoodsDao.selectTotalCnt();
		System.out.println("totalCnt: " + totalcnt);
		
		//상품별 총갯수
		int goodsTotalCnt = jgoodsDao.selectTotalGoods(jseachVo);	
		
		// 음수값 들어왔을때 1페이지로 ㄱ
		if(page <= 0) {
			page = 1;
		}
		
		//startRowNo 구하기
		int startRowNo = (page-1)*listcnt;
		System.out.println("startRowNo" + startRowNo);
		
		Map<String, Object> limitMap = new HashMap<String, Object>();
		
		limitMap.put("listcnt", listcnt);
		limitMap.put("startRowNo", startRowNo);
		limitMap.put("jseachVo", jseachVo);
		
		//카테고리 추가
		
//		limitMap.put("goodsTotalCnt", goodsTotalCnt);
		System.out.println("///limitMap"+limitMap);
//		System.out.println("///goodsTotalCnt"+goodsTotalCnt); 
		
		//리스트 가져오기
		List<GoodsVo> goodsList2 = jgoodsDao.selectgoodspagingList(limitMap);
		System.out.println("service goodsList2:"+goodsList2);
		
		//페이징 계산하기
		int pageBtncount = 5;	//페이지당 버튼 갯수
		int endPageBtnNo = (int)Math.ceil((page / (double)pageBtncount))*pageBtncount;	//마지막 버튼번호
		System.out.println("endPageBtnNo: "+endPageBtnNo);
		
		int startPageBtnNo = (endPageBtnNo-pageBtncount)+1;		//시작버튼번호
		System.out.println("startPageBtnNo:"+startPageBtnNo);
		
		//다음 화살표버튼 유무
		boolean next = false;
		boolean prev = false;
		
		if(listcnt * endPageBtnNo < goodsTotalCnt) {
			next =true;
		}else {
			//갯수 정확히 계산해주기
			endPageBtnNo = (int)Math.ceil(goodsTotalCnt / (double)listcnt);
		}
		
		
		if(startPageBtnNo != 1) {
			prev = true;
		}
		System.out.println("#####################"+goodsList2);
		//최종적으로 데이터를 묶어주기
		Map<String, Object> pMap = new HashMap<String, Object>();
		pMap.put("goodsList2", goodsList2);
		pMap.put("prev", prev);
		pMap.put("next", next);
		pMap.put("startPageBtnNo", startPageBtnNo);
		pMap.put("endPageBtnNo", endPageBtnNo);
		pMap.put("goodsTotalCnt", goodsTotalCnt);
		
		
		System.out.println("pMap" + pMap);
		
		return pMap;
	}
	
	//################ /list + paging + category #######################
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
