<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/imorderdetail.css" rel="stylesheet" type="text/css">
<title>주문 상세</title>
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
				<h1>
					<a href="#"> 주문 상세 </a>
				</h1>

				<div class="orderGoods">
					<h3>${receiptVo.paymentDate}주문</h3>
					<table>
						<c:forEach items="${orderItemList}" var="orderItem">
							<tr>
								<td><img src="" alt="상품 이미지"></td>
								<td>${orderItem.goodsName}<br> 옵션: ${orderItem.taste}
								</td>
								<td> 수량: ${orderItem.amount}</td>
								<td>${orderItem.eachPrice * orderItem.amount}원</td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<div class="recipient">
					<h3>받는 사람 정보</h3>
					<table>
						<tr>
							<th>받는 사람</th>
							<td>${receiptVo.userName}</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>${receiptVo.userHp}</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>${receiptVo.address}</td>
						</tr>
					</table>
				</div>

				<div class="payUser">
					<h3>구매자 정보</h3>
					<table>
						<tr>
							<th>구매자</th>
							<td>${receiptVo.userName}</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>${receiptVo.userHp}</td>
						</tr>
						<tr>
							<th>결제 수단</th>
							<td>${receiptVo.payment}</td>
						</tr>
					</table>
				</div>

				<table>
					<thead>
						<tr>
							<th>주문 금액</th>
							<th>할인</th>
							<th>배송비</th>
							<th>총액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${receiptVo.totalPrice}원</td>
							<td>0원</td>
							<td>3,000원</td>
							<td>${receiptVo.totalPrice + 3000}원</td>
						</tr>
					</tbody>
				</table>

				<div class="parent-container">
					<button class="btn" onclick="history.back()">뒤로가기</button>
					<button class="btn" type="submit">물품 전체 수령</button>
				</div>
			</div>
		</div>

		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</div>
</body>
</html>
