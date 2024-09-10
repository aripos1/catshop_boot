<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/imadminorderlist.css" rel="stylesheet" type="text/css">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<title>주문 관리</title>
</head>
<body>
	<div id="wrap">
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>


		<div class="content">
			<h1>주문 관리</h1>

			<table>
				<thead>
					<tr>
						<th>영수증 번호</th>
						<th>구매자 UID</th>
						<th>구매자 이름</th>
						<th>주문 일자</th>
						<th>총 금액</th>
						<th>배송 상태</th>
						<th>상태 변경</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${receiptList}" var="receipt">
						<tr>
							<td>${receipt.no}</td>
							<td>${receipt.userNo}</td>
							<td>${receipt.userName}</td>
							<td>${receipt.paymentDate}</td>
							<td>${receipt.totalPrice}원</td>
							<td class="delivery-status">${receipt.express}</td>
							<td><c:if test="${receipt.express == '주문완료'}">
									<button onclick="startDelivery(${receipt.no}, this)">배송 시작</button>
								</c:if></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script>
        // 배송 시작 버튼 클릭 시 AJAX 요청
        function startDelivery(receiptNo, buttonElement) {
            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/startdelivery",
                data: { receiptNo: receiptNo },
                success: function(response) {
                    // 성공 시 무조건 새로고침
                    location.reload();
                },
                error: function() {
                    // 실패 시에도 무조건 새로고침
                    location.reload();
                }
            });
        }
    </script>

</body>
</html>
