<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="ko">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <link href="../../assets/css/reset.css" rel="stylesheet">
        <link href="../../assets/css/header.css" rel="stylesheet">
        <link href="../../assets/css/footer.css" rel="stylesheet">
        <link href="../../assets/css/Jjingoodslist.css" rel="stylesheet" type="text/css">


    </head>

    <body>
        <div id="wrap">
            <!--header 부분-->
            <header id ="header">
                <div class="header-container">
                    <div class="logo">
                        <img src="../../assets/images/Layer 1.png" alt="고양이 로고">
                        <h1>야옹이 멍멍해봐</h1>
                    </div>
                
                    <!-- 비회원     -->
                    <div class="menu">
                        <button>로그인</button>
                        <button>회원가입</button>
                    </div>
                
                    <!-- 회원 
                    <div class="menu">
                        <P>집사님 어서오세요.</P>
                        <button>마이페이지</button>
                        <button>로그아웃</button>
                    </div>
                     -->
                    <!-- 관리자 
                    <div class="menu">
                        <P>관리자님 어서오세요.</P>
                        <button>상품등록</button>
                        <button>상품관리</button>
                        <button>주문관리</button>
                        <button>로그아웃</button>
                    </div>
               -->
                    <br>
                    <div class="search">
                        <input type="text" placeholder="문자열을 검색하세요!">
                        <button class="search-btn">🔍</button>
                    </div>
                </div>
                
                <div class="nav-menu">
                    <ul>
                        <li><h2>사료</h2></li>
                        <li><a href="#">성인묘</a></li>
                        <li><a href="#">아가묘</a></li>
                        <li><h2>간식</h2></li>
                        <li><a href="#">캔</a></li>
                        <li><a href="#">츄르</a></li>
                    </ul>
                </div>
        
            </header>
            <!--/header 부분-->
            <div id="content">
                <!-- 상단-->
                <div id="title">
                    <div id="location" class="clearfix">
                        <h1 id="page_name"><a href=""> AdultFood </a></h1>
                        <p id="totalcount"> 상품 42개 </p>
                    </div>
                    <div id="title-dec">
                        <ul class="clearfix">
                            <li>fooder-Adult(category)</li>
                            <li class="main-titletext">|</li>
                            <li class="main-titletext"><a href="">HOME</a></li>
                        </ul>

                    </div>
                </div>

                
                <!--- 이미지 반복 영역 -->
                <div id="gallery">
                    <ul id="viewArea" class="clearfix">
                        <li>
                            <a href="">
                                <div class="view">
                                    <img class="imgItem" src="../../assets/images/logo.png">
                                    <div class="imgName">상품이름(name)</div>
                                    <div class="imgContent">상품설명(content)</div>
                                    <div class="imgPrice">가격(price)</div>
                                </div>
                            </a>
                        </li>
                        <li>
                            <div class="view">
                                <img class="imgItem" src="../../assets/images/download.jfif">
                                <div class="imgName">상품이름(name)</div>
                                <div class="imgContent">상품설명(comtent)</div>
                                <div class="imgPrice">가격(price)</div>
                            </div>
                        </li>
                        <li>
                            <div class="view">
                                <img class="imgItem" src="../../assets/images/download.jfif">
                                <div class="imgName">상품이름(name)</div>
                                <div class="imgContent">상품설명(comtent)</div>
                                <div class="imgPrice">가격(price)</div>
                            </div>
                        </li>
                        <li>
                            <div class="view">
                                <img class="imgItem" src="../../assets/images/download.jfif">
                                <div class="imgName">상품이름(name)</div>
                                <div class="imgContent">상품설명(comtent)</div>
                                <div class="imgPrice">가격(price)</div>
                            </div>
                        </li>
                        <li>
                            <div class="view">
                                <img class="imgItem" src="../../assets/images/download.jfif">
                                <div class="imgName">상품이름(name)</div>
                                <div class="imgContent">상품설명(comtent)</div>
                                <div class="imgPrice">가격(price)</div>
                            </div>
                        </li>
                        <li>
                            <div class="view">
                                <img class="imgItem" src="../../assets/images/download.jfif">
                                <div class="imgName">상품이름(name)</div>
                                <div class="imgContent">상품설명(comtent)</div>
                                <div class="imgPrice">가격(price)</div>
                            </div>
                        </li>
                    </ul>
                    
                </div>
                <!--- /이미지 반복 영역 끝 -->

                <!--페이징 부분-->
                <div id="pagingArea">    
                    <div id="paging">
                        <ul class="clearfix">
                            <li class="page_move"><a href="">◀</a></li>
                            <li><a href="">1</a></li>
                            <li>2</li>
                            <li>3</li>
                            <li>4</li>
                            <li>5</li>
                            <li>6</li>
                            <li>7</li>
                            <li>8</li>
                            <li>9</li>
                            <li>10</li>
                            <li class="page_move"><a href="">▶</a></li>
                        </ul>
                    </div>
                </div>
                <!-- /페이징 부분-->

            </div>
            <!-- /content-->

            <!-- 푸터-->
            <footer>    
                <div class="footer-container">
                    <div class="footer-logo">
                        <img src="/catprofile.jpg" alt="고양이 로고">
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
            <!-- /푸터-->

        </div>
        <!-- /wrap -->
        

    </body>
</html>