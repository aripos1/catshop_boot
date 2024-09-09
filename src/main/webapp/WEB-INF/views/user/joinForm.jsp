<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/joinForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
</head>

<body>
    <div id="wrap">

       <div id="logo">
            <img id="img" src="../assets/images/logo.png" alt="고양이 로고">
       </div> 
        <h2>회원가입</h2>

    <div class="content">
        <div id="joinFormBox">
            <form action="${pageContext.request.contextPath}/user/join"  method="get">
            <div>
                <label class="form-text" for="input-id">아이디</label>                 
                <div id= "id">
                  <input type="text" id="input-id" name="id" placeholder="아이디를 입력하세요" required>
                  <button id="idcheck">중복확인</button>
                </div>    
            </div>
            <div class="form-group">
                <label class="form-text" for="input-password">비밀번호</label>
                <input type="text" id="input-password" name="password" placeholder="비밀번호를 입력하세요" required>
            </div>

            <div class="form-group">
                <label class="form-text" for="input-name">성함</label>
                <input type="text" id="input-name" name="name" placeholder="성함을 입력하세요" required>
            </div> 
            
            <div class="form-group">
                <label class="form-text" for="input-hp">전화번호</label>
                <input type="text" id="input-hp" name="hp" placeholder="전화번호를 입력하세요" required>
            </div>
            
            <div>
                <label class="form-text" for="input-address">주소</label>
                <input type="text" id="input-address" name="address" placeholder="주소를 입력하세요" required>
            </div>   

            <button type="submit">입력 완료</button>
        </form>
   		</div>
   	  </div> 
	</div>
<c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
</body>
</html>