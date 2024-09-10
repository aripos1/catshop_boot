<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/imorderlist.css" rel="stylesheet" type="text/css">
<title>주문 목록</title>
</head>
<body>
	<div id="wrap">

		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

		<div id="container" class="clearfix">
			<div class="sidebar">
				<h2>MYPAGE</h2>
				<a href="#">주문 목록</a> <a href="#">회원 정보</a>
			</div>

			<div class="content">
				<h1>주문 목록</h1>

				<table>
					<thead>
						<tr>
							<th>주문일자</th>
							<th>상품 정보</th>
							<th>배송 상태</th>
							<th>상세 보기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderItemList}" var="orderItem">
							<tr class="order-row" data-receipt-no="${orderItem.receiptNo}">
								<!-- 주문 일자 -->
								<td>${orderItem.paymentDate}</td>

								<!-- 상품 정보 -->
								<td>${orderItem.goodsName}<br> ${orderItem.taste}
								</td>

								<!-- 배송 상태 -->
								<td>${orderItem.express}</td>

								<!-- 상세 보기 버튼 -->
								<td><a href="${pageContext.request.contextPath}/order/orderdetail?receiptNo=${orderItem.receiptNo}">상세보기</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</div>
	<script>
		// JavaScript로 중복된 주문 번호를 처리하는 함수
		function filterDuplicateOrders() {
			var rows = document.querySelectorAll(".order-row");
			var previousReceiptNo = null;

			rows.forEach(function(row) {
				var receiptNo = row.getAttribute("data-receipt-no");
				if (previousReceiptNo === receiptNo) {
					// 중복된 주문 번호가 발견되면 행을 숨김
					row.style.display = "none";
				} else {
					previousReceiptNo = receiptNo;
				}
			});
		}

		// DOM이 로드되면 중복 필터링을 실행
		window.onload = function() {
			filterDuplicateOrders();
		};
	</script>
</body>
</html>
