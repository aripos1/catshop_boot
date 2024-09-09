package com.javaex.service;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.javaex.dao.PAdminDao;
import com.javaex.vo.PAdminVo;

@Service
public class PAdminService {

	@Autowired
	private PAdminDao dao;
	

	// 파일 업로드

	public String exeupload(MultipartFile file, MultipartFile file2,PAdminVo padminvo) {
		System.out.println("PAdminService.exeupload()");
		System.out.println("@@@@@@"+file);
		System.out.println("@@@@@@"+file2);
		System.out.println("@@@@@@"+padminvo);

		// 사진의 기본정보들을 추출한다.

		// 파일저장 폴더
		String saveDir = "/Users/jimin/Desktop/javastudy/upload";
		
		//윈도우용 저장폴더
		//String saveDir = "C:\\javaStudy\\upload";

		// 1.파일명
		String orgName = file.getOriginalFilename();
		System.out.println("orgName >>>" + orgName);

		// 2.확장자
		String exeName = orgName.substring(orgName.lastIndexOf("."));
		System.out.println(exeName);

		// 3.파일 사이즈
		long fileSize = file.getSize();
		System.out.println(fileSize);

		// 저장파일명 (겹치면 안됨)
		String saveName1 = System.currentTimeMillis() + UUID.randomUUID().toString() + exeName;
		System.out.println("dddddddd.: " + saveName1);
		String saveName2 = System.currentTimeMillis() + UUID.randomUUID().toString() + exeName;
		System.out.println("dddddddd.: " + saveName2);

		// 파일전체 경로+파일
		String filePath1 = saveDir + "/" + saveName1;
		System.out.println("filePath" + filePath1);
		String filePath2 = saveDir + "/" + saveName2;
		System.out.println("filePath" + filePath2);
		
		// 파일전체 경로+파일 (윈도우 용)
//		String filePath1 = saveDir + "\\" + saveName1;
//		System.out.println(filePath1);
//		String filePath2 = saveDir + "\\" + saveName2;
//		System.out.println(filePath2);
		
		System.out.println("이름췤!!!!!!!!!!!!!!"+saveName1+filePath1);
		System.out.println("이름췤!!!!!!!!!!!!!!"+saveName2+filePath2);

		// 윈도우 용
//		String filePath = saveDir + "\\" + saveName;
//		System.out.println(filePath);

		//db저장
//		Map<String, Object> aMap = new HashMap<String, Object>();
//		aMap.put("padminvo",padminvo.getCategory());
//		aMap.put("saveName1",saveName1);
//		aMap.put("filePath1",filePath1);
//		aMap.put("saveName2",saveName2);
//		aMap.put("filePath2",filePath2);
//		System.out.println("aMap췤!!!!!!!!!!!!!!"+aMap);
		
		//db저장
		padminvo.setSaveNamef(saveName1);
		padminvo.setFilePathf(filePath1);
		padminvo.setSaveNameb(saveName2);
		padminvo.setFilePathb(filePath2);
		dao.upload(padminvo);
		System.out.println("aaaaaaaaaaaaaaaaaa"+padminvo);
		

		//dao를 통해 db에 저장 (과제)

		// 파일저장
		try {
			byte[] fileData1 = file.getBytes();
			OutputStream os1 = new FileOutputStream(filePath1);
			BufferedOutputStream bos1 = new BufferedOutputStream(os1);

			bos1.write(fileData1);
			bos1.close();
			
			byte[] fileData2 = file2.getBytes();
			OutputStream os2 = new FileOutputStream(filePath2);
			BufferedOutputStream bos2 = new BufferedOutputStream(os2);

			bos2.write(fileData2);
			bos2.close();

		} catch (Exception e) {
			System.out.println(e.toString());
		}
        
		
		
		return saveName1 ;

//		int count = dao.upload(adminVo);
//		if (count >= 1) {
//
//			// 2번 : 사진을 서버에 복사해야된다(db에 직접적으로 전달 ㄴㄴ c드라이브에 저장한 주소값만 보낸다)
//			// 2-1 파일 저장
//
//			try {
//				byte[] fileData = file.getBytes();
//
//				OutputStream os = new FileOutputStream(filePath);
//				BufferedOutputStream bos = new BufferedOutputStream(os);
//
//				bos.write(fileData);
//				bos.close();
//
//			} catch (Exception e) {
//				System.out.println(e.toString());
//
//			}
//			;
//
//			return saveName; // : (시간 + uuid + .jpg)
//		} else {
//			return null;
//		}

	}

}