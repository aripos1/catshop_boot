<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>header</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/header.css">
   

</head>
<body>
    <div id="wrap">
    <!-- 헤더 섹션 -->
    <header id ="header">
        <div class="header-container">
            <div class="logo">
            	<a href ="${pageContext.request.contextPath}/main">
                <img src="${pageContext.request.contextPath}/assets/images/Layer 1.png" alt="고양이 로고">
                <h1>야옹이 멍멍해봐</h1>
                </a>
            </div>
        
            <!-- 비회원     -->
            
           <c:if test="${sessionScope.authUser == null}">
            
            <div class="menu">
            <br>
               <a href="${pageContext.request.contextPath}/user/loginform" id="loginBtn" class="button">로그인</a>
               <a href="${pageContext.request.contextPath}/user/joinform" id="joinBtn" class="button">회원가입</a>
            </div>
        	</c:if>
        	
            <!-- 회원-->
             
            <c:if test="${sessionScope.authUser != null && sessionScope.authUser.roll == 0}">
            <div class="menu">
            <br>
              <p> ${sessionScope.authUser.name} 집사님 어서오세요!</p>
                <a href="${pageContext.request.contextPath}/shopping/form" id="martboxBtn" class="button">장바구니</a>
                <a href="${pageContext.request.contextPath}/order/orderlist" id="mypageBtn" class="button">마이페이지</a>
               <a href="${pageContext.request.contextPath}/user/logout" id="logoutBtn" class="button">로그아웃</a>
            </div>
            
            </c:if>
            <c:if test="${sessionScope.authUser.roll == 1}"> 
            <div class="menu">
              
              <br>
              <a href="${pageContext.request.contextPath}/admin/insertform" id="proregBtn" class="button">상품등록</a>
               <a href="${pageContext.request.contextPath}/admin/list2" id="promanageBtn" class="button">상품관리</a>
               <a href="${pageContext.request.contextPath}/adminorderlist" id="ordermanageBtn" class="button">주문관리</a>
               <a href="${pageContext.request.contextPath}/user/logout" id="logoutBtn" class="button">로그아웃</a>
            </div>
       		</c:if>
            <br>
            <form action="${pageContext.request.contextPath}/goods/list2?category=${param.keyword}">
				<div class="search">
			    	<input type="text" name="keyword" value="" placeholder="제목+상품설명검색!">
		        	<button type="submit" class="search-btn">🔍</button>
			 	</div>
			 </form>
        </div>
        
        <div class="nav-menu">
            <ul>
                <li><h2>사료 |</h2></li>
                <li><a href="${pageContext.request.contextPath}/goods/list2?category=ADULT">성인묘</a></li>
                <li><a href="${pageContext.request.contextPath}/goods/list2?category=KITTEN">아가묘</a></li>
                <li><h2>간식 |</h2></li>
                <li><a href="${pageContext.request.contextPath}/goods/list2?category=CAN">캔</a></li>
                <li><a href="${pageContext.request.contextPath}/goods/list2?category=CHURR">츄르</a></li>
            </ul>
        </div>

    </header>
</div>
</body>
</html>