<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/header.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/footer.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/css/goodslist.css" rel="stylesheet" type="text/css">


    </head>

    <body>
        <div id="wrap">
            
		     <!-- import header -->
    <c:import url="/WEB-INF/views/include/header.jsp"></c:import>
    
            <div id="content">
                <!-- 상단-->
                <div id="title">
                    <div id="location" class="clearfix">
                        <h1 id="page_name"><a href="${pageContext.request.contextPath}/goods/list2?category=${param.category}"> AdultFood </a></h1>
                        <p id="totalcount"> 상품 ${requestScope.pMap.goodsTotalCnt}개 </p>
                    </div>
                    <div id="title-dec">
                        <ul class="clearfix">
                            <li>fooder-Adult(category)</li>
                            <li class="main-titletext">|</li>
                            <li class="main-titletext"><a href="">HOME</a></li>
                        </ul>

                    </div>
                </div>

                
                <!--- 이미지 반복 영역 -->
                <div id="gallery">
                    <ul id="viewArea" class="clearfix">
                        
                       <c:forEach items="${requestScope.pMap.goodsList2}" var="goodsVo" >
	                        <li>
	                            <a href="">
	                                <div class="view">
	                                    <img class="imgItem" src="${pageContext.request.contextPath}/assets/images/">
	                                    <div class="imgName">${goodsVo.name}</div>
	                                    <div class="imgContent">${goodsVo.content}</div>
	                                    <div class="imgPrice">${goodsVo.price}</div>
	                                </div>
	                            </a>
	                        </li>
                       </c:forEach>
                    </ul>
                </div>
                <!--- /이미지 반복 영역 끝 -->

                <!--페이징 부분-->
                <div id="pagingArea">    
                    <div id="paging">
                        <ul class="clearfix">
                            <c:if test="${requestScope.pMap.prev}">
                            	<li class="page_move"><a href="${pageContext.request.contextPath}/catshop/list2?page=${requestScope.pMap.startPageBtnNo-1}">◀</a></li>
                            </c:if>
                            
                            <c:forEach begin="${requestScope.pMap.startPageBtnNo }" end="${requestScope.pMap.endPageBtnNo }" step="1" var="page">
                            	
                            	<c:choose>
                            		<c:when test="${param.page == page }">	
                            			<li class="active"><a href="${pageContext.request.contextPath}/goods/list2?page=${page}&keyword=${param.keyword}"> ${page}</a></li>
                            		</c:when>
                            		<c:otherwise>
                            			<li><a href="${pageContext.request.contextPath}/goods/list2?page=${page}&keyword=${param.keyword}"> ${page}</a></li>
                            		</c:otherwise>
                            	</c:choose>
                            </c:forEach>
                            
                            <c:if test="${requestScope.pMap.next}">
                            	<li class="page_move"><a href="${pageContext.request.contextPath}/catshop/list2?page=${requestScope.pMap.endPageBtnNo-1}">▶</a></li>
                            </c:if>
                            
                        </ul>
                    </div>
                </div>
                <!-- /페이징 부분-->

            </div>
            <!-- /content-->

            <!-- 푸터-->
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
            <!-- /푸터-->

        </div>
        <!-- /wrap -->
        

    </body>
</html>