<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.javaex.vo.PProductVo"%>

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

				<!-- 가격 -->
				<div class="product-price">
					<span class="original-price" name="price">${pMap.pVo.price}</span>
				</div>
				<!--------->

				<!-- 변경x -->
				<div class="discount-section">
					<span>24% 할인 (10% 할인 쿠폰 받기)</span>
				</div>

				<div class="delivery-info">
					<strong>배송비</strong> (3,000원)<br> 오후 5시 이전 주문 시 오늘출발
				</div>
				<!---------->


				<!-- 옵션 -->
				<div class="quantity-section">
					<label for="quantity">수량:</label> <input type="number" id="quantity" value="1" min="1">
					<div class="options">
						<select>
							<c:forEach items="${requestScope.pMap.oList}" var="productVo">
								<option value="${productVo.optionName}">${productVo.optionName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<!---------->

				<!-- 총가격 -->
				<div class="order-total">
					<span id="totalprice" name="totalprice" value="">${pVo.price*count}</span>
				</div>
				<!--------->
				<!-- 장바구니 버튼 (장바구니 페이지 링크 추가)-->
				<button class="add-to-cart-button" href="order/shopping">장바구니에 추가</button>
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
			<img src="${pageContext.request.contextPath}/upload/${requestScope.pMap.pVo.saveNameb}" alt="제품 상세 이미지">
		</div>
		<!--------->

		<div class="review-container">

			<!-- 리뷰 -->
			<div class="review-box" id="reviews-content">
				<form action="${pageContext.request.contextPath}/product/reviewform" method="get">
					<table id="guestAdd">
						<colgroup>
							<col style="width: 70px;">
							<col>
							<col style="width: 70px;">
							<col>
						</colgroup>
						<tbody>
							<c:if test="${not empty sessionScope.SPRING_SECURITY_CONTEXT}">
								<!-- 로그인한 사용자의 경우 리뷰 등록창 표시 -->
								<form action="reviewadd" method="post">
								<tr>
									<td colspan="4"><textarea name="content" cols="72" rows="5"></textarea></td>
								</tr>
								<tr class="button-area">
									<td colspan="4" class="text-center"><button type="submit">등록</button></td>
								</tr>
								</form>
							</c:if>
						</tbody>

					</table>
					<!-- //guestWrite -->

				</form>

				<!-- Review Body -->
				<c:forEach items="${requestScope.pMap.rList}" var="productVo">
					<form class="review-content">
						<div class="review-body" id="list">

							<br>

							<div class="review-text">
								<br> <span class="name" name="name">${productVo.r_name}</span> <span class="stars" name="변경x">★★★★☆</span> <span class="verified" name="변경x">구매인증됨</span>
								<span class="date" name="review_date">${productVo.review_date}</span><br>
								<br> <span class="content" name="r_content">${productVo.r_content}</span><br>
								<br>
								<button class="delete-btn">삭제</button>
							</div>

						</div>
					</form>
				</c:forEach>
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
			</script>
		</div>
</body>
</html>