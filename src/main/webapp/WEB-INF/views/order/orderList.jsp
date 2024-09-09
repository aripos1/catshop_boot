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

				<!-- 최신 구매한 상품과 나머지 주문 개수 -->
				<h2>최근 구매한 상품</h2>
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
						<tr>
							<td>${latestReceipt.paymentDate}</td>
							<td>
								<c:forEach items="${latestItems}" var="item">
									${item.goodsName} (${item.taste})<br>
								</c:forEach>
							</td>
							<td>${latestReceipt.express}</td>
							<td><a href="orderDetail?receiptNo=${latestReceipt.no}">상세보기</a></td>
						</tr>
					</tbody>
				</table>
				
				<p>나머지 주문 ${remainingOrderCount}개</p>

				<!-- 전체 주문 내역 -->
				<h2>주문 내역</h2>
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
						<c:forEach items="${receiptList}" var="receipt">
							<tr>
								<td>${receipt.paymentDate}</td>
								<td>
									<c:forEach items="${itemList}" var="item">
										<c:if test="${item.receiptNo == receipt.no}">
											${item.goodsName} (${item.taste})<br>
										</c:if>
									</c:forEach>
								</td>
								<td>${receipt.express}</td>
								<td><a href="orderDetail?receiptNo=${receipt.no}">상세보기</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</div>
</body>
</html>