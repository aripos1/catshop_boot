<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 전 헤더</title>
    <link rel="stylesheet" href="assets/css/reset.css">
    <link rel="stylesheet" href="assets/css/header.css">
   

</head>
<body>
    <div id="wrap">
    <!-- 헤더 섹션 -->
    <header id ="header">
        <div class="header-container">
            <div class="logo">
                <img src="../../assets/images/Layer 1.png" alt="고양이 로고">
                <h1>야옹이 멍멍해봐</h1>
            </div>
        
            <!-- 비회원     -->
            <div class="menu">
                <button>로그인</button>
                <button>회원가입</button>
            </div>
        
            <!-- 회원 
            <div class="menu">
                <P>집사님 어서오세요.</P>
                <button>장바구니</button>
                <button>마이페이지</button>
                <button>로그아웃</button>
            </div>
             -->
            <!-- 관리자 
            <div class="menu">
                <P>관리자님 어서오세요.</P>
                <button>상품등록</button>
                <button>상품관리</button>
                <button>주문관리</button>
                <button>로그아웃</button>
            </div>
       -->
            <br>
            <div class="search">
                <input type="text" placeholder="문자열을 검색하세요!">
                <button class="search-btn">🔍</button>
            </div>
        </div>
        
        <div class="nav-menu">
            <ul>
                <li><h2>사료</h2></li>
                <li><a href="#">성인묘</a></li>
                <li><a href="#">아가묘</a></li>
                <li><h2>간식</h2></li>
                <li><a href="#">캔</a></li>
                <li><a href="#">츄르</a></li>
            </ul>
        </div>

    </header>
</div>
</body>
</html>