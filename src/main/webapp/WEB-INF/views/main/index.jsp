<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인 페이지</title> 
    
    <link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/header.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/footer.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/assets/css/hdrmainpage.css"rel="stylesheet">
   
</head>

 <c:import url="/WEB-INF/views/include/header.jsp"></c:import>
   

 <div id=wrap>
    <!-- 배너 섹션 -->
    <section class="banner">
        <div class="banner-slides">
            <img src="${pageContext.request.contextPath}/assets/images/banner_im3.webp" alt="배너 이미지 1">
            <img src="" alt="배너 이미지 2">
            <img src="" alt="배너 이미지 3">
        </div>
    </section>

    <!-- 상품 목록 -->
    <section class="product-list">
        <h2>사료</h2>
        <div class="products">
            <div class="product">
                <img src="${pageContext.request.contextPath}/assets/images/adult-food/1$royalcanin.jpg" alt="사료">
                <p>사료가정 1<br>32,000원</p>
            </div>
            <div class="product">
                <img src="${pageContext.request.contextPath}/assets/images/adult-food/1$royalcanin.jpg" alt="사료사진2">
                <p>사료가정 2<br>32,000원</p>
            </div>
            <div class="product">
                <img src="${pageContext.request.contextPath}/assets/images/adult-food/1$royalcanin.jpg" alt="사료사진3">
                <p>사료가정 3 <br>32,000원</p>
            </div>
            
        </div>

        <h2>간식</h2>
        <div class="products">
            <div class="product">
                <img src="${pageContext.request.contextPath}/assets/images/adult-food/1$royalcanin.jpg" alt="간식가정 1">
                <p>간식 가정 1<br> 10000원</p>
            </div>
            <div class="product">
                <img src="${pageContext.request.contextPath}/assets/images/adult-food/1$royalcanin.jpg" alt="간식가정2">
                <p>간식 가정 2<br> 20000원</p>
            </div>
            <div class="product">
                <img src="${pageContext.request.contextPath}/assets/images/adult-food/1$royalcanin.jpg" alt="간식가정 3">
                <p>간식 가정 3<br> 30000원</p>
            </div>
            
        </div>
    </section>
  </div><!-- wrap -->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
    <script src="script.js"></script>
</body>
</html>