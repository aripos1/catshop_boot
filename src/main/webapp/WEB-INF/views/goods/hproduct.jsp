<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.javaex.vo.PProductVo"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품 상세</title>
<link href="${pageContext.request.contextPath}/assets/css/product.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<div id="wrap">
		<header id="header">
			<div class="header-container">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/main"> <img src="${pageContext.request.contextPath}/assets/images/logo.png" alt="로고">
					</a>
				</div>
			</div>
		</header>

		<!-- 상품 상세 정보 -->
		<h1>${productVo.productName}</h1>
		<img src="${pageContext.request.contextPath}/assets/images/${productVo.image}" alt="${productVo.productName}">
		<p>가격: ${productVo.price}원</p>
		<p>설명: ${productVo.description}</p>

		<!-- 옵션 선택 -->
		<div>
			<label for="option">옵션:</label> <select id="option" name="option">
				<c:forEach items="${optionsList}" var="option">
					<option value="${option.no}">${option.taste}</option>
				</c:forEach>
			</select>
		</div>

		<!-- 수량 선택 -->
		<div>
			<label for="quantity">수량:</label> <input type="number" id="quantity" name="quantity" value="1" min="1">
		</div>

		<!-- 장바구니 및 구매 버튼 -->
		<div>
			<button class="add-to-cart-button" onclick="addToCart(${productVo.productId})">장바구니에 추가</button>
			<button class="buy-button" onclick="buyNow(${productVo.productId})">구매</button>
		</div>
	</div>

	<script>
        // 장바구니에 상품 추가하는 함수
        function addToCart(productId) {
            const quantity = $('#quantity').val(); // 선택한 수량 가져오기
            const optionNo = $('#option').val(); // 선택한 옵션 가져오기
            const pickDate = new Date().toISOString().slice(0, 10); // 현재 날짜를 pickDate로 설정 (yyyy-mm-dd 형식)

            $.ajax({
                url: '${pageContext.request.contextPath}/cart/add',  // 장바구니 추가 요청을 처리할 서버 엔드포인트
                type: 'POST',
                data: {
                    productId: productId,
                    optionsNo: optionNo,
                    count: quantity,
                    pickDate: pickDate
                },
                success: function(response) {
                    if (response.status === 'success') {
                        alert('장바구니에 상품이 추가되었습니다.');
                    } else {
                        alert('장바구니 추가 중 문제가 발생했습니다.');
                    }
                },
                error: function(xhr, status, error) {
                    console.error('장바구니 추가 중 오류 발생:', error);
                    alert('장바구니 추가에 실패했습니다.');
                }
            });
        }

        // 바로 구매하는 함수
        function buyNow(productId) {
            const quantity = $('#quantity').val(); // 선택한 수량 가져오기
            const optionNo = $('#option').val(); // 선택한 옵션 가져오기

            // 구매 페이지로 이동
            window.location.href = `${pageContext.request.contextPath}/order/checkout?productId=${productId}&quantity=${quantity}&optionNo=${optionNo}`;
        }
    </script>
</body>
</html>
