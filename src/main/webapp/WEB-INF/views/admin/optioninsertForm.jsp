<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>

<link href="${pageContext.request.contextPath}/assets/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/option.css" rel="stylesheet" type="text/css">

</head>

<body>
	<div id="wrap">
		<!-- 고정된 뒤로가기 버튼 (왼쪽 하단에 위치) -->
		<button class="back-button" onclick="history.back();">&larr;</button>

		<!-- import header -->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

		<!--/header-->
		<div id="content">
			<div id="sub_title">
				<h1 class="goodslist">옵션등록</h1>

				<div id="product-info">
					<span>상품 no값</span> <span> 상품 name </span>
				</div>

				<form class="option-box" action="${pageContext.request.contextPath}/admin/insert" method="get">
					<div class="form-box">

						<input class="search-box" placeholder=" 옵션이름" type="text" name="taste" value="">
						<button class="btn-insertoption" type="submit">등록</button>
						<input type="hidden" name="goods_no" value="${param.goods_no}">
					</div>
				</form>
			</div>
			<table class="table">
				<thead>
					<tr>
						<th>상품번호</th>
						<th>카테고리</th>
						<th>상품이름</th>
						<th>옵션</th>
						<th>상품가격</th>
						<th>등록일자</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${requestScope.optionList}" var="JOptionVo">
						<tr>
							<td>${JOptionVo.goods_no}</td>
							<td>${JOptionVo.category }</td>
							<td>${JOptionVo.name}</td>
							<td>${JOptionVo.taste}</td>
							<td><fmt:formatNumber value="${JOptionVo.price}" type="number" groupingUsed="true" />원</td>
							<td>${JOptionVo.regDate}</td>

							<!-- <form action="${pageContext.request.contextPath}/admin/delete" method="get">
	                                    	<td><button type="submit" id="btn-delete"> 삭제 </button></td>
	                                    	<input type="text" name="goods_no" value="${JOptionVo.no }">
	                                	</form>-->
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
	<!--/content-->

	<!--footer-->
	<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	<!--/footer-->

	</div>
	<!-- /wrap-->

	<script>
		// 
		$(document).ready(function() {
			// ID가 btn-insertoption인 버튼에 클릭 이벤트 핸들러 추가
			$('#btn-insertoption').on('click', function() {
				// 클릭 시 alert 창 띄우기
				alert('Button clicked!');
			});
		});
	</script>
</body>

</html>