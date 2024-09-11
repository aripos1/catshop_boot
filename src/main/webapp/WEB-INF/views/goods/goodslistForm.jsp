<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


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
            
            <!-- 고정된 위로가기 버튼 (왼쪽 하단에 위치) -->
			<button class="back-button" onclick="window.scrollTo({top: 0, behavior: 'smooth'});">&uarr; Top</button>
		     <!-- import header -->
    <c:import url="/WEB-INF/views/include/header.jsp"></c:import>
    
            <div id="content">
                <!-- 상단-->
                <div id="title">
                    <div id="location" class="clearfix">
                        <c:choose>
                        	<c:when test="${param.category == 'ADULT' }">
                        		<h1 id="page_name"><a href="${pageContext.request.contextPath}/goods/list2?category=${param.category}"> Fooder - Adult </a></h1>
                        	</c:when>
                        	<c:when test="${param.category == 'KITTEN' }">
                        		<h1 id="page_name"><a href="${pageContext.request.contextPath}/goods/list2?category=${param.category}"> Fooder - Kitten </a></h1>
                        	</c:when>
                        	<c:when test="${param.category == 'CAN' }">
                        		<h1 id="page_name"><a href="${pageContext.request.contextPath}/goods/list2?category=${param.category}"> Snack - Can </a></h1>
                        	</c:when>
                        	<c:when test="${param.category == 'CHURR' }">
                        		<h1 id="page_name"><a href="${pageContext.request.contextPath}/goods/list2?category=${param.category}"> Snack - Churr </a></h1>
                        	</c:when>
                        	
                        	<c:otherwise>
                        		<h1 id="page_name"><a href="${pageContext.request.contextPath}/goods/list2?category=${param.category}"> 검색상품 </a></h1>
                        	</c:otherwise>
                       </c:choose> 
                        <p id="totalcount"> 총상품: ${requestScope.pMap.goodsTotalCnt}개 </p> 
                    </div>
                    <div id="title-dec">
                        <ul class="clearfix">
							<li class="main-titletext"><a href="${pageContext.request.contextPath}/main">HOME</a></li>
                            <li class="main-titletext">|</li>
                        </ul>

                    </div>
                </div>
                
                <!--- 이미지 반복 영역 -->
                <div id="gallery">
                    <ul id="viewArea" class="clearfix">
                        
                       <c:forEach items="${requestScope.pMap.goodsList2}" var="goodsVo" >
	                        <li >
	                            <a href="${pageContext.request.contextPath}/productinfo?goodsNo=${goodsVo.no}">
	                                <div class="view">
	                                    <img class="imgItem" src="${pageContext.request.contextPath}/upload/${goodsVo.saveNamef}">
	                                    <div class="imgName">${goodsVo.name}</div><br>
	                                    <div class="imgContent">${goodsVo.content}</div><br>
	                                    <div class="imgPrice">
	                                    <fmt:formatNumber value="${goodsVo.price}" type="number" groupingUsed="true"/>원
	                                    </div>
	                                
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
                            	<li class="page_move"><a href="${pageContext.request.contextPath}/goods/list2?page=${requestScope.pMap.startPageBtnNo-1}">◀</a></li>
                            </c:if>
                            
                            <c:forEach begin="${requestScope.pMap.startPageBtnNo }" end="${requestScope.pMap.endPageBtnNo }" step="1" var="page">
                            	
                            	<c:choose>
                            		<c:when test="${param.page == page }">	
                            			<li class="active"><a href="${pageContext.request.contextPath}/goods/list2?page=${page}&keyword=${param.keyword}&category=${param.category}"> ${page}</a></li>
                            		</c:when>
                            		<c:otherwise>
                            			<li><a href="${pageContext.request.contextPath}/goods/list2?page=${page}&keyword=${param.keyword}&category=${param.category}"> ${page}</a></li>
                            		</c:otherwise>
                            	</c:choose>
                            </c:forEach>
                            
                            <c:if test="${requestScope.pMap.next}">
                            	<li class="page_move"><a href="${pageContext.request.contextPath}/goods/list2?page=${requestScope.pMap.endPageBtnNo+1}">▶</a></li>
                            </c:if>
                            
                        </ul>
                    </div>
                </div>
                <!-- /페이징 부분-->

            </div>
            <!-- /content-->

            <!-- 푸터-->
            <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
            <!-- /푸터-->

        </div>
        <!-- /wrap -->-
        

    </body>
</html>