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
                <img id="img" src="${pageContext.request.contextPath}/assets/images/Layer 1.png" alt="고양이 로고">
            </div>
                <h2>로그인</h2>
            
            <div class="content">
            
                <div id="loginFormBox">

                    <form action="${pageContext.request.contextPath}/user/login" method="get">
                        
                            <label class="form-text" for="input-id">아이디</label>
                            <input type="text" id="input-id" name="id" value="" placeholder="아이디를 입력하세요" required><!--입력하지 않고 로그인버튼을 누르면 입력하세요 라고 하는 기능이 존재합니다. -->

                            <label class="form-text" for="input-password">비밀번호</label>
                            <input type="text" id="input-password" name="password" value="" placeholder="비밀번호를 입력하세요" required>
                            <br>
                            <button type="submit">로그인</button>
                        
                    </form>
                    <p class="joinMsg">아직 회원이 아니신가요?</p>
                       <p class="joinrequest"><a href="">가입하세요!</a></p>
                    <!--footer-->
                    <c:import url="/WEB-INF/views/include/footer.jsp"></c:import>
                        </div>
                    </div>
                </div>
    </body>
</html>