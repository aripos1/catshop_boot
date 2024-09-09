<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/assets/css/imadminorderlist.css" rel="stylesheet" type="text/css">


    <title>주문 관리</title>
    
</head>
<body>
<div id="wrap">
    <!-- 헤더 섹션 -->
		<c:import url="/WEB-INF/views/include/header.jsp"></c:import>
    <!-- 메인 콘텐츠 영역 -->
    <div class="content" >
        <h1>주문 관리</h1>

        <!-- 검색창 -->
        <div class="search-box" >
            <div class="search-bar">
                <select id="searchCriteria">
                    <option>목록</option>
                    <option value="goodsName">상품명으로 검색</option>
                    <option value="goodsContent">상품내용으로 검색</option>
                    <option value="userId">UID로 검색</option>
                    <option value="userName">이름으로 검색</option>
                    <option value="goodsNo">상품번호로 검색</option>
                    <option value="orderDate">주문일자로 검색</option>
                    <option value="deliveryDate">배송일자로 검색</option>
                </select>
                <input type="text" id="searchInput" placeholder="검색어를 입력하세요">
                <button onclick="search()">검색</button>
            </div>

            <!-- 최근 기간 선택 버튼 -->
            <div class="date-filter">
                <button >최근 6개월</button>
                <button >주문완료</button>
                <button >배송중</button>
            </div>
        </div>
        <!-- 주문 목록 테이블 -->
        <table>
            <thead>
                <tr>
                    <th>영수증 번호</th>
                    <th>구매자 UID</th>
                    <th>구매자 이름</th>
                    <th>상품 번호</th>
                    <th>주문 일자</th>
                    <th>배송 일자</th>
                    <th>배송 상태</th>
                    <th>상태 변경</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>13</td>
                    <td>80801234</td>
                    <td>임현성</td>
                    <td>20</td>
                    <td>20240904</td>
                    <td></td>
                    <td>주문완료</td>
                    <td><button>배송 시작</button></td>
                </tr>
                <tr>
                    <td>12</td>
                    <td>80801111</td>
                    <td>진소영</td>
                    <td>10</td>
                    <td>20240904</td>
                    <td></td>
                    <td><a href="https://www.cjlogistics.com/ko/tool/parcel/tracking"> 배송중</a></td>
                    <td></td>
                </tr>
                <tr>
                        <td>11</td>
                        <td>80801234</td>
                        <td>임현성</td>
                        <td>20</td>
                        <td>20240901</td>
                        <td>20240903</td>
                        <td>배송완료</td>
                        <td></td>
                </tr>
                <tr>
                        <td>10</td>
                        <td>80801234</td>
                        <td>임현성</td>
                        <td>20</td>
                        <td>20230822</td>
                        <td>20230824</td>
                        <td>배송완료</td>
                        <td></td>
                </tr>
               
            </tbody>
        </table>

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

</div>
</body>
</html>
