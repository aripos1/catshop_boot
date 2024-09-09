<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="${pageContext.request.contextPath}/assets/css/reset.css" rel="stylesheet" type="">
    <link href="${pageContext.request.contextPath}/assets/css/header.css" rel="stylesheet" type="">
    <link href="${pageContext.request.contextPath}/assets/css/insert.css" rel="stylesheet" type="">
    <title>제품 등록 페이지</title>
</head>

<body>
<div id="wrap">
    <c:import url="/WEB-INF/views/include/header.jsp"></c:import>

<!-- 컨테이너 시작 -->
		<div class="container">

    <!-- Image Preview Section -->
    		<form action="${pageContext.request.contextPath}/admin/upload" method="post" enctype="multipart/form-data">
    			<div class="img-container">
    				<div class="form-group-img">
        				<img src="${pageContext.request.contextPath}/upload/${requestScope.saveName}" alt="이미지 미리보기">
    				</div>

    <!-- Product Image Upload --> <!-- 첨부파일에는 꼭 붙여줘야 한다.  보안용 -->
     				<div class="images">
    					 <div id="file">
     						<div class="form-img-uprod">
   								<div class="form-group">
        							<input type="file" name="file">
    							</div>
     						</div>
     					</div>

    <!-- Detail Image Upload -->
    					<div class="form-img-uprod">
       						 <input type="file" name="file2">
    					</div>
					</div>
     			</div>

    <!-- Product Name -->
    			<div class="form-group">
        			<label for="productName">상품명</label>
        			<input id="input-uname" type="text" name="name" value="">
    			</div>

    <!-- Content -->
    			<div class="form-group">
       				 <label for="content">제품설명</label>
        			 <input id="input-uname" type="text" name="content" value="">
    			</div>

    <!-- Price -->
    			<div class="form-group">
        			<label for="price">가격</label>
        			<input id="input-uname" type="text" name="price" value="">
    			</div>

    <!-- Category Selection -->
    			<div class="form-group category-section">
        			<label for="category">카테고리</label>
        			<select id="category" type="text" name="category" value="">
           			 	<option value="성인사료">으른사료</option>
           			 	<option value="아기사료">아기사료</option>
           			 	<option value="성인사료">캔</option>
           			 	<option value="아기사료">츄르</option>
        			</select>
    			</div>
    <!-- Button Group -->
    			<div class="button-group">
        			<button type="submit">등록</button>
        			<button class="cancel-btn" href="" >취소</button>
    			</div>
   			 </form>
		</div>
<!-- 컨테이너 닫힘 -->
		</div>
	</body>
</html>