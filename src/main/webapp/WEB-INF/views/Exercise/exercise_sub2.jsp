<%@page import="java.lang.ProcessHandle.Info" %>
  <%@page import="com.sayproject.model.Exercise.MemberInfo" %>
    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
      <%@ page import= "java.time.LocalDate" %>
      <%@ page import= "java.time.temporal.ChronoUnit" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <jsp:include page="/WEB-INF/views/include/LoginSessionCheck.jsp" />
        <!DOCTYPE html>
        <html lang="en">

        <head>
          <!-- Bootstrap core CSS -->
          <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
          <meta charset="utf-8" />
          <meta http-equiv="X-UA-Compatible" content="IE=edge" />
          <meta name="viewport" content="width=device-width, initial-scale=1" />

          <title>HealthCare | SAYPROJECT</title>
          <jsp:include page="/WEB-INF/views/include/header_css.jsp" />
          <!-- Custom Theme Style -->
          <link href="assets/Exercise/css/custom.css" rel="stylesheet" />

          <!-- Font awesome -->
          <script src="https://kit.fontawesome.com/d5b1d5ed76.js"></script>

          <!-- Google fonts -->
          <link rel="preconnect" href="https://fonts.googleapis.com">
          <link rel="preconnect" href="https://fonts.gstatic.com">
          <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
          <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
          <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">
          <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,700;1,600&display=swap"
            rel="stylesheet">
          <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Black+Han+Sans:wght@400;900&display=swap" />

          <link rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />

          <style>
            /* 

2023.09.10

* 템플릿 입체감이 부족함
- 애니메이션 넣기vs 
- 왼쪽 바 어둡게(블랙계열)+채도낮게
그래프에 색상 힘을 빡 주자
- 왼쪽바 마우스 올리면 좌->우로 색상이 박스 안에 차오르게 하자

* 전체적인 색상 -> 4~5가지로 통일하자

* 탑 카드 -> 
숫자가 랜덤으로 돌다가 0.5초 후에 자리 고정되게 구현하기 
시간 남으면,  전체 화면에서 10분에 한 번씩  
화면 그래프/숫자가 움직였다가 고정되는 거 만들기

*폰트 
한글 폰트 중에서 두꺼운거

차라리 막대 그래프를 체중변화 옆에 넣고
도넛을 아랫줄로 가져오는 배치도 생각 해 보자... 

*/

            .nav_title {
              width: 230px;
              float: left;
              background: #2c2c2c;
              border-radius: 0;
              height: 57px;
              padding: 0px;
              
            }

            /* 
    494b4d black << 2pick
    383a38 << 1pick
    886c65 << red
    bc4d7080 << puple
    de88a380

    686db470

    6e5151
    와우 너무 이쁜색
    background: #886c65;
    filter: grayscale(20%);
    */

            .dropdown-menu {         
              max-height: 400px;
              overflow-y: auto;
            }

            

            /*  색깔 css */
            .fa_custom1 {
              color: #bc69fa;
            }

            .fa_custom2 {
              color: #7386FF;
            }

            .fa_custom3 {
              color: #5C9EF5;
            }

            .fa_custom4 {
              color: #00E1FD;
            }

            .fa_custom5 {
              color: #01F6D5;
            }

            .fa_custom6 {
              color: #8258FA;
            }

            .fa_custom7 {
              color: #5858FA;
            }

            .nav.side-menu>li.active>a {
              background: linear-gradient(#2c2c2c, #2c2c2c), #3481ce25;
            }

            .nav.side-menu>li.current-page,
            .nav.side-menu>li.active {
              border-right: 5px solid #487bb2;
            }

            .left_col {
              background: #383a38;
              /* filter: grayscale(10%); */
            }

            .x_title>h2 {
              font-family: 'Do Hyeon', sans-serif;
              font-size: 25px;
            }

            .x_title:hover {
              color: #490000;
              color: #1abb9c;
            }




            .fixed_height_115 {
              height: 115px;
            }

            .fixed_height_680 {
              height: 680px;
            }

            .fixed_height_178 {
              height: 178px;
            }

            .four_card {
              display: flex;
            }

            .count_top {
              display: flex;
              flex-direction: row;
            }

            .count_bottom {
              display: flex;
              flex-direction: row;
            }

            /* 일째 작업 */

            .count_day {
              display: flex;
              align-items: baseline;
            }


            .day_num {
              width: 35%;
              color: #526565;
              font-size: 50px;
              font-weight: 800;
              font-family: 'Poppins', sans-serif;
            }

            .day_day {
              width: 65%;
              font-size: 25px;
              font-weight: 800;
              color: #526565;
              display: none;
              font-family: 'Noto Sans KR', sans-serif;
            }

            .day_clock {
              display: flex;
              flex-direction: column;
            }

            .day_day_hide {

              font-size: 18px;
              font-weight: 800;
              color: #526565;
              z-index: 1;
              font-family: 'Noto Sans KR', sans-serif;
            }


            /*Lime Green #CCF381, Electric Blue #4831D4*/

            /* 마우스를 올렸을 때의 스타일 */
            .topcard:hover {
              /* background-color: #11C991; 1픽 상쾌한 초록 */
              /* background-color: #6EBCB7; */
              background: linear-gradient(45deg, #8640fb, #a835ec, #c628ed);
              color: white
            }

            .topcard:hover * {
              color: rgb(226, 226, 226);
             
            }

            .topcard:hover .green {
              color: #33d9a7;
              /* 원하는 초록색으로 변경 */
              font-weight: bold;
            }

            .topcard2:hover {
              /* background-color: #4880f7; 1픽 상쾌한 파랑 */
              /* background-color: #598edf; */
              /* background: linear-gradient(45deg, #f26c49, #f4933d, #f4a140); */
              background: linear-gradient(45deg, #5086f0, #42b4eb, #17e4e5);
              color: white
            }

            .topcard2:hover * {
              color: rgb(226, 226, 226);
            }

            .topcard2:hover .green {
              color: #33d9a7;
              /* 원하는 초록색으로 변경 */
              font-weight: bold;
            }



            .topcard3 {
              background: linear-gradient(45deg, #8640fb, #a835ec, #c628ed);
              color: white
            }

            .topcard3 * {
              color: rgb(255, 255, 255);
            }

            .topcard3 .leftnum_right {
              color: rgb(255, 255, 255);
              /* 폰트 색상을 하얀색으로 설정 */
            }

            .topcard3 .green {
              color: #33d9a7;
              /* 원하는 초록색으로 변경 */
              font-weight: bold;
            }


            .topcard4 {
              background: linear-gradient(45deg, #5086f0, #42b4eb, #17e4e5);
              color: white;
            }


            .topcard4 * {
              color: rgb(255, 255, 255);
            }

            .topcard4 .expiredate_bottom_content {
              color: rgb(255, 255, 255);
              /* 폰트 색상을 하얀색으로 설정 */
            }

            .topcard4 .green {
              color: #ffffff;
              /* 원하는 초록색으로 변경 */
              font-weight: bold;
            }

            /* 주몇회 */


            .membership {
              width: 50%;
            }

            .count_month {
              width: 50%;
            }

            .howoften_top {
              display: flex;
              flex-direction: row;
            }

            .ticket_icon {
              width: 50%;
            }

            .howoften_count {
              width: 50%;
              text-align: right;
            }

            .howoften_bottom {
              display: flex;
              align-items: baseline;
            }

            .week_month {
              width: 15%;
              font-size: 18px;
              color: #526565;
              font-weight: 800;
              z-index: 1;
              font-family: 'Noto Sans KR', sans-serif;
            }

            .howoften_num {
              width: 20%;
              color: #526565;
              font-size: 50px;
              font-weight: 800;
              font-family: 'Poppins', sans-serif;
            }

            .howoften_times {
              width: 30%;
              font-size: 18px;
              font-weight: 800;
              color: #526565;
            }

            .howoften_times_hides {
              font-size: 18px;
              color: #526565;
              font-weight: 800;
              z-index: 1;
              display: none;
              font-family: 'Noto Sans KR', sans-serif;
            }

            /* .howoften_times:hover {
  display: none;  "회" 텍스트 숨기기 
}

.howoften_times_hides:hover {
  display: inline; "Times" 텍스트 보이기 
} */



            /* 남은 횟수 */
            .ulmanamun_top {
              display: flex;
              flex-direction: row;
            }

            .leftnumber_icon {
              width: 85%;
            }

            .ulma_count {
              text-align: right;
              width: 15%;
            }

            .ulmanamun_bottom {
              display: flex;
            }

            .leftnum_left {
              width: 20%;
              color: #526565;
              font-size: 50px;
              font-weight: 800;
              font-family: 'Poppins', sans-serif;

            }

            .leftnum_right {
              padding-top: 25px;
              width: 40%;
              color: #526565;
              font-size: 25px;
              font-weight: 800;
              font-family: 'Poppins', sans-serif;
            }

            .leftnum_times>div {
              width: 100%;
              display: flex;
              flex-direction: row;
              margin-top: 38px;
              align-items: baseline;
            }

            /* 원래 2초 간격으로 영어와 한글이 번갈아 가며 나오는 작업을 하려 했으나, 두 개 이상 해 보니 난잡해 삭제함 */
            /* .leftnum_times{
  font-size: 18px;
  color: #526565;
  font-weight: 800;
  z-index: 1;
  display: none;
  font-family: 'Noto Sans KR', sans-serif;
} */
            /* .leftnum_times_hide{
  font-size: 18px;
  color: #526565;
  font-weight: 800;
  z-index: 1;
  display: none;
  font-family: 'Noto Sans KR', sans-serif;
} */


            .bar-container {
              width: 80px;
              height: 15px;
              background-color: #ccc;
              border-radius: 5px;
            }

            .bar {
              height: 100%;
              width: 0;
              background-color: #007bff;
              border-radius: 5px;
              transition: width 0.5s ease-in-out;
            }

            .count {
              font-size: 16px;
              font-weight: bold;
              margin-top: 5px;
            }



            .expiredate_top {
              display: flex;
              flex-direction: row;
              height: 20%;
            }

            .expiredate_top_left {
              width: 45%;
            }

            .expiredate_top_middie {
              width: 55%;
            }

            .expiredate_top_right {
              width: 10%;
              margin-left: 12px;
            }

            .expiredate_top_right {
              display: inline-block;
              animation: bounce 0.3s infinite alternate;
            }

            .expiredate_top_right i {
              background-color: rgb(241, 95, 95);
              /* 빨간색 배경 추가 */
              color: white;
              /* 글자 색상을 흰색으로 변경 */
              border-radius: 50%;
              /* 동그란 모양으로 만듭니다. */
              padding: 5px;
              /* 내용과 배경 사이에 여백 추가 */
            }

            @keyframes bounce {
              0% {
                transform: translateX(0);
              }

              100% {
                transform: translateX(10px);
                /* 아이콘이 오른쪽으로 10px 이동하도록 설정 */
              }
            }


            .expiredate_bottom {
              display: flex;
              align-items: center;
              align-content: center;
              height: 100%;
              text-align: center;
            }

            .expiredate_bottom_content {
              width: 100%;
              color: #526565;
              font-size: 35px;
              font-weight: 800;
              font-family: 'Poppins', sans-serif;

            }



            .x_content_top_ {
              display: flex;
              flex-direction: column;
            }

            .x_content_top {
              display: flex;
              flex-direction: column;
            }

            .x_content_top_t {
              width: 20%;

              text-align: left;
            }

            .x_content_top_b {
              width: 80%;
              align-items: center;
              align-content: center;
              margin-left: 25px;
            }













            /*회원카드*/
            /*
회원 정보를 바로 볼 수 있게 해야 한다.

이름
연락처
성별
나이
몸무게
체중 등

또한 회원 관련 메모 해 놓는 곳 
*/

            /* 색이 차오르는 카드 1 */


            /* 색이 차오르는 카드  2 */



            .card_inner2 {
              display: flex;
              background-color: rgb(255, 242, 242);
              width: 100%;
              height: 100%;
              border-radius: 20px;
            }

            .front_left2 {
              width: 35%;
              height: 100%;
              border-radius: 20px 0px 0px 20px;
              display: flex;
              flex-direction: column;
              align-items: center;
              align-content: middle;
              justify-content: space-evenly;
              background-color: #a66464;
            }

            .front_right2 {
              width: 65%;
              height: 100%;
              background-color: rgb(255, 255, 255);
              border-radius: 0px 20px 20px 0px;
              display: flex;
              flex-direction: column;
              align-items: center;
              align-content: center;
              justify-content: center;
            }

            .front_left2 {
              /* 왼쪽 칸의 스타일 설정 */
              background-color: #00ff00;
              /* 왼쪽 칸의 배경색 */
              transition: background-color 0.5s ease;
              /* 배경색 변경 애니메이션 설정 */
            }

            .front_right2 {
              /* 오른쪽 칸의 스타일 설정 */
              background-color: #ffffff;
              /* 오른쪽 칸의 초기 배경색 */
            }

            .front_left2:hover+.front_right2 {
              /* 왼쪽 칸에 호버했을 때 오른쪽 칸에 스타일을 적용합니다. */
              background-color: #00ff00;
              /* 왼쪽 칸의 배경색으로 변경 */
            }



            /* 플립 카드*/

            .member_card {
              width: 100%;
              height: 200px;
              perspective: 1000px;
              /* 3D 효과를 위한 시점 설정 */
              margin-bottom: 30px;
              border-radius: 10px;
            }

            /* background-color: rgb(20, 188, 200); 이 색도 이쁨 근데 안 어울리는 것 같음*/
            .card_inner {
              width: 100%;
              height: 100%;
              position: relative;
              transform-style: preserve-3d;
              /* 3D 변환 스타일 설정 */
              transition: transform 0.5s, background-color 0.5s;
              /* 애니메이션 속성 설정 */
              background-color: #6EBCB7;
              /* 초기 배경색 (앞면) */
              border-radius: 10px;
            }

            .front,
            .back {
              width: 100%;
              height: 100%;
              position: absolute;
              backface-visibility: hidden;
              /* 뒷면 숨김 */
              border-radius: 10px;
              display: flex;
            }

            .front {
              background-color: #6EBCB7;
              /* 앞면 배경색 */
              display: flex;
              align-items: center;
              justify-content: center;
              border-radius: 10px;
            }

            .back {
              background-color: rgb(255, 186, 179);
              /* 뒷면 배경색 */
              transform: rotateY(180deg);
              /* 초기에는 뒷면이 보이도록 회전된 상태 */
              display: flex;
              align-items: center;
              justify-content: center;
              border-radius: 10px;
            }

            

            .front_left {
              width: 35%;
              height: 100%;
              border-radius: 10px;
              display: flex;
              flex-direction: column;
              align-items: center;
              align-content: middle;
              justify-content: space-evenly;
            }

            .front_right {
              width: 65%;
              height: 100%;
              background-color: white;
              border-radius: 0px 10px 0px 0px;
              display: flex;
              flex-direction: column;
              align-items: center;
              align-content: center;
              justify-content: center;
            }


            .front_left .hisrank_eng {
              width: 50%;
              background-color: #6EBCB7;
              border-radius: 10px 0 0 0;
              text-align: center;
            }

            .front_left .hispicture {
              width: 100%;
              height: 45%;
              border-radius: 50%;
              margin-left: 45px;
            }

            .front_left .hispicture img {
              width: 90px;
              height: 90px;
              border-radius: 50%;
            }

            .front_left .hisrank_kor {
              width: 70%;
              background-color: #6EBCB7;
              border-radius: 0 0 0 20px;
              text-align: center;
            }

            .points {
              top: 15%;
              color: #fff;
              text-transform: uppercase;
              font-size: 0.75em;
              font-weight: bold;
              background: rgba(0, 0, 0, 0.15);
              padding: 0.125rem 0.75rem;
              border-radius: 100px;
              white-space: nowrap;
              font-family: Abel, Arial, Verdana, sans-serif;
              font-size: 11px;
            }

            .front_right {
              width: 65%;
              height: 100%;
              background-color: white;
              border-radius: 0px 10px 10px 0px;
              display: flex;
              flex-direction: column;
              align-items: center;
              align-content: center;
              justify-content: center;
            }

            .hisname {
              margin-top: 10px;
              width: 100%;
              height: 20%;
              font-family: 'Black Han Sans', sans-serif;
              font-size: 30px;
              text-align: center;
              align-items: center;
              align-content: center;
            }

            .hisinfo {
              display: flex;
              flex-direction: column;
              width: 100%;
              height: 80%;
            }

            .hisinfo .info_tr {
              display: flex;
              margin-left: 10px;
              font-size: 15px;
            }

            .hisinfo .info_tr div:first-child {
              display: flex;
              margin-left: 10px;
              width: 40%;
            }

            .hisinfo .info_tr div:last-child {
              display: flex;
              margin-left: 10px;
            }

            .line_chart-container {
              height: 280px;
              border: 1px solid #ddd;
              padding: 10px;
              border-radius: 8px;
            }

            .widthBarChart-container {
              border: 1px solid #ddd;
              padding: 10px;
              border-radius: 8px;
            }

            .heightChart-container {
              border: 1px solid #ddd;
              padding: 10px;
              border-radius: 8px;
            }

            /*캘린더*/
          </style>

        </head>

        <body class="nav-md">
          <!-- 도넛차트 -->
          <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

          
          	<%
		          //회원 정보를 가져오기 
		            MemberInfo info=(MemberInfo)session.getAttribute("info"); 
                   String dateStringFromMariaDB1 = info.getRegist_day();
                  
                   // MariaDB에서 가져온 문자열을 LocalDate로 변환
                    LocalDate startDate1 = LocalDate.parse(dateStringFromMariaDB1);
                    
                   // 현재 날짜를 얻어옵니다.
                    LocalDate endDate1 = LocalDate.now(); 
                   
                    // 두 날짜 사이의 일수를 계산합니다.
                    long daysBetween1 = ChronoUnit.DAYS.between(startDate1, endDate1);
                    
                    
                    String dateStringFromMariaDB2 = info.getExpiration_day();
                    
                    // 현재 날짜를 얻어옵니다.
                     LocalDate startDate2 = LocalDate.now(); 
                    
                    // MariaDB에서 가져온 문자열을 LocalDate로 변환
                     LocalDate endDate2 = LocalDate.parse(dateStringFromMariaDB2);
                     
                     // 두 날짜 사이의 일수를 계산합니다.
                     long daysBetween2 = ChronoUnit.DAYS.between(startDate2, endDate2);
              %>
                  
          
            <script>

              // 자바스크립트 모음


              // 애니메이션 효과 자스들

              /* 첫번째 박스 안 day/일째가 2초마다 바뀌는 효과 */
              function toggleElements() {
                const elements = document.getElementsByClassName('day_day');
                const changeElements = document.getElementsByClassName('day_day_hide');

                // elements와 changeElements의 display 속성을 토글
                for (let i = 0; i < elements.length; i++) {
                  if (elements[i].style.display === 'none') {
                    elements[i].style.display = 'block';
                    changeElements[i].style.display = 'none';
                  } else {
                    elements[i].style.display = 'none';
                    changeElements[i].style.display = 'block';
                  }
                }
              }
              setInterval(toggleElements, 3000);

            </script>
            <div class="container body">
              <div class="main_container">
                <!-- left side menu -->
                <div class="col-md-3 left_col">
                  <jsp:include page="/WEB-INF/views/include/side_left.jsp" />
                </div>
                <!-- /left side menu -->
                <!-- top navigation -->
                <div class="top_nav">
                  <jsp:include page="/WEB-INF/views/include/top_nav.jsp" />
                </div>
                <!-- /top navigation -->

                <!-- page content -->
                <!-- main content -->


                <!-- page content -->
                <div class="right_col" role="main">


                  <div class="title_right">

                    <!--좌측-->
                    <div class="col-md-9">

                      <!-- 카드 차트(일째, 주 몇회 등)-->
                      <div class="col-md-12">

				

                        <!-- 몇 일째 -->
                        <div class="col-md-3">
                          <div class="x_panel tile fixed_height_115 overflow_hidden topcard">
                            <div class="count_top">
                              <div class="membership">
                                <i class="fa fa-user"></i> 우리가 만난지
                              </div>
                              <div class="count_month">
                                <i class="green"><!--1 month, 5 day--></i>
                              </div>
                            </div>
                            <div class="count_day">
                              <div class="day_num"><span class="randomNumber" style= "font-size: 45px;"><%=daysBetween1%></span></div>
                              <div class="day_day"> Day </div>
                              <div class="day_day_hide"> 일째 </div>
                            </div>
                            <div class="clearfix"></div>
                          </div>
                        </div>

                        <!-- 주 몇 회 -->
                        <div class="col-md-3">
                          <div class="x_panel tile fixed_height_115 overflow_hidden topcard2">

                            <div class="howoften_top">

                              <div class="ticket_icon">
                                <i class="fa-regular fa-id-card"></i> 회원권
                              </div>

                              <div calss="howoften_count">
                                <!-- <i class="green"> 1 week, 3 times </i>  -->
                                <span class="green" style= "font-weight: 800;">${info.getSchedule()}</span>
                              </div>

                            </div>

                            <div class="howoften_bottom">
                              <div class="week_month">주</div>
                              <div class="howoften_num"><span class="randomNumber"><%= info.getSchedule().replaceAll(",", "").length() %></span></div>
                              <div class="howoften_times">회</div>
                              <!-- 여기에 칸을 세로로 두 칸 추가해서 월, 수, 금-->
                              <!-- 여기에 칸을 세로로 두 칸 추가해서 오후 2시-->
                              <!-- 라고 하고 싶으나 지금 적용된 how-often_bottom에 텍스트가 baseline으로 되있어서 세로길이가 늘어남-->
                              <!-- <div class="howoften_times_hides">Times</div> -->
                            </div>
                          <div class="clearfix"></div>
                          </div>
                        </div>


                        <!-- 남은 횟수 -->
                        <div class="col-md-3">
                          <div class="x_panel tile fixed_height_115 overflow_hidden topcard3">

                            <div class="ulmanamun_top">

                              <div class="leftnumber_icon">
                                <i class="fa-solid fa-arrow-down-9-1"></i> 출석 횟수
                              </div>


                              <div calss="ulma_count">
                                <i class="green"><!-- 50%--></i>
                              </div>


                            </div>

                            <div class="ulmanamun_bottom">
                              <div class="leftnum_left"><span class="randomNumber">${check}</span></div>
                              <div class="leftnum_right">회</div>
                              <div class="leftnum_times">
                                <div>
                                  <!-- <div class="bar-container">
                                    <div class="bar" style="width: 50%;"></div>
                                  </div> -->
                                </div>
                              </div>


                            </div>
                            <div class="clearfix"></div>
                          </div>
                        </div>

                        <!-- 멤버십 만료일 -->

                        <div class="col-md-3">
                          <div class="x_panel tile fixed_height_115 overflow_hidden topcard4">
                            <div class="expiredate_top">
                              <div class="expiredate_top_left">
                                <i class="fa-regular fa-calendar"></i> 멤버십만료일
                              </div>
                              <div class="expiredate_top_middle">
                                <span class="green"><%=daysBetween2 %>일 남았어요</span>
                              </div>
                              <div class="expiredate_top_right">
                                <i class="fa-solid fa-bell"></i>
                              </div>
                            </div>

                            <div class="expiredate_bottom">
                              <div class="expiredate_bottom_content" class="randomNumber">
                                ${ info.getExpiration_day()}
                              </div>
                            </div>
                          </div>
                          <div class="clearfix"></div>
                        </div>


                        <!-- <div class="col-md-3">
          <div class="x_panel tile fixed_height_150 overflow_hidden topcard2">
            멤버십 만료일 <br>
            2023.12.1
            1주일 남으면
            알람 아이콘
            킹받게 짤랑짤랑 흔들리게/
            우상단 -일 남았어요
          </div>
        </div> -->





                        <!-- 
  <div class="col-md-12">
  <div class="x_panel tile fixed_height_150 overflow_hidden">
  <div class="x_title">
  <h2>위에칸</h2>
  <ul class="nav navbar-right panel_toolbox">
  <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
  </li>
  <li class="dropdown">
  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="#">Settings 1</a>
    <a class="dropdown-item" href="#">Settings 2</a>
    </div>
  </li>
  <li><a class="close-link"><i class="fa fa-close"></i></a>
  </li>
  </ul>
  <div class="clearfix"></div>
  </div>
  <div class="x_content">
  </div>
  </div>
  </div> -->




                        <!-- 도넛 차트 -->
                        <div class="col-md-4 col-sm-4 ">

                          <div class="x_panel tile fixed_height_680 overflow_hidden donutbox">
                            <div class="x_title">
                              <h2>운동 요약</h2>
                              <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li class="dropdown">
                                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                    aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#">Settings 1</a>
                                    <a class="dropdown-item" href="#">Settings 2</a>
                                  </div>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                              </ul>
                              <div class="clearfix"></div>
                            </div>
                            <!-- 도넛 차트 그림-->

                            <div class="x_content">

                              <div class="x_content_top">

                                <div calss="x_content_top_t">
                                  <h2>리스트</h2>
                                </div>

                                <div class="x_content_top_b">
                                  <div id = "donutChart_div" style="width:280px;">
                                    <!-- <canvas id="donutChart" width="280" height="280"></canvas> -->
                                  </div>
                                </div>

                              </div>

                              <br>
                              <br>

                              <!-- 차트 설명 -->

                              <div class="x_conten_bottom">
                                <div id="showExercise"></div>
                                <!--
                                <table class="" style="width:100%">
                                  <tr>

                                    <th>
                                      <div class="col-lg-6 col-lg-6" align="center">
                                        <p class="">Device</p>
                                      </div>
                                      <div class="col-lg-6 col-lg-6" align="center">
                                        <p class="">Progress</p>
                                      </div>
                                    </th>
                                  </tr>
                                  <tr>
                                    <td>
                                      <table class="tile_info" width="150px" style="width: 90%;"
                                        style="margin-left: 10px;">

                                        for(int i = 0; i<) <tr>
                                          <td>
                                            <p><i class="fa fa-square blue"></i>스쿼트 </p>
                                          </td>
                                          <td>90kcal</td>
                                  </tr>

                                </table>
                                </td>
                                </tr>
                                </table>
                              -->
                              </div>
                            </div>

                          <div class="clearfix"></div>
                          </div>
                        </div>

                        <!-- 꺾은 선 -->
                        <div class="col-md-8 col-sm-8 ">
                          <div class="x_panel tile fixed_height_287 overflow_hidden">
                            <div class="x_title">
                              <h2> 체중변화 </h2>
                              <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li class="dropdown">
                                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                    aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#">Settings 1</a>
                                    <a class="dropdown-item" href="#">Settings 2</a>
                                  </div>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                              </ul>
                              <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                              <div class="line_chart-container">
                                <!-- <canvas id="line-chart"></canvas> -->
                              </div>

                            </div>
                            <div class="clearfix"></div>
                          </div>
                        </div>

                        <!-- 표 차트 or 가로막대 차트 -->
                        <div class="col-md-4 col-sm-4 ">
                          <div class="x_panel tile fixed_height_287 overflow_hidden">
                            <div class="x_title">
                              <h2>운동한 시간</h2>
                              <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li class="dropdown">
                                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                    aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#">Settings 1</a>
                                    <a class="dropdown-item" href="#">Settings 2</a>
                                  </div>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                              </ul>
                              <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                              <h4>오늘 진행한 운동 </h4>
                              <div class="widthBarChart-container">
                                <!-- <canvas id="widthBar-chart"></canvas> -->
                              </div>

                            </div>
                            <div class="clearfix"></div>
                          </div>
                        </div>

                        <!--  막대 그래프 -->
                        <div class="col-md-4 col-sm-4 ">
                          <div class="x_panel tile fixed_height_287 overflow_hidden">
                            <div class="x_title">
                              <h2>칼로리 소모</h2>
                              <ul class="nav navbar-right panel_toolbox">
                                <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                                </li>
                                <li class="dropdown">
                                  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                    aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <a class="dropdown-item" href="#">Settings 1</a>
                                    <a class="dropdown-item" href="#">Settings 2</a>
                                  </div>
                                </li>
                                <li><a class="close-link"><i class="fa fa-close"></i></a>
                                </li>
                              </ul>
                              <div class="clearfix"></div>
                            </div>
                            <div class="x_content">

                              <h4>최근 7일간 칼로리 소모량</h4>
                              <div class="heightChart-container">
                                <!-- <canvas id="heightBar-chart"></canvas> -->
                              </div>

                            </div>
                            <div class="clearfix"></div>
                          </div>
                        </div>



                      </div>

                      <!-- 우측 -->

                    </div>


                    <div class="col-md-3 rightplace">

                      <div class="col-md-12 col-sm-12">

                        <!-- 회원 정보 미니 카드 -->

                        <!-- 회전 카드 -->

                        <div class="member_card">
                          <div class="card_inner">
                            <div class="front">
                              <!-- 앞면 내용 -->
                              <div class="front_left">

                                <div class="hisrank_eng">
                                <%if(daysBetween1<=100){%>                          
                                  <div class="points">
                                    NEW
                                  </div>
								<%}%>
                                </div>

                                <div class="hispicture">

                                  <div>
                                  <img src="${info.getPhotopath()}" alt="등록된 사진이 없습니다.">
                                    <!-- <img src="assets/Exercise/Images/YHdog.png"> -->
                                  </div>

                                </div>


                                <div class="hisrank_kor">
                                  <%if(daysBetween1<=100){%>
                                  <div class="points">
                                    신규회원
                                  </div>
                                  <%}else{%>
                                   <div class="points">
                                    일반회원
                                  </div>
                                  <%}%>
                                </div>
                              </div>

                              <div class="front_right">
                                <div class="hisname">
                                  ${ info.getName()}
                                </div>

                                <div class="hisinfo">
                                  <div class="info_tr">
                                    <div>등록일자</div>
                                    <div>
                                      ${ info.getRegist_day()}
                                    </div>
                                  </div>
                                  <div class="info_tr">
                                    <div>성별</div>
                                    <div>
                                      ${info.getGender() } 
                                    </div>
                                  </div>
                                  <div class="info_tr">
                                    <div>나이</div>
                                    <div>
                                      ${info.getAge() }
                                    </div>
                                  </div>
                                  <div class="info_tr">
                                    <div>몸무게</div>
                                    <div>
                                      ${info.getWeight() }
                                    </div>
                                  </div>
                                  <div class="info_tr">
                                    <div>키</div>
                                    <div>
                                      ${info.getHeight() }
                                    </div>
                                  </div>
                                  <div class="info_tr">
                                    <div>연락처</div>
                                    <div>
                                      ${info.getPhone_number() }
                                    </div>
                                  </div>

                                </div>

                              </div>
                            </div>


                            <div class="back">
                              <!-- 뒷면 내용 -->
                              <h2></h2>
                            </div>
                          </div>
                        </div>



                        <!-- 전체회원 검색 -->
                          <div style="margin-bottom : 20px;">
                              <div class="dropdown" style="display: block;">
                                <button class="btn btn-secondary dropdown-toggle btn-lg btn-block" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                전체회원명단
                                </button>
                                <div id="totalName" class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                <!-- 전체회원 명단 이름/ 이미지 -->
                              </div>
                            </div>
                          </div>




                        <!-- 캘린더 -->
                        <div class="x_panel tile fixed_height_287 overflow_hidden">
                          <div class="x_title">
                            <h2>캘린더</h2>
                            <ul class="nav navbar-right panel_toolbox">
                              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                              </li>
                              <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                  aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                  <a class="dropdown-item" href="#">Settings 1</a>
                                  <a class="dropdown-item" href="#">Settings 2</a>
                                </div>
                              </li>
                              <li><a class="close-link"><i class="fa fa-close"></i></a>
                              </li>
                            </ul>
                            <div class="clearfix"></div>
                          </div>
                          <div class="x_content">
                            <fieldset>
                              <div class="control-group">
                                <div class="controls">
                                <div class="col-md-11 xdisplay_inputx form-group row has-feedback">
                                  <input type="text" class="form-control has-feedback-left" id="single_calCustom" placeholder="First Name" aria-describedby="inputSuccess2Status">
                                    <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
                                  <span id="inputSuccess2Status" class="sr-only">(success)</span>
                                </div>
                                </div>
                              </div>
                            </fieldset>
                          <!-- 여기야~ -->
                          </div>
                          <div class="clearfix"></div>
                        </div>

                        <!-- 캘린더 설명 -->
                        <div class="x_panel tile fixed_height_178 overflow_hidden">
                          <div class="x_title">
                            <h2>일 정</h2>
                            <ul class="nav navbar-right panel_toolbox">
                              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                              </li>
                              <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                  aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                  <a class="dropdown-item" href="#">Settings 1</a>
                                  <a class="dropdown-item" href="#">Settings 2</a>
                                </div>
                              </li>
                              <li><a class="close-link"><i class="fa fa-close"></i></a>
                              </li>
                            </ul>
                            <div class="clearfix"></div>
                          </div>
                          <div class="x_content">

                            <table class="tile_info2" width="150px" style="width: 80%;" style="margin-left: 10px;">
                              <tr>
                                <td>
                                  <p><i class="fa fa-square blue"></i>다인 회원님 1시 PT</p>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <p><i class="fa fa-square green"></i>나행 회원님 3시 PT</p>
                                </td>
                              </tr>
                              <tr>
                                <td>
                                  <p><i class="fa fa-square purple"></i>병훈 회원님 5시 PT</p>
                                </td>
                              </tr>

                            </table>
                            </td>
                            </tr>
                            </table>

                          </div>
                          <div class="clearfix"></div>
                        </div>


                      </div>
                    </div>

                  </div>
                  <div class="clearfix"></div>
                </div>

                <div class="clearfix"></div>

                <!-- /page content -->





                <!-- /main content -->
              </div>
            </div>
            </div>
            </div>
            <!-- /page content -->

            <!-- footer content -->
            <footer>
              <div class="pull-right">S A Y P R O J E C T</div>
              <div class="clearfix"></div>
            </footer>
            <!-- /footer content -->
            </div>
            </div>
            <jsp:include page="/WEB-INF/views/include/footer_script.jsp" />


            <!-- Custom Theme Scripts -->



            <!-- 캘린더 -->
            <script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
            <script>

              document.addEventListener('DOMContentLoaded', function () {
                var calendarEl = document.getElementById('calendar');
                var calendar = new FullCalendar.Calendar(calendarEl, {
                  initialView: 'dayGridMonth'
                });
                calendar.render();
              });

            </script>

            
            <script>
              // sql에서 값 가져온 것 변수에 저장 

              // 회원 번호
              let number = "${no}"

              // 이름
              let name = "${name}"

              // 나이
              let age = "${age}"

              // 성별
              let gender = "${gender}"

              // 몸무게 
              let weight = "${weight}"

              // 키
              let height = "${height}"
              
              </script>

            <script>
              // afterDraw 함수를 사용하여 텍스트를 추가합니다.
              Chart.plugins.register({
                afterDraw: addTextToDonutChart
              });
            </script>
            <script src="assets/Exercise/js/custom.js"></script>
            <script src="assets\Exercise\js\memberTotal.js"></script>
            

            

        </body>

        </html>