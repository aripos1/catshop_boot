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
    <header id ="header">
        <div class="header-container">
            <div class="logo">
                <a href=""><img src="${pageContext.request.contextPath}/assets/images/Layer 1.png" alt="고양이 로고"></a>
                <h1>냐옹아 멍멍해봐</h1>
            </div>
        </div>
    </header>
    <h1><a href=""> ◀ 상품결제 </a></h1>
    <!-- 구매자 정보-->
    <div class ="payUser">
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
        </table>
    
    </div>       

    <!-- 받는 사람 정보-->
    <div class ="recipient">
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
    <div class="orderGoods">
        <table>
                <tr>
                    <td>상품 A <br> 옵션 : 부들부들푸딩 <br> 9/25일 배송 예정</td>
                </tr>
                <tr>
                    <td>상품 B <br> 옵션 : 부들부들푸딩 <br> 9/25일 배송 예정</td>
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
    
    <div class="payment" >
        <h3>결제수단</h3>
        <br>
        <p> <input type="radio" name="pay" id="" value="card">신용카드</p>
        <br>
        <p> <input type="radio" name="pay" id="" value="pay">계좌이체</p>
    </div>
    <br>

    <div class="parent-container"></div>
        <button class="btn" onclick="history.back()">뒤로가기</button>
        <button class="btn" onclick="">결제하기</button>
    </div>
</div>
</body>
</html>