<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/imorderdetail.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<title>주문 상세</title>
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
				<h1>
					<a href="#"> 주문 상세 </a>
				</h1>

				<div class="orderGoods">
					<h3>${receiptVo.paymentDate}주문</h3>
					<table>
						<c:set var="totalOrderPrice" value="0" />
						<c:forEach items="${orderItemList}" var="orderItem">
							<tr>
								<td><img src="${pageContext.request.contextPath}/upload/${orderItem.saveNamef}" alt="제품 상세 이미지"></td>
								<td>${orderItem.goodsName}<br> 옵션: ${orderItem.taste}
								</td>
								<td>수량: ${orderItem.amount}</td>
								<td>${orderItem.eachPrice * orderItem.amount}원</td>
							</tr>
							<c:set var="totalOrderPrice" value="${totalOrderPrice + (orderItem.eachPrice * orderItem.amount)}" />
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
							<td>${totalOrderPrice}원</td>
							<td>0원</td>
							<td>3,000원</td>
							<td>${totalOrderPrice + 3000}원</td>
						</tr>
					</tbody>
				</table>
				<br>
				<p>배송이 완료되면 물품 수령을 눌러주세요~</p>
				<div class="parent-container">
					<button class="btn" onclick="history.back()">뒤로가기</button>
					<!-- 배송 상태 표시 -->
					<input type="hidden" id="deliveryStatus" value="${receiptVo.express}" />
					<button class="btn" onclick="confirmreceipt(${receiptVo.no}, '${receiptVo.express}')">물품 수령</button>


				</div>
			</div>
		</div>

		<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
	</div>



	<script>
	function confirmreceipt(receiptNo, deliveryStatus) {
	    console.log('confirmReceipt 호출됨'); // 함수가 호출되는지 확인
	    console.log('receiptNo:', receiptNo, 'deliveryStatus:', deliveryStatus); // 변수 값 출력

	    // 배송 상태가 '배송중'이 아닐 경우 경고 메시지 표시
	    if (deliveryStatus !== '배송중') {
	        alert('배송중이 아닙니다. 관리자에게 문의하세요.');
	        return;
	    }

	    // 배송중 상태일 경우만 서버에 요청 전송
	    $.ajax({
	        type: "POST",
	        url: "${pageContext.request.contextPath}/order/confirmreceipt",
	        data: {
	            receiptNo: receiptNo
	        },
	        success: function(response) {
	            console.log('AJAX 성공 응답:', response); // 성공 응답 확인
	            if (response.status === "success") {
	                alert('물품 수령이 완료되었습니다.');
	                window.location.href = "${pageContext.request.contextPath}/order/orderlist";
	            } else {
	                alert(response.message);  // 오류 메시지 출력
	            }
	        },
	        error: function(xhr, status, error) {
	            console.log('AJAX 오류:', error); // 오류 확인	
	            alert('서버 오류가 발생했습니다. 다시 시도해 주세요.');
	        }
	    });
	}
	</script>
</body>
</html>