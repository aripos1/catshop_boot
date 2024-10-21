<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>footer</title> 
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
   
</head>

<body>
    <div id="wrap">
        <footer>
            <div class="footer-container">
                <div class="footer-logo">
                    <img src="${pageContext.request.contextPath}/assets/images/Layer 1.png" alt="고양이 로고">
                </div>
                <div class="footer-info">
                    <p>
                        (주)야옹이 멍멍해봐 | 대표이사: 임현성<br>
                        서울시 강남대로 40번지 고양이왕국<br>
                        사업자 등록번호: 887-87-00578<br>
                        통신판매업 신고: 2017-서울특별시-00808호<br>
                        ©Catworld Inc. All Rights Reserved.
                    </p>
                </div>
                <div class="footer-contact">
                    <p>
                        고객센터: 1888-3010<br>
                        운영시간: 평일 09:00 ~ 17:30<br>
                        점심시간: 12:00 ~ 13:00<br>
                        고객지원: 토, 일 / 공휴일 휴무<br>
                    </p>
                </div>
            </div>
       </footer>
    </div>
</body>
</html>