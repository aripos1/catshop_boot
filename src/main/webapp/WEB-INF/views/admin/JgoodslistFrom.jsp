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

		<!-- Axios 라이브러리 포함 -->
		<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
		
		
		<style>
			/* 모달창 배경 회색부분 */
		.modal {
		   width: 100%; /* 가로전체 */
		   height: 100%; /* 세로전체 */
		   display: none; /* 시작할때 숨김처리 */
		   position: fixed; /* 화면에 고정 */
		   left: 0; /* 왼쪽에서 0에서 시작 */
		   top: 0; /* 위쪽에서 0에서 시작 */
		   z-index: 999; /* 제일위에 */
		   overflow: auto; /* 내용이 많으면 스크롤 생김 */
		   background-color: rgba(0, 0, 0, 0.4); /* 배경이 검정색에 반투명 */
		}
		
		/* 모달창 내용 흰색부분 */
		.modal .modal-content {
		   width: 400px;
		   margin: 100px auto; /* 상하 100px, 좌우 가운데 */
		   padding: 0px 20px 20px 20px; /* 안쪽여백 */
		   background-color: #ffffff; /* 배경색 흰색 */
		   border: 1px solid #888888; /* 테두리 모양 색 */
		}
		
		/* 닫기버튼 */
		.modal .modal-content .closeBtn {
		   text-align: right;
		   color: #aaaaaa;
		   font-size: 10px;
		   font-weight: bold;
		   cursor: pointer;
		   border: none;
		}
		
		/*옵션추가버튼*/
		
		#option-plus{
		margin-left: 880px
		}
		
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
                        <input type="text" name="roll" value="${sessionScope.no.roll}">
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
		                                    <td> ${GoodsVo.price} </td>
		                                    
		                                   
			                                <td><a href="${pageContext.request.contextPath}/admin/optionlist?goods_no=${GoodsVo.no}"><button type="submit" class="btn-delete"> 옵션 </button></a> </td>
			                                    	
		                                   
		                                   
		                                </tr>
	                                </c:forEach>
	                                
                            	</tbody>
                           	
                    </table>
                </div>
                <!--상품 content 부분 클릭하면 이벤트로 모달창 띄워서 긴 내용 보여주기..? >>고려해보기-->
                
                <!-- madal창 추가 -->
                
                		<!-- 모달 창 컨텐츠 -->
	           	<div id="myModal" class="modal">
					<form>
		           		<div id="guestbook" class="modal-content">
		                	<button class="closeBtn" type="button">close</button>
		                    	<div  class="m-header" >옵션 (연어맛,참치맛,치킨맛)</div>
		                    	<div class="m-body">
		                       		맛<br><input id="modalPw" class="m-password" type="password" name="password" value=""><br>
		                       		상품번호<br><input id="ModalNo" class="m-no" type="" name="no" value="${GoodsVo.no}">
		                    	</div>
		                    	
		                    	<div class="m-footer">
		                       		<br><button id="btn-delete" class="btnDelete" type="submit">등록하기</button>
		                   		</div>
		                 </div>
					</form>
	             </div>

                <!-- /모달창 끝 -->
                
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