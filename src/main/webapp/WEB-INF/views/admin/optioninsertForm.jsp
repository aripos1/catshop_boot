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

            <!-- import header -->
    <c:import url="/WEB-INF/views/include/header.jsp"></c:import>
            
        <!--/header-->
            <div id="content">
                <div class="option-box" id="sub_title">
                    <div id="name_title" class="clearfix">
                        <h1 id="goodslist"> 옵션등록 </h1>
                    </div>
                    <div>
                        <span>상품 no값</span>
                        <span> 상품 name </span>

                    </div>

                    <form action="${pageContext.request.contextPath}/admin/insert" method="get">
                        <div class="form-box">
                           <label for="option-salmon"> 맛선택 </label>
                           <input type="text" id="option-salmon" name="taste" value="">
                        </div>
                         <div id="btninsert-area">
                            <button type="submit" id="btn-insertoption"> 등록하기 </button>
                            <input type="text" name="goods_no" value="${param.goods_no}">
                          
                         </div>
                    </form>
                </div>
                <div id="list-table">
                    <table id="two">
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
                                    <th> 상품번호 </th>
                                    <th> 카테고리 </th>
                                    <th> 상품이름 </th>
                                    <th> 옵션 </th>
                                    <th> 상품가격 </th>
                                    <th> 등록일자 </th>
                                </tr>
                            </thead>
                            <tbody>
                            	<c:forEach items="${requestScope.optionList}" var="JOptionVo">
	                                <tr>
	                                    <td> ${JOptionVo.goods_no} </td>
	                                    <td> ${JOptionVo.category } </td>
	                                    <td> ${JOptionVo.name} </td>
	                                    <td> ${JOptionVo.taste} </td>
	                                    <td> ${JOptionVo.price} </td>
	                                    <td> ${JOptionVo.regDate} </td>
	                                    <td><input type="hidden"></td>
	                                   <!-- <form action="${pageContext.request.contextPath}/admin/delete" method="get">
	                                    	<td><button type="submit" id="btn-delete"> 삭제 </button></td>
	                                    	<input type="text" name="goods_no" value="${JOptionVo.no }">
	                                	</form>-->
	                                </tr>
                               </c:forEach>
                            </tbody>
                    </table>
                </div>
                <!--상품 content 부분 클릭하면 이벤트로 모달창 띄워서 긴 내용 보여주기..? >>고려해보기-->
                
                <!--페이징 부분-->
                <div id="option-area">    
                    <div id="paging">
                        <ul class="clearfix">
                            <a href="${pageContext.request.contextPath}/admin/list2"><button type="button">뒤로가기</button></a>
                           
                            
                            <li class="page_move"><a href="">▶</a></li>
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
        // 
        $(document).ready(function() {
            // ID가 btn-insertoption인 버튼에 클릭 이벤트 핸들러 추가
            $('#btn-insertoption').on('click', function() {
                // 클릭 시 alert 창 띄우기
                alert('Button clicked!');
            });
        });
    </script>
    </body>

</html>