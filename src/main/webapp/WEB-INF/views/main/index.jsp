<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



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


			</div>
		</section>

		<!-- 상품 목록 -->
		<section class="product-list">
			<h2>사료</h2><a class="new">이 달의 신상품 new</a>
			<div class="products">
				<c:forEach var="product" items="${petfoodList}" varStatus="status">
					<c:if test="${product.category == 'ADULT'}">
						<div class="product">
							<a href="${pageContext.request.contextPath}/productinfo?goodsNo=${product.no}"> <img
								src="${pageContext.request.contextPath}/upload/${product.saveNamef}" alt="${product.name}">
								<p>${product.name}</p>
								<p>성인묘</p>
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
								<p>
									<fmt:formatNumber value="${product.price}" pattern="#,###" />
									원
								</p>
							</a>
						</div>
					</c:if>
				</c:forEach>
			</div>
			<h2>간식</h2><a class="new"> 이 달의 신상품 new</a>
			<div class="products">
				<c:forEach var="product" items="${petfoodList}" varStatus="status">
					<c:if test="${product.category == 'CAN'}">
						<div class="product">
							<a href="${pageContext.request.contextPath}/productinfo?goodsNo=${product.no}"> <img
								src="${pageContext.request.contextPath}/upload/${product.saveNamef}" alt="${product.name}">
								<p>${product.name}</p>
								<p>캔</p>
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