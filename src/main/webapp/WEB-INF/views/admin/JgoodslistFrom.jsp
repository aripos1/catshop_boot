<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


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

		<!-- Axios 라이브러리 포함 -->
		<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		
		
		<style>
		
		</style>
		
    </head>

    <body>
        <div id="wrap">

            <!-- import header -->
    <c:import url="/WEB-INF/views/include/header.jsp"></c:import>
            
            <div id="content">
                <div id="sub_title">
                    <div id="name_title" class="clearfix">
                        <h1 id="goodslist"> 상품관리 리스트 </h1>
                        <input type="hidden" name="roll" value="${sessionScope.no.roll}">
                    </div>

                    <form action="${pageContext.request.contextPath}/admin/list2" method="get">
                        <div id="form-group" class="clearfix">
                            
                            <div id="serch_text">
                                <input type="text" name="keyword" value="">
                                <button type="submit" id="btn-search"> 검색 </button>
                            </div>

                            <select id="search_menu" name="category">
								<option value="">카테고리선택</option>
                                <option value="ADULT">ADULT</option>
                                <option value="KITTEN">KITTEN</option>
                                <option value="CAN">CAN</option>
                                <option value="CHURR">CHURR</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div id="list-table">
                    <table id="one">
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
		                                    <td>
		                                    	<fmt:formatNumber value="${GoodsVo.price}" type="number" groupingUsed="true"/>원
		                                     </td>
		                                    
		                                   
			                                <td><a href="${pageContext.request.contextPath}/admin/optionlist?goods_no=${GoodsVo.no}"><button type="submit" class="btn-delete"> 옵션 </button></a> </td>
			                                    	
		                                   
		                                   
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
                            	<li class="page_move"><a href="${pageContext.request.contextPath}/admin/list2?page=${requestScope.jmap.startPageBtnNo-1}">◀</a></li>
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
                            	<li class="page_move"><a href="${pageContext.request.contextPath}/admin/list2?page=${requestScope.jmap.endPageBtnNo+1}">▶</a></li>
                            </c:if>
                            
                        </ul>
                    </div>
                </div>
                <!-- /페이징 부분-->
                
            
            </div>
            <!--/content-->

            <!--footer-->
             <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
            <!--/footer-->

        </div>
        <!-- /wrap-->
        
        <script>
        document.addEventListener('DOMContentLoaded',function(){
        
        //insert btn :모달창 띄우기
        let insertBtn = document.querySelector('.btn-option');
        insertBtn.addEventListener('click',callmodal)
        
        //모달창 띄우기
        
        
        
        //<<코드정리>>
        function callmodal(event){
        	console.log(event.target.tagName);
        	
        	if(event.target.tagName == 'BUTTON'){
        		console.log('꾸욱');
        	}
        	
        }
        
        		
        });
        
        
        </script>
        
    </body>

</html>