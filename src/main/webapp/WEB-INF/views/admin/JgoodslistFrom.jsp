<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" >
        <link href="${pageContext.request.contextPath}/assets/css/header.css" rel="stylesheet" >
        <link href="${pageContext.request.contextPath}/assets/css/footer.css" rel="stylesheet" >
        <link href="${pageContext.request.contextPath}/assets/css/Jjinadmingoodslist.css" rel="stylesheet" type="text/css">

    </head>

    <body>
        <div id="wrap">

            <!--header-->
            <header id ="header">
                <div class="header-container">
                    <div class="logo">
                        <img src="../../assets/images/Layer 1.png" alt="고양이 로고">
                        <h1>야옹이 멍멍해봐</h1>
                    </div>
                
                    <!-- 비회원     -->
                    <div class="menu">
                        <button>로그인</button>
                        <button>회원가입</button>
                    </div>
                
                    <!-- 회원 
                    <div class="menu">
                        <P>집사님 어서오세요.</P>
                        <button>마이페이지</button>
                        <button>로그아웃</button>
                    </div>
                     -->
                    <!-- 관리자 
                    <div class="menu">
                        <P>관리자님 어서오세요.</P>
                        <button>상품등록</button>
                        <button>상품관리</button>
                        <button>주문관리</button>
                        <button>로그아웃</button>
                    </div>
               -->
                    <br>
                    <div class="search">
                        <input type="text" placeholder="문자열을 검색하세요!">
                        <button class="search-btn">🔍</button>
                    </div>
                </div>
                
                <div class="nav-menu">
                    <ul>
                        <li><h2>사료</h2></li>
                        <li><a href="#">성인묘</a></li>
                        <li><a href="#">아가묘</a></li>
                        <li><h2>간식</h2></li>
                        <li><a href="#">캔</a></li>
                        <li><a href="#">츄르</a></li>
                    </ul>
                </div>
        
            </header>
        <!--/header-->
            <div id="content">
                <div id="sub_title">
                    <div id="name_title" class="clearfix">
                        <h1 id="goodslist"> 상품관리 리스트 </h1>
                        <input type="text" name="roll" value="${sessionScope.no.roll}">
                    </div>

                    <form action="${pageContext.request.contextPath}/admin/list2" method="get">
                        <div id="form-group" class="clearfix">
                            
                            <div id="serch_text">
                                <input type="text" name="keyword" value="">
                                <button type="submit" id="btn-search"> 검색 </button>
                            </div>

                            <select id="search_menu" name="category">
                                <option>카테고리</option>
                                <option value="a">a</option>
                                <option value="d">d</option>
                                <option value="category">can</option>
                                <option value="category">churr</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div id="list-table">
                    <table>
                        <colgroup>
                            <col style="width: 80px" >
                            <col style="width: 100px">
                            <col style="width: 130px">
                            <col style="width: 150px">
                            <col style="width: 340px">
                            <col style="width: 100px">
                        </colgroup> 
                            <thead>
                                <tr>
                                    <th> 번호 </th>
                                    <th> 카테고리 </th>
                                    <th> 상품이름 </th>
                                    <th> 등록날짜 </th>
                                    <th> 글제목 </th>
                                    <th> 상품가격 </th>
                                </tr>
                            </thead>
                            
                            	<tbody>
                            		<c:forEach items="${requestScope.jmap.admingoodsList}" var="GoodsVo">	
	                                	<tr>
		                                    <td> ${GoodsVo.no} </td>
		                                    <td> ${GoodsVo.category} </td>
		                                    <td> ${GoodsVo.name} </td>
		                                    <td> ${GoodsVo.regDate} </td>
		                                    <td> ${GoodsVo.content} </td>
		                                    <td> ${GoodsVo.price} </td>
		                                    <td><a href=""><button type="submit" id="btn-delete"> 삭제 </button></a> </td>
		                                </tr>
	                                </c:forEach>
                            	</tbody>
                           	
                    </table>
                </div>
                <!--상품 content 부분 클릭하면 이벤트로 모달창 띄워서 긴 내용 보여주기..? >>고려해보기-->
                
                <!--페이징 부분-->
                <div id="pagingArea">    
                    <div id="paging">
                        <ul class="clearfix">
                            
                            <c:if test="${requestScope.jmap.prev}">
                            	<li class="page_move"><a href="${pageContext.request.contextPath}/catshop/admin/list2?page=${requestScope.jmap.startPageBtnNo-1}">◀</a></li>
                            </c:if>
                            <c:forEach begin="${requestScope.jmap.startPageBtnNo }" end="${requestScope.jmap.endPageBtnNo }" step="1" var="page">
                            	<c:choose>
                            		<c:when test="${param.page == page}">
                            			<li class="active"><a href="${pageContext.request.contextPath}/admin/list2?page=${page}&category=${param.category}&keyword=${param.keyword}"> ${page} </a></li>
                            		</c:when>
                            		<c:otherwise>
                            			<li><a href="${pageContext.request.contextPath}/admin/list2?page=${page}&category=${param.category}&keyword=${param.keyword}"> ${page} </a></li>
                            		</c:otherwise>
                            	
                            	</c:choose>
                          	</c:forEach>
                            <c:if test="${requestScope.jmap.next}">
                            	<li class="page_move"><a href="${pageContext.request.contextPath}/catshop/admin/list2?page=${requestScope.jmap.endPageBtnNo+1}">▶</a></li>
                            </c:if>
                            
                        </ul>
                    </div>
                </div>
                <!-- /페이징 부분-->
                
            
            </div>
            <!--/content-->

            <!--footer-->
            <footer>
                <div class="footer-container">
                    <div class="footer-logo">
                        <img src="/catprofile.jpg" alt="고양이 로고">
                    </div>
                    <div class="footer-info">
                        <p>
                            (주)냐옹아 멍멍해봐 | 대표이사: 김덕배<br>
                            서울시 강남대로 40번지 통영빌딩 32층<br>
                            사업자 등록번호: 887-87-00578<br>
                            통신판매업 신고: 2017-서울특별시-00808호<br>
                            ©catmung Inc. All Rights Reserved.
                        </p>
                    </div>
                    <div class="footer-contact">
                        <p>
                            고객센터: 1888-3010<br>
                            운영시간: 평일 09:00 ~ 17:30<br>
                            점심시간: 12:00 ~ 13:00<br>
                            고객지원: 토, 일 / 공휴일 휴무<br>
                        </p>
                    </div>
                </div>
            </footer>
            <!--/footer-->

        </div>
        <!-- /wrap-->
    </body>

</html>