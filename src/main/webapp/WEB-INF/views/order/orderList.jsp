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
			<!-- 왼쪽 사이드바 -->
			<div class="sidebar">
				<h2>MYPAGE</h2>
				<a href="#">주문 목록</a> <a href="#">회원 정보</a>
			</div>

			<!-- 메인 콘텐츠 영역 -->
			<div class="content">

				<h1>주문 목록</h1>

				<!-- 검색창 -->
				<div class="search-bar">
					<select id="searchCriteria">
						<option>목록</option>
						<option value="productName">상품명으로 검색</option>
						<option value="productContent">상품내용으로 검색</option>
					</select> <input type="text" id="searchInput" placeholder="검색어를 입력하세요">
					<button onclick="search()">검색</button>
				</div>

				<!-- 최근 기간 선택 버튼 -->
				<div class="date-filter">
					<button>최근 6개월</button>
					<button>2024</button>
					<button>2023</button>
					<button>2022</button>
				</div>

				<!-- 주문 목록 테이블 -->
				<table>
					<thead>
						<tr>
							<th>주문일자</th>
							<th colspan="2">상품 정보</th>
							<th>배송 상태</th>
							<th>상세 보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2024-09-01</td>
							<td><img src="../../assets/images/복숭아냐옹이.jfif" alt="상품 A 이미지"></td>
							<td>상품 A<br>옵션: 부들부들푸딩
							</td>
							<td><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking"> 배송중</a></td>
							<td>
								<button>물품 수령</button>
								<button>리뷰 작성</button>
							</td>
						</tr>
						<tr>
							<td>2024-08-15</td>
							<td><img src="../../assets/images/복숭아냐옹이.jfif" alt="상품 A 이미지"></td>
							<td>상품 B<br>옵션: 초코맛
							</td>
							<td>배송 완료</td>
							<td>
								<button>물품 수령</button>
								<button>리뷰 작성</button>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- 주문 목록 테이블 -->
				<div id="paging">
					<ul>
						<li>◀</li>
						<li>1</li>
						<li>2</li>
						<li>3</li>
						<li>4</li>
						<li>5</li>
						<li>6</li>
						<li>7</li>
						<li>8</li>
						<li>9</li>
						<li>10</li>
						<li>▶</li>
					</ul>
				</div>

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
