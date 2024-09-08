<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/imshopping.css" rel="stylesheet" type="text/css">

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
			<a href=""> ◀ 장바구니 </a>
		</h1>

		<!-- 장바구니 내역-->
		<table>
			<thead>
				<tr>
					<th><input type="checkbox"></th>
					<th colspan="2">상품명</th>
					<th>가격</th>
					<th>수량</th>
					<th>총액</th>
					<th>삭제</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><input type="checkbox"></td>
					<td><img src="${pageContext.request.contextPath}/assets/images/download.jfif" alt="상품 A 이미지"></td>
					<td>상품 A <br> 옵션 : 부들부들푸딩 <br> 9/25일 배송 예정
					</td>
					<td>10,000원</td>
					<td><input type="number" value="1" min="1" style="width: 50px;"></td>
					<td>10,000원</td>
					<td><button class="btn btn-remove">삭제</button></td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td><img src="../../assets/images/download.jfif" alt="상품 A 이미지"></td>
					<td>상품 B <br> 옵션 : 부들부들푸딩 <br> 9/25일 배송 예정
					</td>
					<td>20,000원</td>
					<td><input type="number" value="1" min="1" style="width: 50px;"></td>
					<td>40,000원</td>
					<td><button class="btn btn-remove">삭제</button></td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td><img src="../../assets/images/download.jfif" alt="상품 A 이미지"></td>
					<td>상품 C <br> 옵션 : 부들부들푸딩 <br> 9/25일 배송 예정
					</td>
					<td>20,000원</td>
					<td><input type="number" value="1" min="1" style="width: 50px;"></td>
					<td>40,000원</td>
					<td><button class="btn btn-remove">삭제</button></td>
				</tr>
				<tr>
					<td><input type="checkbox"></td>
					<td><img src="../../assets/images/download.jfif" alt="상품 A 이미지"></td>
					<td>상품 D <br> 옵션 : 부들부들푸딩 <br> 9/25일 배송 예정
					</td>
					<td>20,000원</td>
					<td><input type="number" value="1" min="1" style="width: 50px;"></td>
					<td>40,000원</td>
					<td><button class="btn btn-remove">삭제</button></td>
				</tr>
			</tbody>
		</table>
		<br>

		<!-- 예상결제 금액-->
		<table>
			<thead>
				<tr>
					<th>주문금액</th>
					<th>할인</th>
					<th>배송비</th>
					<th>총액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>50,000원</td>
					<td>0원</td>
					<td>3,000원</td>
					<td>53,000원</td>
				</tr>
			</tbody>
		</table>
		<br>
		<div class="parent-container">
			<button class="btn" onclick="history.back()">뒤로가기</button>
			<button class="btn" onclick="">결제하기</button>
		</div>

	</div>
</body>
</html>
