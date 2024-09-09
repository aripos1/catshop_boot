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
	<form id="paymentform" action="${pageContext.request.contextPath}/order/payment" method="get">
	
		</h1>
		<!-- 구매자 정보-->
		<h3>구매자 정보</h3>
		<table>
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
			<tr>
				<th>받는 사람</th>
				<td>${buyer.getName()}</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${buyer.hp}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${buyer.getAddress()}</td>
			</tr>
		</table>
	
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
			
				<c:forEach  items="${selectedItems}" var="item">
					<tr>
						<td>${item.goodsName}</td>
						<td>${item.taste}</td>
						<td>${item.price}원</td>
						<td>${item.count}</td>
						<td>${item.price * item.count}원</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<h3>결제 금액</h3>
		<table>
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

		<div class="payment">
			<h3>결제수단</h3>
			<br>
			<p>
				<input type="radio" name="pay" id="" value="card">신용카드
			</p>
			<br>
			<p>
				<input type="radio" name="pay" id="" value="pay">계좌이체
			</p>
		</div>
		<button type="submit" id="paymentButton">결제하기</button>
		   </form>
	</div>

	<script>
		function submitPayment() {
			// 결제 처리 로직 작성
			alert("결제가 완료되었습니다!");
			// 실제로는 서버로 결제 정보를 전송해야 함
		}
	</script>
</body>
</html>