<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.javaex.vo.PProductVo"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


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

		<!-- 고정된 뒤로가기 버튼 (왼쪽 하단에 위치) -->
		<button class="back-button" onclick="history.back();">&larr;</button>
		<!-- import header -->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

		<div class="container">

			<div class="product-image-section">
				<img src="${pageContext.request.contextPath}/upload/${pMap.pVo.saveNamef}" alt="제품 상세 이미지">
			</div>

			<div class="product-details-section">
				<div class="product-title" name="name">${pMap.pVo.name}</div>

				<!-- 변경x -->
				<div class="rating-and-reviews">
					<div class="rating-stars">★★★★★</div>
					<div class="review-count">(2,62개의 후기)</div>
				</div>
				<!--------->


				<!-- 상품 가격 -->
				<div class="product-price">
					<div class="original-price" id="price" name="price">
						<fmt:formatNumber value="${pMap.pVo.price}" type="number" groupingUsed="true"/>원
					</div> 
				</div>

				<!-- 변경x -->
				<div class="discount-section">
					<span>24% 할인 (10% 할인 쿠폰 받기)</span>
				</div>

				<div class="delivery-info">
					<strong>배송비</strong> (3,000원)<br> 오후 5시 이전 주문 시 오늘출발
				</div>


				<form id="addToCartForm" action="${pageContext.request.contextPath}/shopping/add" method="post">
					<!-- 상품 번호 -->
					<input type="hidden" name="goodsNo" value="${pMap.pVo.no}">

					<!-- 상품 이름 -->
					<input type="hidden" name="goodsName" value="${pMap.pVo.name}">

					<!-- 상품 가격 -->
					<input type="hidden" name="price" value="${pMap.pVo.price}">
					
						<!-- 수량 선택 -->
						<label for="quantity">수량:</label> <input type="number" id="quantity" name="count" value="1" min="1" onchange="calculateTotalPrice()">

						<!-- 옵션 선택 -->
						<label for="optionsNo">옵션 선택:</label> <select id="optionsNo" name="optionsNo">
							<c:forEach items="${pMap.oList}" var="option">
								<option value="${option.optionsNo}">${option.taste}</option>
							</c:forEach>
						
					</select>

					<!-- 총 가격 -->
					<div class="order-total">
						<div id="totalprice">
							총가격 : <fmt:formatNumber value="${pMap.pVo.price}" type="number" groupingUsed="true"/>원
						</div>
						
						<input type="hidden" id="hiddenTotalPrice" name="totalprice" value="${pMap.pVo.price}">
					</div>

					<!-- 장바구니에 추가 버튼 -->
					<button type="submit" class="add-to-cart-button">장바구니에 추가</button>
				</form>
				<button class="add-to-cart-button">구매</button>
			</div>
		</div>




		<div class="details-toggle">
			<button id="toggle-details">제품 상세 이미지 보기</button>
			<button id="toggle-reviews">구매 후기 보기</button>
		</div>

		<!-- 상세 이미지 -->
		<div class="details-content" id="details-content">
			<img src="${pageContext.request.contextPath}/upload/${requestScope.pMap.pVo.saveNameb}" alt="제품 상세 이미지">
		</div>
		<!--------->

		<div class="review-container">

			<!-- 리뷰 -->
			<div class="review-box" id="reviews-content">
				
					<table id="guestAdd">
						<colgroup>
							<col style="width: 70px;">
							<col>
							<col style="width: 70px;">
							<col>
						</colgroup>
						<tbody>
							<c:if test="${sessionScope.authUser != null }">
								<!-- 로그인한 사용자의 경우 리뷰 등록창 표시 -->
								<form action="${pageContext.request.contextPath}/reviewadd" method="get">
									<tr>
										<td colspan="4"><textarea name="r_content" cols="72" rows="5"></textarea></td>
									</tr>
									<tr class="button-area">
										<td colspan="4" class="text-center">
											<button type="submit"> 등록 </button>
										</td>
										<input type="hidden" name="no" value="${param.goodsNo}">
									</tr>
									
								</form>
							</c:if>
						</tbody>

					</table>
					<!-- //guestWrite -->

				

				<!-- Review Body -->
				<c:forEach items="${requestScope.pMap.rList}" var="productVo">
					<form class="review-content">
						<div class="review-body" id="list">

							<br>

							<div class="review-text">
								<br> <span class="name" name="name">${productVo.r_name}</span>
								<span class="stars" name="변경x">★★★★☆</span>
								<span class="verified" name="변경x">구매인증됨</span>
								<span class="date" name="review_date">${productVo.review_date}</span>
								<br> <br> <span class="content" name="r_content">${productVo.r_content}</span><br>
								<br>
								<button class="delete-btn">삭제</button>
							</div>

						</div>
					</form>
				</c:forEach>
			</div>

		</div>
		<script>
			// Toggle between product details and reviews
			document
					.getElementById('toggle-details')
					.addEventListener(
							'click',
							function() {
								document.getElementById('details-content').style.display = 'block';
								document.getElementById('reviews-content').style.display = 'none';
							});

			document
					.getElementById('toggle-reviews')
					.addEventListener(
							'click',
							function() {
								document.getElementById('details-content').style.display = 'none';
								document.getElementById('reviews-content').style.display = 'block';
							});

			// 수량이 변경될 때 총 가격을 자동으로 계산하는 함수
			function calculateTotalPrice() {
				const quantity = document.getElementById('quantity').value; // 사용자가 선택한 수량
				const price = document.getElementById('price').innerText; // 기본 상품 가격
				const totalPrice = quantity * price; // 수량 * 가격 계산
				document.getElementById('totalprice').innerText = totalPrice
						.toLocaleString(); // 계산된 총 가격 표시
				document.getElementById('hiddenTotalPrice').value = totalPrice; // 총 가격을 hidden 필드에 저장
			}

			// 수량 입력 필드에 이벤트 리스너 추가 (수량 변경 시 총 가격 계산)
			document.getElementById('quantity').addEventListener('input',
					calculateTotalPrice);

			// 옵션 선택 시 optionsNo와 taste 업데이트
			function updateTasteAndOptions(select) {
				const value = select.value.split("-");
				document.getElementById("optionsNo").value = value[0];
				document.getElementById("taste").value = value[1];
			}

			// 장바구니에 추가
			function addToCart() {
				document.getElementById("addToCartForm").submit();
			}
		</script>
</body>
</html>