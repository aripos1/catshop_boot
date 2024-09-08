<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>로그인</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/hdrlogin.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/footer.css">
    </head>

    <body>
        <div id="wrap">
            <div id="logo">
                <img id="img" src="${pageContext.request.contextPath}/assets/images/logo.png" alt="고양이 로고">
            </div>
                <h2>회원가입을 축하합니다</h2>
            
            <div class="content">
            
                <div id="loginFormBox">

                    <form>
                        
                           <p>회원가입을 환영합니다! 지금 바로 로그인하세요!</p>
                    </form>
                 
                       <p class="joinrequest"><a href="${pageContext.request.contextPath}/user/loginform">로그인</a></p>
                    <!--footer-->
                    
                       
                    </div>
                </div>
  	  <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
    
    </body>
</html>