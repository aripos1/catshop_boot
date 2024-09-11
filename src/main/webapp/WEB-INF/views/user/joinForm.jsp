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

   <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
</head>

<body>
    <div id="wrap">
        <div id="logo">
           <a href ="${pageContext.request.contextPath}/main">
             <img id="img" src="${pageContext.request.contextPath}/assets/images/Layer 1.png" alt="고양이 로고">
            </a>
        </div>
        <h2>회원가입</h2>

        <div class="content">
            <div id="joinFormBox">
                <form action="${pageContext.request.contextPath}/user/join" method="get">
                    <div class="form-group">
                        <label class="form-text" for="input-id">아이디</label>
                        <div class="input-with-button">
                            <input type="text" id="input-id" name="id" placeholder="아이디를 입력하세요" required>
                            <button id="idcheck" type="button">중복확인</button> 
                        </div>
                        <div id="message"></div>
                    </div>

                    <div class="form-group">
                        <label class="form-text" for="input-password">비밀번호</label>
                        <input type="password" id="input-password" name="password" placeholder="비밀번호를 입력하세요" required>
                    </div>

                    <div class="form-group">
                        <label class="form-text" for="input-name">성함</label>
                        <input type="text" id="input-name" name="name" placeholder="성함을 입력하세요" required>
                    </div> 
                    
                    <div class="form-group">
                        <label class="form-text" for="input-hp">전화번호</label>
                        <input type="text" id="input-hp" name="hp" placeholder="전화번호를 입력하세요" required>
                    </div>

                    <div class="form-group">
                        <label class="form-text" for="input-address">주소</label>
                        <input type="text" id="input-address" name="address" placeholder="주소를 입력하세요" required>
                    </div>

                    <button type="submit" class="submit-btn">입력 완료</button>
                </form>
            </div>
        </div> 
    </div>


    <script>
        document.addEventListener('DOMContentLoaded', function() {
            console.log("DOM 로드");
            
            let btnDuplicate = document.querySelector('#idcheck');
            let joinForm = document.querySelector('form');
            let isIdValid = false; // 아이디 유효성 변수

            let contextPath = "${pageContext.request.contextPath}";

            btnDuplicate.addEventListener('click', function(event){
                event.preventDefault(); // 기본 동작 방지
                console.log('클릭');

                let txtIdTag = document.querySelector('#input-id'); 
                let id = txtIdTag.value;
                console.log('uid');

                axios({
                    method: 'get',
                    url: contextPath + '/api/user/duplicate',
                    headers: {"Content-Type" : "application/json; charset=utf-8"},
                    params: {id: id},
                    responseType: 'json'
                }).then(function (response) {
                    console.log(response.data);
                    let can = response.data;
                    let messageTag = document.querySelector('#message');
                    
                    if(can == true){
                        messageTag.textContent = "사용할 수 있는 아이디입니다.";
                        messageTag.style.color = "#007bff";
                        isIdValid = true; // 아이디 유효성 설정
                    } else {
                        messageTag.textContent = "다른 아이디를 사용해주세요";
                        messageTag.style.color = "#ff4500";
                        isIdValid = false; // 아이디 유효성 설정
                    }
                }).catch(function (error) {
                    console.log(error);
                });
            });

            joinForm.addEventListener('submit', function(event) {
                if (!isIdValid) {
                    event.preventDefault(); // 폼 제출 방지
                    alert("중복된 아이디는 사용할 수 없습니다."); 
                }
            });
        });
    </script>
</body>
</html>
