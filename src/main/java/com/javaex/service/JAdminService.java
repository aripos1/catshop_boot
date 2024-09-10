package com.javaex.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.JAdminDao;
import com.javaex.vo.GoodsVo;
import com.javaex.vo.JOptionVo;
import com.javaex.vo.JSeachVo;

@Service
public class JAdminService {
	
	@Autowired
	private JAdminDao jadminDao;
	
	//list + serch(category,keyword ) + paging
	public Map<String,Object> exeselectgoodslist2(JSeachVo jseachVo){
		//System.out.println("service j w!");
		
		//페이징
		int page = jseachVo.getPage();
		int listcnt = 10;	//페이지당 글 출력갯수
		int totalcnt = jadminDao.aselectgoodstotalcount(jseachVo);	//전체글 갯수 가져오기
		
		if(page <= 0) {
			page = 1;
		}
		
		//버튼 시작번호 + (startRowNo , listcnt)묶어주기
		int startRowNo = (page-1)*listcnt;
		
		Map<String, Object> fMap = new HashMap<String, Object>();
		fMap.put("listcnt", listcnt);
		fMap.put("startRowNo", startRowNo);
		fMap.put("jseachVo", jseachVo);
		
		
		//System.out.println("fMap:::"+fMap);
		
		//list 가져오기
		List<GoodsVo> admingoodsList = jadminDao.selectgoodslist2(fMap);
		System.out.println("servvice///////"+admingoodsList);
		admingoodsList.get(0).getNo();
		System.out.println(admingoodsList.get(0).getNo());
		//딜리트 해주기
		
		//jadminDao.admindeletegoodsOne();
		
		//페이징 계산하기
		int pageBtncount = 10;	//페이지당 버튼 갯수
		
		//마지막 페이지 계산 + 시작버튼 계산 + 화살표유무
		int endPageBtnNo = (int)Math.ceil((page/(double)pageBtncount))*pageBtncount;
		//System.out.println("endPageBtnNo@@ ::"+endPageBtnNo);
		int startPageBtnNo = (endPageBtnNo - pageBtncount)+1;
		//System.out.println("startPageBtnNo"+startPageBtnNo);
		boolean next = false;
		//////////////////////////////
		//System.out.println(">>>>>>>"+totalcnt);
		//System.out.println(">>>>>>>"+listcnt);
		//System.out.println(">>>>>>>"+endPageBtnNo);
		/////////////////////////////
		
		if(listcnt*endPageBtnNo <totalcnt) {
			next = true;
		}else {
			endPageBtnNo = (int)Math.ceil(totalcnt/(double)listcnt);
		}
		boolean prev = false;
		if(startPageBtnNo != 1) {
			prev = true;
		}
		
		//화면 출력해줄 데이터들 묶어주기
		Map<String,Object> jmap = new HashMap<String,Object>();
		
		jmap.put("admingoodsList", admingoodsList);
		jmap.put("prev", prev);
		jmap.put("next", next);
		jmap.put("startPageBtnNo", startPageBtnNo);
		jmap.put("endPageBtnNo", endPageBtnNo);
		jmap.put("fMap", fMap);
		
		
		
		
		System.out.println("-----------------------------------------");
		System.out.println(jmap);
		System.out.println(admingoodsList.size());
		System.out.println(jseachVo);
		System.out.println(totalcnt);
		System.out.println("-----------------------------------------");
		
		
		
		return jmap;
	}
	//delete
	public void exedeletegoodsone(int no) {
		System.out.println("service j w");
		System.out.println(no);
		
		jadminDao.deletegoodsone(no);
	}
	
	//insert
	
	public int exeinsertoption(JOptionVo optionVo) {
		System.out.println("service j w");
		
		
		
		System.out.println("////////////"+optionVo);
		
		jadminDao.insertoption(optionVo);
		
		return 0;
	}
	
	//option page list
	
	public List<JOptionVo> exeoptionselectlist(int no){
		System.out.println("service j w");
		
		jadminDao.optionselectlist(no);
		
		return null;
	}
	


}
