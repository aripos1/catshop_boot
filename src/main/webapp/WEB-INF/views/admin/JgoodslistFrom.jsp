<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link href="${pageContext.request.contextPath}/assets/css/Jjinadmingoodslist.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/footer.css" rel="stylesheet">


<!-- Axios 라이브러리 포함 -->
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

</head>

<body>
	<div id="wrap">

		<!-- import header -->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>


		<div class="container">
			<h1 class="goodslist">상품관리 리스트</h1>
			<input type="hidden" name="roll" value="${sessionScope.no.roll}">
			<!-- 검색 및 카테고리 선택 -->
			<div class="search-section">
				<form action="${pageContext.request.contextPath}/admin/list2" method="get">
					<div>
						<select id="search_menu" name="category">
							<option value="all">카테고리 선택</option>
							<option value="adult">ADULT</option>
							<option value="kitten">KITTEN</option>
							<option value="CAN">CAN</option>
							<option value="CHURR">CHURR</option>
						</select> <input class="search-box" placeholder="검색어를 입력하세요" type="text" name="keyword" value="">
						<button type="submit" id="btn-search">검색</button>
					</div>
				</form>
			</div>

			<!-- 상품 리스트 테이블 -->
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>카테고리</th>
						<th>상품이름</th>
						<th>등록날짜</th>
						<th>글제목</th>
						<th>상품가격</th>
						<th>옵션</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.jmap.admingoodsList}" var="GoodsVo">
						<tr>
							<td>${GoodsVo.no}</td>
							<td>${GoodsVo.category}</td>
							<td>${GoodsVo.name}</td>
							<td>${GoodsVo.regDate}</td>
							<td>${GoodsVo.content}</td>
							<td><fmt:formatNumber value="${GoodsVo.price}" type="number" groupingUsed="true" />원</td>
							<td><a href="${pageContext.request.contextPath}/admin/optionlist?goods_no=${GoodsVo.no}"><button type="submit" class="option-button">옵션</button></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>



			<!-- 페이지네이션 -->
			
			<div id="pagination">




				<c:if test="${requestScope.jmap.prev}">
					<a href="${pageContext.request.contextPath}/admin/list2?page=${requestScope.jmap.startPageBtnNo-1}">&laquo;</a>
				</c:if>
				<c:forEach begin="${requestScope.jmap.startPageBtnNo }" end="${requestScope.jmap.endPageBtnNo }" step="1" var="page">
					<c:choose>
						<c:when test="${param.page == page}">
							<a class="active" href="${pageContext.request.contextPath}/admin/list2?page=${page}&category=${param.category}&keyword=${param.keyword}"> ${page} </a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath}/admin/list2?page=${page}&category=${param.category}&keyword=${param.keyword}"> ${page} </a>
						</c:otherwise>

					</c:choose>
				</c:forEach>
				<c:if test="${requestScope.jmap.next}">
					<a href="${pageContext.request.contextPath}/admin/list2?page=${requestScope.jmap.endPageBtnNo+1}">&raquo;</a>
				</c:if>



			</div>
			<!--footer-->
			<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
			<!--/footer-->

		</div>
		<!-- /wrap-->
</body>


<script>
	document.addEventListener('DOMContentLoaded', function() {

		//insert btn :모달창 띄우기
		let insertBtn = document.querySelector('.btn-option');
		insertBtn.addEventListener('click', callmodal)

		//모달창 띄우기

		//<<코드정리>>
		function callmodal(event) {
			console.log(event.target.tagName);

			if (event.target.tagName == 'BUTTON') {
				console.log('꾸욱');
			}

		}

	});
</script>

</body>

</html>