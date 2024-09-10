<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인 페이지</title>

<link href="${pageContext.request.contextPath}/assets/css/reset.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/header.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/footer.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/assets/css/hdrmainpage.css"
	rel="stylesheet">

</head>

<c:import url="/WEB-INF/views/include/header.jsp"></c:import>


<div id=wrap>
	<!-- 배너 섹션 -->
	<section class="banner">
		<div class="banner-slides">
			<img
				src="${pageContext.request.contextPath}/assets/images/banner_im3.webp"
				alt="배너 이미지 1"> <img src="" alt="배너 이미지 2"> <img src=""
				alt="배너 이미지 3">
		</div>
	</section>

	<!-- 상품 목록 -->
<section class="product-list">
    <h2>사료</h2>
    <div class="products">
        <c:forEach var="product" items="${petfoodList}" varStatus="status">
            <c:if test="${product.category == '성인묘'}">
                <div class="product">
                    <a href="${pageContext.request.contextPath}/product/detail/${product.no}">
                        <img src="${product.filePathf}/${product.saveNamef}" alt="${product.name}">
                        <p>${product.name}</p>
                        <p>${product.category}</p>
                        <p>${product.regDate}</p>
                        <p>${product.price}원</p>
                    </a>
                </div>
            </c:if>
            <c:if test="${product.category == '아가묘'}">
                <div class="product">
                    <a href="${pageContext.request.contextPath}/product/detail/${product.no}">
                        <img src="${product.filePathf}/${product.saveNamef}" alt="${product.name}">
                        <p>${product.name}</p>
                        <p>${product.category}</p>
                        <p>${product.regDate}</p>
                        <p>${product.price}원</p>
                    </a>
                </div>
            </c:if>
        </c:forEach>
    </div>


		<h2>간식</h2>
		<div class="products">
		 <c:forEach var="product" items="${petfoodList}" varStatus="status">
		  <c:if test="${product.category == '캔'}">
			<div class="product">
				<a href="${pageContext.request.contextPath}/product/detail/${product.no}">
                        <img src="${product.filePathf}/${product.saveNamef}" alt="${product.name}">
                        <p>${product.name}</p>
                        <p>${product.category}</p>
                        <p>${product.regDate}</p>
                        <p>${product.price}원</p>
                    </a>
			</div>
			</c:if>
			 <c:if test="${product.category == '츄르'}">
			<div class="product">
				 <a href="${pageContext.request.contextPath}/product/detail/${product.no}">
                        <img src="${product.filePathf}/${product.saveNamef}" alt="${product.name}">
                        <p>${product.name}</p>
                        <p>${product.category}</p>
                        <p>${product.regDate}</p>
                        <p>${product.price}원</p>
                    </a>
                </div>
               </c:if>
              </c:forEach>  
	</section>
</div>
<!-- wrap -->
<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
<script src="script.js"></script>
</body>
</html>