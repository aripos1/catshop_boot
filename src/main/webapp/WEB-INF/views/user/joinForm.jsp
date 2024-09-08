<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="../assets/css/reset.css">
    <link rel="stylesheet" href="../assets/css/joinForm.css">
    <link rel="stylesheet" href="../assets/css/footer.css">
</head>

<body>
    <div id="wrap">

       <div id="logo">
            <img id="img" src="../assets/images/logo.png" alt="고양이 로고">
       </div> 
        <h2>회원가입</h2>

    <div class="content">
        <form>
        <div id="joinFormBox">
            <div>
                <label for="username">아이디</label>                 
                <div id= "id">
                  <input type="text" id="username" placeholder="아이디를 입력하세요" required>
                  <button id="idcheck">중복확인</button>
                </div>    
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" id="password" placeholder="비밀번호를 입력하세요" required>
            </div>

            <div class="form-group">
                <label for="name">성함</label>
                <input type="text" id="name" placeholder="성함을 입력하세요" required>
            </div> 
            
            <div class="form-group">
                <label for="">전화번호</label>
                <input type="text" id="hp" placeholder="전화번호를 입력하세요" required>
            </div>
            
            <div>
                <label for="address">주소</label>
                <input type="text" id="address" placeholder="주소를 입력하세요" required>
            </div>   

            <button type="submit">입력 완료</button>
        </form>
    </div>
        
        <div id="wrap">
            <footer>
                <div class="footer-container">
                    <div class="footer-logo">
                        <img src="../../assets/images/Layer 1.png" alt="고양이 로고">
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
        </div>
    </div>

</body>
</html>