<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/imorderdetail.css" rel="stylesheet" type="text/css">

<title>주문상세</title>
</head>
<body>
	<div id="wrap">
	
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>

		<div id="container" class="clearfix">

			<!-- 왼쪽 사이드바 -->
			<div class="sidebar">
				<h2>MYPAGE</h2>
				<a href="#">주문 목록</a> <a href="#">회원 정보</a>
			</div>

			<div class="content">
				<h1>
					<a href=""> 주문상세 </a>
				</h1>
				<div class="orderGoods">
					<h3>2024.7.9 주문</h3>

					<table>
						<tr>
							<td><img src="${pageContext.request.contextPath}/assets/images/복숭아냐옹이.jfif" alt="상품 A 이미지"></td>
							<td>상품 A <br> 옵션 : 부들부들푸딩 <br> 9/25일 배송 예정
							</td>
							<td>10,000원</td>
							<td>10,000원</td>
							<td><button>물품 수령</button></td>
						</tr>
						<tr>
							<td><img src="${pageContext.request.contextPath}/assets/images/복숭아냐옹이.jfif" alt="상품 B 이미지"></td>
							<td>상품 B <br> 옵션 : 부들부들푸딩 <br> 9/25일 배송 예정
							</td>
							<td>20,000원</td>
							<td>40,000원</td>
							<td><button>물품 수령</button></td>
						</tr>

					</table>

				</div>

				<!-- 받는 사람 정보-->
				<div class="recipient">
					<h3>받는 사람 정보</h3>

					<table>
						<tr>
							<th>받는 사람</th>
							<td>임현성</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>01026690799</td>
						</tr>
						<tr>
							<th>주소</th>
							<td>(01071) 서울특별시 강북구 한천로139나길 12-111 ( 수유동 )</td>
						</tr>
					</table>

				</div>
				<br>

				<!-- 구매자 정보-->
				<div class="payUser">

					<form>
						<h3>구매자 정보</h3>

						<table>
							<tr>
								<th>구매자</th>
								<td>임현성</td>
							</tr>
							<tr>
								<th>연락처</th>
								<td>01026690799</td>
							</tr>
							<tr>
								<th>결제수단</th>
								<td>신용카드</td>
							</tr>

						</table>
				</div>
				<br>

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
					<button class="btn" type="submit">물품 전체 수령</button>
				</div>
				</form>
			</div>
			<!--content-->
		</div>
		<!--container-->
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
		<!-- //footer -->
	</div>
	<!--wrap-->
</body>
</html>