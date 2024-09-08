<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="assets/css/reset.css" rel="stylesheet" type="">
    <link href="assets/css/header.css" rel="stylesheet" type="">
    <link href="assets/css/product.css" rel="stylesheet" type="">
    <title>제품 구매 페이지</title>
</head>


	<body>
	<div id="wrap">
    <!-- import header -->
    <c:import url="/WEB-INF/views/include/header.jsp"></c:import>

    <div class="container">
        <div class="product-image-section">
            <img src="../../assets/images/상품이미지test.jpg" alt="제품 상세 이미지">
        </div>

        <div class="product-details-section">
            <div class="product-title" name="상품명">하림펫푸드 밤이보약 캣 걱정없는 헤어볼 3.4kg</div>

            <!-- 변경x -->
            <div class="rating-and-reviews">
                <div class="rating-stars">★★★★★</div>
                <div class="review-count">(2,62개의 후기)</div>
            </div>
            <!--------->

            <!-- 가격 -->
            <div class="product-price">
                <span class="original-price" name="가격">29,900원</span>
            </div>
            <!--------->

            <!-- 변경x -->
            <div class="discount-section">
                <span>24% 할인 (10% 할인 쿠폰 받기)</span>
            </div>

            <div class="delivery-info">
                <strong>배송비</strong> (3,000원)<br>
                오후 5시 이전 주문 시 오늘출발
            </div>
            <!---------->


            <!-- 옵션 -->
            <div class="quantity-section">
                <label for="quantity">수량:</label>
                <input type="number" id="quantity" value="1" min="1">
                <div class="options">
                    <select>
                        <option value="option1">무슨무슨맛</option>
                        <option value="option2">머선머선맛</option>
                        <option value="option3">모손모손맛</option> 
                    </select>
                </div>
            </div>
            <!---------->

            <!-- 총가격 -->
            <div class="order-total" name="총가격">
                총 주문 금액: 29,900원
            </div>
            <!--------->
            <!-- 장바구니 버튼 (장바구니 페이지 링크 추가)-->
            <button class="add-to-cart-button">장바구니에 추가</button>
            <button class="add-to-cart-button">구매</button>
            <!--------->
        
        </div>
    </div>

    
    <div class="details-toggle">
        <button id="toggle-details">제품 상세 이미지 보기</button>
        <button id="toggle-reviews">구매 후기 보기</button>
    </div>

    <!-- 상세 이미지 -->
    <div class="details-content" id="details-content">
        <img src="../../assets/images/상세p.jpg" alt="제품 상세 이미지">
    </div>
    <!--------->

    <div class="review-container">
        
        <button class="delete-btn">삭제</button>
        <!-- 리뷰 -->
        
        <!--------->
        <!-- Review Body -->
        <form class="review-content">
        <div class="review-body">
            <img src="https://via.placeholder.com/100" alt="product-image">
            <div class="review-text">
                <br>
                <span class="name">이*현</span>
                <span class="stars" name="변경x">★★★★☆</span>
                <span class="verified" name="변경x">구매인증됨</span>
                <span class="date" name="등록일">2024.09.05</span><br><br><br>
                <span class="content">잘먹어요, 헤어볼에 도움이 되기를 바래요.</span>
            </div>
        </div>
    </form>

    <script>
        // Toggle between product details and reviews
        document.getElementById('toggle-details').addEventListener('click', function() {
            document.getElementById('details-content').style.display = 'block';
            document.getElementById('reviews-content').style.display = 'none';
        });

        document.getElementById('toggle-reviews').addEventListener('click', function() {
            document.getElementById('details-content').style.display = 'none';
            document.getElementById('reviews-content').style.display = 'block';
        });
    </script>
</div>
</body>
</html>