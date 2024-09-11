<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/impay.css" rel="stylesheet" type="text/css">
<title>상품결제</title>
</head>
<body>
	<div id="wrap">
		<header id="header">
			<div class="header-container">
				<div class="logo">
					<a href=""><img src="${pageContext.request.contextPath}/assets/images/Layer 1.png" alt="고양이 로고"></a>
					<h1>야옹이 멍멍해봐</h1>
				</div>
			</div>
		</header>
		<h1>
			<a href=""> ◀ 상품결제 </a>
		</h1>
		<form id="paymentform" action="${pageContext.request.contextPath}/order/successpayment" method="post">

			<!-- 구매자 정보 -->
			<h3>구매자 정보</h3>
			<table>
				<colgroup>
					<col style="width: 20%">
					<col style="width: 80%">
				</colgroup>
				<tr>
					<th>구매자</th>
					<td>${buyer.name}</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${buyer.hp}</td>
				</tr>
			</table>

			<h3>받는 사람 정보</h3>
			<table>
				<colgroup>
					<col style="width: 20%">
					<col style="width: 80%">
				</colgroup>
				<tr>
					<th>받는 사람</th>
					<td>${buyer.name}</td>
				</tr>
				<tr>
					<th>연락처</th>
					<td>${buyer.hp}</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>${buyer.address}</td>
				</tr>
			</table>

			<!-- 주문 상품 -->
			<h3>주문 상품</h3>
			<table>

				<thead>
					<tr>
						<th>상품명</th>
						<th>옵션</th>
						<th>가격</th>
						<th>수량</th>
						<th>총액</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${selectedItems}" var="item">
						<tr>
							<td>${item.goodsName}</td>
							<td>${item.taste}</td>
							<td>${item.price}원</td>
							<td>${item.count}</td>
							<td>${item.price * item.count}원</td>
							<input type="hidden" name="shoppingNos" value="${item.shoppingNo}">

						</tr>
					</c:forEach>

				</tbody>
			</table>

			<!-- 결제 금액 -->
			<h3>결제 금액</h3>
			<table>
				<colgroup>
					<col style="width: 20%">
					<col style="width: 80%">
				</colgroup>
				<tr>
					<th>주문금액</th>
					<td>${totalAmount}원</td>
				</tr>
				<tr>
					<th>배송비</th>
					<td>3000원</td>
				</tr>
				<tr>
					<th>총액</th>
					<td>${totalAmount + 3000}원</td>
				</tr>
			</table>

			<!-- 결제수단 선택 -->
			<div class="payment">
				<h3>결제수단</h3>
				<br>
				<p>
					<input type="radio" name="paymentMethod" value="card" required> 신용카드
				</p>
				<br>
				<p>
					<input type="radio" name="paymentMethod" value="bank" required> 계좌이체
				</p>
			</div>

			<!-- 결제하기 버튼 -->
			<button type="submit" id="paymentButton">결제하기</button>

		</form>
	</div>

	<script>
		// 결제 처리 로직
		document
				.getElementById('paymentButton')
				.addEventListener(
						'click',
						function(event) {
							const selectedPayment = document
									.querySelector('input[name="paymentMethod"]:checked');

							if (!selectedPayment) {
								alert("결제수단을 선택해주세요.");
								event.preventDefault(); // 결제 수단 미선택 시 폼 제출 방지
							} else {
								// 결제 완료 후 장바구니 삭제 및 주문 목록 페이지로 이동
								clearCartAfterPayment();
							}
						});

		// 장바구니 삭제 및 주문 목록 페이지 이동 로직 (알림 없이 처리)
		function clearCartAfterPayment() {
			$
					.ajax({
						type : "POST",
						url : "${pageContext.request.contextPath}/order/clearCartAfterPayment", // URL 경로 수정
						success : function(response) {
							if (response === "success") {
								// 주문 목록 페이지로 이동
								window.location.href = "${pageContext.request.contextPath}/order/orderlist";
							}
						},
						error : function(xhr, status, error) {
							console.log("AJAX 요청에 실패했습니다.");
							console.log("상태:", status);
							console.log("에러:", error);
						}
					});
		}
	</script>

</body>
</html>
