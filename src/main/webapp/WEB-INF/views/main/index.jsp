<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/hdrmainpage.css" rel="stylesheet">
<!-- Swiper's CSS -->
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />

<!-- Swiper's JS -->
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<title>메인 페이지</title>


<style>
/* 슬라이더 컨테이너 높이와 너비 설정 */
.swiper {
	width: 1000px; /* 가로 너비를 1000px로 고정 */
	height: 250px; /* 슬라이드 높이 */
	margin: 0 auto; /* 중앙 정렬 */
}

.swiper-slide {
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #ffffff; /* 슬라이드 배경색 */
}

.swiper-slide img {
	width: 900px; /* 이미지의 가로 너비 고정 */
	height: 250px; /* 이미지의 높이 고정 */
	object-fit: cover; /* 이미지가 슬라이드 크기에 맞도록 조정 */
}
</style>
</head>

<body>
	<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

	<div id="wrap">
		<!-- 배너 섹션 -->
		<section class="banner">

			<!-- Slider main container -->
			<div class="swiper mySwiper">
				<!-- Additional required wrapper -->
				<div class="swiper-wrapper">
					<!-- Slides -->
					<div class="swiper-slide">
						<img src="${pageContext.request.contextPath}/assets/images/banner_im.jpg" alt="배너 이미지 1">
					</div>
					<div class="swiper-slide">
						<img src="${pageContext.request.contextPath}/assets/images/banner_im3.webp" alt="배너 이미지 2">
					</div>
					<div class="swiper-slide">
						<img src="${pageContext.request.contextPath}/assets/images/banner.png" alt="배너 이미지 3">
					</div>

				</div>

				<!-- Pagination (점 모양의 페이지네이션) -->
				<div class="swiper-pagination"></div>

				<!-- Navigation buttons (이전, 다음 버튼) -->
				<div class="swiper-button-prev"></div>
				<div class="swiper-button-next"></div>

				<!-- Scrollbar -->
				<div class="swiper-scrollbar"></div>
			</div>
		</section>

		<!-- 상품 목록 -->
		<section class="product-list">
			<h2>사료</h2>
			<div class="products">
				<c:forEach var="product" items="${petfoodList}" varStatus="status">
					<c:if test="${product.category == 'ADULT'}">
						<div class="product">
							<a href="${pageContext.request.contextPath}/productinfo?goodsNo=${product.no}"> <img
								src="${pageContext.request.contextPath}/upload/${product.saveNamef}" alt="${product.name}">
								<p>${product.name}</p>
								<p>성인묘</p>
								<p>${product.regDate}</p>
								<p>
									<fmt:formatNumber value="${product.price}" pattern="#,###" />
									원
								</p>
							</a>
						</div>
					</c:if>
					<c:if test="${product.category == 'KITTEN'}">
						<div class="product">
							<a href="${pageContext.request.contextPath}/productinfo?goodsNo=${product.no}"> <img
								src="${pageContext.request.contextPath}/upload/${product.saveNamef}" alt="${product.name}">
								<p>${product.name}</p>
								<p>아가묘</p>
								<p>${product.regDate}</p>
								<p>
									<fmt:formatNumber value="${product.price}" pattern="#,###" />
									원
								</p>
							</a>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<h2>간식</h2>
			<div class="products">
				<c:forEach var="product" items="${petfoodList}" varStatus="status">
					<c:if test="${product.category == 'CAN'}">
						<div class="product">
							<a href="${pageContext.request.contextPath}/productinfo?goodsNo=${product.no}"> <img
								src="${pageContext.request.contextPath}/upload/${product.saveNamef}" alt="${product.name}">
								<p>${product.name}</p>
								<p>캔</p>
								<p>${product.regDate}</p>
								<p>
									<fmt:formatNumber value="${product.price}" pattern="#,###" />
									원
								</p>
							</a>
						</div>
					</c:if>
					<c:if test="${product.category == 'CHURR'}">
						<div class="product">
							<a href="${pageContext.request.contextPath}/productinfo?goodsNo=${product.no}"> <img
								src="${pageContext.request.contextPath}/upload/${product.saveNamef}" alt="${product.name}">
								<p>${product.name}</p>
								<p>츄르</p>
								<p>${product.regDate}</p>
								<p>
									<fmt:formatNumber value="${product.price}" pattern="#,###" />
									원
								</p>
							</a>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</section>
	</div>
	<!-- wrap -->

	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>

	<script>
		var swiper = new Swiper('.mySwiper', {
			loop : true, // 무한 루프 슬라이드
			pagination : {
				el : '.swiper-pagination',
				clickable : true, // 페이지네이션 클릭 가능
			},
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			scrollbar : {
				el : '.swiper-scrollbar',
				draggable : true, // 스크롤바 드래그 가능
			},
			autoplay : {
				delay : 3000, // 3초마다 슬라이드 전환
				disableOnInteraction : false, // 사용자가 슬라이드를 터치해도 자동 슬라이드가 멈추지 않음
			},
			speed : 500, // 슬라이드 전환 속도 (ms)
		});
	</script>
</body>
</html>

