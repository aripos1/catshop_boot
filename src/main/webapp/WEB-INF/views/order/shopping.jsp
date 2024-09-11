<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>장바구니</title>
<link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/assets/css/imshopping.css" rel="stylesheet" type="text/css">
<!-- jQuery 라이브러리 추가 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>
	<div id="wrap">

		<header id="header">
			<div class="header-container">
				<div class="logo">
					<a href="${pageContext.request.contextPath}/main"><img src="${pageContext.request.contextPath}/assets/images/Layer 1.png" alt="고양이 로고"></a>
					<h1>야옹이 멍멍해봐</h1>
				</div>
			</div>
		</header>

		<h1>
			<a href="${pageContext.request.contextPath}/goods/list2"> ◀ 장바구니 </a>
		</h1>
		<form id="cartForm" action="${pageContext.request.contextPath}/order/payform" method="get">
			<table>
				<colgroup>
					<col style="width: 20px">
					<col style="width: 150px">
					<col style="width: 150px">
					<col style="width: 100px">
					<col style="width: 100px">
					<col style="width: 100px">
					<col style="width: 50px">
				</colgroup>
				<thead>
					<tr>
						<th><input type="checkbox" id="select-all-checkbox"> <!-- 모두 선택/해제 체크박스 --></th>
						<th colspan="2">상품명</th>
						<th>가격</th>
						<th>수량</th>
						<th>총액</th>
						<th>삭제</th>
					</tr>
				</thead>

				<tbody id="shoppingCartBody">
					<c:forEach items="${shoppingList}" var="shoppingVo">
						<tr id="row-${shoppingVo.shoppingNo}">
							<td><input type="checkbox" name="selectedItems" value="${shoppingVo.shoppingNo}"></td>
							<td><img src="${pageContext.request.contextPath}/upload/${shoppingVo.saveNamef}" alt="제품 상세 이미지"></td>
							<td>${shoppingVo.goodsName}<br> 옵션 : ${shoppingVo.taste}<br> 담은 날짜 : ${shoppingVo.pickDate}<br>
							</td>
							<td class="item-price">${shoppingVo.price}원</td>
							<td><input type="number" value="${shoppingVo.count}" min="1" style="width: 50px;" data-shopping-no="${shoppingVo.shoppingNo}"
								onchange="updateQuantity(this)"></td>
							<td><span class="item-total">${shoppingVo.price * shoppingVo.count}원</span></td>
							<td><button type="button" class="btn btn-remove" data-shopping-no="${shoppingVo.shoppingNo}">삭제</button></td>
						</tr>
					</c:forEach>
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
						<th>결제예정금액</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td id="orderAmount">0원</td>
						<!-- 주문 금액 -->
						<td>0원</td>
						<!-- 현재 할인을 0원으로 고정 -->
						<td>3000원</td>
						<!-- 고정된 배송비 -->
						<td id="finalAmount">3000원</td>
						<!-- 결제 예상 금액 -->
					</tr>
				</tbody>
			</table>
			<br>
			<div class="parent-container">
				<input type="button" class="btn" value="뒤로가기" onclick="history.back();">
				<button class="btn" type="submit">결제하기</button>
			</div>
		</form>
		<!— 고정된 뒤로가기 버튼 (왼쪽 하단에 위치) —>
		<button class="back-button" onclick="history.back();">&larr;</button>
	</div>

	<script>
		// DOM 로드 후 실행
		document.addEventListener('DOMContentLoaded', function() {
			// 모두 선택/해제 이벤트
			document.getElementById('select-all-checkbox').addEventListener('change', function() {
				toggleSelectAll(this);
				updateFinalAmount();
			});

			// 개별 체크박스 선택 시 주문 금액 업데이트
			document.querySelectorAll('input[name="selectedItems"]').forEach(checkbox => {
				checkbox.addEventListener('change', updateFinalAmount);
			});

			// 수량 변경 이벤트 리스너
			document.querySelectorAll('input[type="number"]').forEach(input => {
				input.addEventListener('change', function() {
					updateItemTotal(this);
				});
			});

			// 삭제 버튼 이벤트 리스너
			document.querySelectorAll('.btn.btn-remove').forEach(button => {
				button.addEventListener('click', function() {
					const shoppingNo = this.getAttribute('data-shopping-no');
					deleteItem(shoppingNo);
				});
			});

			  // form 제출 시 체크된 항목만 서버로 전송
	        document.getElementById('cartForm').addEventListener('submit', function(event) {
	            event.preventDefault();  // 기본 제출 동작 방지
	            const selectedItems = document.querySelectorAll('input[name="selectedItems"]:checked');

	            if (selectedItems.length === 0) {
	                alert("선택된 상품이 없습니다.");
	                return;
	            }

	            // 선택된 항목만 form에 추가
	            selectedItems.forEach(item => {
	                const shoppingNo = item.value;
	                const input = document.createElement('input');
	                input.type = 'hidden';
	                input.name = 'shoppingNo';  // Controller에서 받아야 할 이름
	                input.value = shoppingNo;
	                this.appendChild(input);
	            });

	            this.submit();  // 폼 제출
	        });
	    });

		function updateQuantity(inputElement) {
		    const shoppingNo = inputElement.getAttribute('data-shopping-no');  // 해당 상품의 shoppingNo
		    const newCount = inputElement.value;  // 변경된 수량

		    // AJAX 요청으로 서버에 새로운 수량 전송 (알람 없이 DB에 저장)
		    $.ajax({
		        url: `${pageContext.request.contextPath}/shopping/updateQuantity`,  // 서버의 업데이트 엔드포인트
		        type: 'POST',
		        data: {
		            shoppingNo: shoppingNo,
		            count: newCount
		        },
		        success: function(response) {
		            // 수량이 성공적으로 업데이트되었으므로 별도 알람 없음
		        },
		        error: function(xhr, status, error) {
		            console.error("수량 업데이트 중 오류 발생:", error);
		        }
		    });
		}

		// 모두 선택/해제 처리
		function toggleSelectAll(checkbox) {
			const checkboxes = document.querySelectorAll('input[name="selectedItems"]');
			checkboxes.forEach(item => {
				item.checked = checkbox.checked;
			});
		}

		// 수량 변경 시 총액 업데이트
		function updateItemTotal(inputElement) {
			const row = inputElement.closest('tr');
			const priceElement = row.querySelector('.item-price');
			const totalElement = row.querySelector('.item-total');
			const price = parseFloat(priceElement.textContent.replace('원', '').trim());
			const count = parseInt(inputElement.value);

			if (!isNaN(price) && !isNaN(count)) {
				const total = price * count;
				totalElement.textContent = total + '원';
			} else {
				totalElement.textContent = '0원';
			}

			updateFinalAmount();  // 전체 금액 업데이트
		}

		// 최종 결제 금액 업데이트
		function updateFinalAmount() {
			const checkboxes = document.querySelectorAll('input[name="selectedItems"]:checked');
			let orderAmount = 0;

			checkboxes.forEach(checkbox => {
				const row = checkbox.closest('tr');
				const totalElement = row.querySelector('.item-total');
				const total = parseInt(totalElement.textContent.replace('원', '').trim());
				orderAmount += total;
			});

			document.getElementById('orderAmount').textContent = orderAmount+'원';
			const finalAmount = orderAmount + 3000;  // 고정된 배송비 추가
			document.getElementById('finalAmount').textContent = finalAmount+'원';
		}

		// 상품 삭제 처리
		function deleteItem(shoppingNo) {
			$.ajax({
				url: `${pageContext.request.contextPath}/shopping/delete`,
				type: 'POST',
				data: { shoppingNo: shoppingNo },
				success: function() {
					// 삭제 성공 시 해당 행을 삭제
					location.reload();
				},
				error: function(xhr, status, error) {
					console.error("삭제 실패:", error);
					alert("삭제하는 중 오류가 발생했습니다.");
				}
			});
		}
		
		
	</script>
</body>
</html>
