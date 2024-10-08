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
				<a href="${pageContext.request.contextPath}/order/orderlist">주문 목록</a> <a href="${pageContext.request.contextPath}/user/updateform">회원 정보</a>
			</div>

			<div class="content">
				<h1>주문 목록</h1>

				<table>
					<colgroup>
						<col style="width: 150px">
						<col style="width: 150px">
						<col style="width: 100px">
						<col style="width: 100px">

					</colgroup>
					<thead>
						<tr>
							<th>주문일자</th>
							<th>상품 정보</th>
							<th>배송 상태</th>
							<th>상세 보기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${pMap.orderItemList}" var="orderItem">

							<tr class="receipt-row" data-receipt-no="${orderItem.no}">
								<!-- 주문 일자 -->
								<td>${orderItem.paymentDate}</td>

								<!-- 상품 정보 -->
								<td>${orderItem.goodsName}<br> ${orderItem.taste}
								</td>

								<!-- 배송 상태 -->
								<td>${orderItem.express}</td>

								<!-- 상세 보기 버튼 -->
								<td><a href="${pageContext.request.contextPath}/order/orderdetail?receiptNo=${orderItem.no}">상세보기</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="pagination">
					<ul>

						<c:if test="${pMap.prev}">
							<li><a href="${pageContext.request.contextPath}/order/orderlist?crtpage=${pMap.startPageBtnNo-1}">◀</a></li>
						</c:if>

						<c:forEach begin="${pMap.startPageBtnNo}" end="${pMap.endPageBtnNo}" step="1" var="page">
							<c:choose>
								<c:when test="${param.crtpage == page}">
									<li class="active"><a href="${pageContext.request.contextPath}/order/orderlist?crtpage=${page}">${page}</a></li>

								</c:when>
								<c:otherwise>
									<li class=""><a href="${pageContext.request.contextPath}/order/orderlist?crtpage=${page}">${page}</a></li>
								</c:otherwise>

							</c:choose>

						</c:forEach>


						<c:if test="${pMap.next}">
							<li><a href="${pageContext.request.contextPath}/tboard/list2?crtpage=${pMap.endPageBtnNo+1}">▶</a></li>
						</c:if>


					</ul>


					<div class="clear"></div>
				</div>
			</div>
		</div>
		<!— 고정된 뒤로가기 버튼 (왼쪽 하단에 위치) —>
		<button class="back-button" onclick="history.back();">&larr;</button>
		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</div>

	<script>
    document.addEventListener("DOMContentLoaded", function() {
        const rows = document.querySelectorAll(".receipt-row");
        let seenReceipts = new Set(); // 중복된 영수증 번호를 추적할 Set

        rows.forEach(row => {
            const receiptNo = row.getAttribute("data-receipt-no"); // 각 행의 영수증 번호
            if (seenReceipts.has(receiptNo)) {
                row.style.display = "none"; // 이미 본 영수증 번호는 숨김 처리
            } else {
                seenReceipts.add(receiptNo); // 영수증 번호 추가
            }
        });
    });
	</script>



</body>
</html>
