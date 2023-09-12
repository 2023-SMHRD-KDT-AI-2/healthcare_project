<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="images/favicon.ico" type="image/ico" />
    
    <title>Gentelella Alela!</title>
    
    <!-- Bootstrap -->
    <link href="../vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="../vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/d5b1d5ed76.js" crossorigin="anonymous"></script>
    <!-- NProgress -->
    <link href="../vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="../vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- bootstrap-progressbar -->
    <link href="../vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="../vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="../vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="../build/css/custom.min.css" rel="stylesheet">

    <!-- Google fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,700;1,600&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Black+Han+Sans:wght@400;900&display=swap" />

    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0" />
   
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

    .nav.side-menu > li.active > a {
      background: linear-gradient(#2c2c2c, #2c2c2c), #3481ce25;
    }

    .nav.side-menu > li.current-page, .nav.side-menu > li.active {
      border-right: 5px solid #487bb2;
    }

    .left_col {
    background: #383a38;
    /* filter: grayscale(10%); */
    }

  .x_title > h2{
      font-family: 'Do Hyeon', sans-serif;
      font-size: 25px;
    }

    .x_title:hover {
      color: #a66464; 
    }




    .four_card{
      display: flex;
    }

    .count_top{
      display: flex;
      flex-direction: row;
    }
    .count_bottom{
      display: flex;
      flex-direction: row;
    }

    .count_day{
      display:flex;
      align-items: baseline;
    }


    .day_num{
      width:35%;
      color:#526565;
      font-size: 50px;
      font-weight: 800;
      font-family: 'Poppins', sans-serif;
      
    }

    .day_day{
      width:65%;
      font-size: 25px;
      font-weight: 800;
      color: #526565;
      display: none;
      font-family: 'Noto Sans KR', sans-serif;
    }

    .day_clock{
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
    /* background: #98c463; 메뚜기 연두색 */
    /* background-color: #e3f4fd; 연한 하늘색 그저 그렇다 -> 하지만 은은함*/
    /* background: linear-gradient(to bottom, #11C991, #28dba5); 푸른 계열 그라데이션 */
    background-color: #6EBCB7;
    color: white;
    }    
    
    .topcard2:hover {
    /* background-color: #4880f7; 1픽 상쾌한 파랑 */
    /* background: linear-gradient(to bottom, #3474ff, #3e7afa); 푸른색 */
    /* background-color: #E8A286; 살구색 */
    background-color: #598edf;

    color: white;
    }

   

    .membership{
      width:50%;
    }
    .count_month{
      width:50%;
    }

    .howoften_top{
      display: flex;
      flex-direction: row;
    }
    
    .ticket_icon{
      width:50%;
    }

    .howoften_count{
      width:50%;
      text-align: right;
    }
   
    .howoften_bottom{
      display:flex;
      align-items: baseline;
    }

    .week_month{
      width: 15%;
      font-size: 18px;
      color: #526565;
      font-weight: 800;
      z-index: 1;
      font-family: 'Noto Sans KR', sans-serif;
    }
    
    .howoften_num{
      width:20%;
      color:#526565;
      font-size: 50px;
      font-weight: 800;
      font-family: 'Poppins', sans-serif;
    }

    .howoften_times{
      width: 30%;
      font-size: 18px;
      font-weight: 800;
      color: #526565;
    }

    .howoften_times_hides{
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

  
.ulmanamun_top{
  display: flex;
  flex-direction: row;
}

.leftnumber_icon{
  width: 85%;
}

.ulma_count{
  text-align: right;
  width: 15%;
}

.ulmanamun_bottom{
  display: flex;
}

.leftnum_left{
  width:20%;
  color:#526565;
  font-size: 50px;
  font-weight: 800;
  font-family: 'Poppins', sans-serif;

}
.leftnum_right{
  padding-top: 25px;
  width: 40%;
  color:#526565;
  font-size: 25px;
  font-weight: 800;
  font-family: 'Poppins', sans-serif;
}

.leftnum_times > div {
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

.member_card2 {
  display: flex;
  width: 320px;
  height: 200px;
  perspective: 1000px; /* 3D 효과를 위한 시점 설정 */
  margin-bottom: 30px;
  border-radius : 20px;
}

.card_inner2 {
  display: flex;
  background-color: rgb(255, 242, 242);
  width: 100%;
  height: 100%;
  border-radius: 20px;
}

.front_left2{
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

.front_right2{
  width: 65%;
  height:100%;
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
  background-color: #00ff00; /* 왼쪽 칸의 배경색 */
  transition: background-color 0.5s ease; /* 배경색 변경 애니메이션 설정 */
}

.front_right2 {
  /* 오른쪽 칸의 스타일 설정 */
  background-color: #ffffff; /* 오른쪽 칸의 초기 배경색 */
}

.front_left2:hover + .front_right2 {
  /* 왼쪽 칸에 호버했을 때 오른쪽 칸에 스타일을 적용합니다. */
  background-color: #00ff00; /* 왼쪽 칸의 배경색으로 변경 */
}



/* 플립 카드*/

.member_card {
  width: 320px;
  height: 200px;
  perspective: 1000px; /* 3D 효과를 위한 시점 설정 */
  margin-bottom: 30px;
  border-radius : 10px;
}

/* background-color: rgb(20, 188, 200); 이 색도 이쁨 근데 안 어울리는 것 같음*/
.card_inner {
  width: 100%;
  height: 100%;
  position: relative;
  transform-style: preserve-3d; /* 3D 변환 스타일 설정 */
  transition: transform 0.5s, background-color 0.5s; /* 애니메이션 속성 설정 */
  background-color:  #6EBCB7; /* 초기 배경색 (앞면) */
  border-radius: 10px;
}

.front,
.back {
  width: 100%;
  height: 100%;
  position: absolute;
  backface-visibility: hidden; /* 뒷면 숨김 */
  border-radius: 10px;
  display: flex;
}

.front {
  background-color:   #6EBCB7; /* 앞면 배경색 */
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 10px;
}

.back {
  background-color: rgb(255, 186, 179); /* 뒷면 배경색 */
  transform: rotateY(180deg); /* 초기에는 뒷면이 보이도록 회전된 상태 */
  display: flex;
  align-items: center;
  justify-content: center;
  border-radius: 10px;
}

.member_card:hover .card_inner {
  transform: rotateY(180deg); /* 마우스 오버 시 회전하여 뒷면 보이게 함 */
  background-color: rgb(255, 126, 112); /* 마우스 오버 시 배경색 변경 (파란색) */
  border-radius: 10px;
}

.front_left{
  width: 35%;
  height: 100%;
  border-radius: 10px;
  display: flex;
  flex-direction: column;
  align-items: center;
  align-content: middle;
  justify-content: space-evenly;
}

.front_right{
  width: 65%;
  height:100%;
  background-color: white;
  border-radius: 0px 10px 0px 0px;
  display: flex;
  flex-direction: column;
  align-items: center;
  align-content: center;
  justify-content: center;
}


.front_left .hisrank_eng{
  width: 50%;
  background-color: #6EBCB7;
  border-radius: 10px 0 0 0;
  text-align: center;
}

.front_left .hispicture{
  width: 100%;
  height: 45%;
  border-radius: 50%;
  margin-left: 22px;
}

.front_left .hispicture img {
  width:90px;
  height:90px;
  border-radius: 50%;
}

.front_left .hisrank_kor{
  width: 70%;
  background-color: #6EBCB7;
  border-radius: 0 0 0 20px;
  text-align: center;
}

.points{
  top: 15%;
  color: #fff;
  text-transform: uppercase;
  font-size: 0.75em;
  font-weight: bold;
  background: rgba(0,0,0,0.15);
  padding: 0.125rem 0.75rem;
  border-radius: 100px;
  white-space: nowrap;
  font-family: Abel, Arial, Verdana, sans-serif;
  font-size: 11px;
}

.front_right{
  width: 65%;
  height:100%;
  background-color: white;
  border-radius: 0px 10px 10px 0px;
  display: flex;
  flex-direction: column;
  align-items: center;
  align-content: center;
  justify-content: center;
}

.hisname{
  margin-top: 15px;
  width: 100%;
  height:30%;
  font-family: 'Black Han Sans', sans-serif;
  font-size: 30px;
  text-align: center;
  align-items: center;
  align-content: center;
}

.hisinfo{
  display: flex ;
  flex-direction: column;
  width: 100%;
  height: 80%;
}

.hisinfo .info_tr{
  display: flex;
  margin-left: 10px;
}

.hisinfo .info_tr div:first-child{
  display: flex;
  margin-left: 10px;
  width: 40%;
}
.hisinfo .info_tr div:last-child{
  display: flex;
  margin-left: 10px;
}









/*캘린더*/


</style>
</head>


  <body class="nav-md">

    <script>
      
   
/*~일째 글씨 day/일째 글씨 바뀌는 효과 */
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

      // /* 주 ~ 회 Times/회 글씨 바뀌는 효과 */
      // /* 근데 너무 많이 쓰니까 요란스럽다*/
      // function toggleElement2s() {
      //   const elements = document.getElementsByClassName('howoften_times');
      //   const changeElements = document.getElementsByClassName('howoften_times_hides');

      //   // elements와 changeElements의 display 속성을 토글
      //   for (let i = 0; i < elements.length; i++) {
      //     if (elements[i].style.display === 'none') {
      //       elements[i].style.display = 'block';
      //       changeElements[i].style.display = 'none';
      //     } else {
      //       elements[i].style.display = 'none';
      //       changeElements[i].style.display = 'block';
      //     }
      //   }
      // }
      // setInterval(toggleElement2s, 3000);
/*숫자가 3초 뒤에 바뀌는 애니메이션 끝*/

/*~일째 랜덤한 숫자가 돌다가 멈추는 애니메이션*/
    function startRandomNumberAnimation() {
    const randomNumberElement = document.getElementById("randomNumber");
    const targetNumber = 36; // 멈출 숫자
    const animationDuration = 300; // 애니메이션 지속 시간 (0.3초)

    let currentNumber = 0;
    let startTime;

    function updateNumber(timestamp) {
        if (!startTime) {
            startTime = timestamp;
        }

        const progress = timestamp - startTime;
        const percentage = Math.min(1, progress / animationDuration);

        currentNumber = Math.round(percentage * targetNumber);
        randomNumberElement.textContent = currentNumber;

        if (percentage < 1) {
            requestAnimationFrame(updateNumber);
        }
    }

    requestAnimationFrame(updateNumber);
}
// 페이지 로드 후 0.5초 뒤에 애니메이션 시작
window.addEventListener("load", () => {
    setTimeout(startRandomNumberAnimation, 500);
});
/* ~일째 애니메이션 효과 끝*/



/* 주 ~회 숫자 애니메이션 */

/* 주~째 애니메이션 효과 끝*/


</script>


    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="index.html" class="site_title"><i class="fa fa-paw"></i> <span>Gentelella Alela!</span></a>
            </div>
            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
                <img src="images/img.jpg" alt="..." class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>Welcome,</span>
                <h2>John Doe</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>General</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="index.html">Dashboard</a></li>
                      <li><a href="index2.html">Dashboard2</a></li>
                      <li><a href="index3.html">Dashboard3</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-edit"></i> Forms <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="form.html">General Form</a></li>
                      <li><a href="form_advanced.html">Advanced Components</a></li>
                      <li><a href="form_validation.html">Form Validation</a></li>
                      <li><a href="form_wizards.html">Form Wizard</a></li>
                      <li><a href="form_upload.html">Form Upload</a></li>
                      <li><a href="form_buttons.html">Form Buttons</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i> UI Elements <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="general_elements.html">General Elements</a></li>
                      <li><a href="media_gallery.html">Media Gallery</a></li>
                      <li><a href="typography.html">Typography</a></li>
                      <li><a href="icons.html">Icons</a></li>
                      <li><a href="glyphicons.html">Glyphicons</a></li>
                      <li><a href="widgets.html">Widgets</a></li>
                      <li><a href="invoice.html">Invoice</a></li>
                      <li><a href="inbox.html">Inbox</a></li>
                      <li><a href="calendar.html">Calendar</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-table"></i> Tables <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="tables.html">Tables</a></li>
                      <li><a href="tables_dynamic.html">Table Dynamic</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i> Data Presentation <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="chartjs.html">Chart JS</a></li>
                      <li><a href="chartjs2.html">Chart JS2</a></li>
                      <li><a href="morisjs.html">Moris JS</a></li>
                      <li><a href="echarts.html">ECharts</a></li>
                      <li><a href="other_charts.html">Other Charts</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-clone"></i>Layouts <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="fixed_sidebar.html">Fixed Sidebar</a></li>
                      <li><a href="fixed_footer.html">Fixed Footer</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
              <div class="menu_section">
                <h3>Live On</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-bug"></i> Additional Pages <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="e_commerce.html">E-commerce</a></li>
                      <li><a href="projects.html">Projects</a></li>
                      <li><a href="project_detail.html">Project Detail</a></li>
                      <li><a href="contacts.html">Contacts</a></li>
                      <li><a href="profile.html">Profile</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-windows"></i> Extras <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="page_403.html">403 Error</a></li>
                      <li><a href="page_404.html">404 Error</a></li>
                      <li><a href="page_500.html">500 Error</a></li>
                      <li><a href="plain_page.html">Plain Page</a></li>
                      <li><a href="login.html">Login Page</a></li>
                      <li><a href="pricing_tables.html">Pricing Tables</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-sitemap"></i> Multilevel Menu <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                        <li><a href="#level1_1">Level One</a>

                          <li><a>Level One<span class="fa fa-chevron-down"></span></a>
                            <ul class="nav child_menu">
                              <li class="sub_menu"><a href="level2.html">Level Two</a>
                              </li>
                              <li><a href="#level2_1">Level Two</a>
                              </li>
                              <li><a href="#level2_2">Level Two</a>
                              </li>
                            </ul>
                          </li>
                        
                          <li><a href="#level1_2">Level One</a>
                          </li>
                        </li>
                    </ul>
                  </li>                  
                  <li><a href="javascript:void(0)"><i class="fa fa-laptop"></i> Landing Page <span class="label label-success pull-right">Coming Soon</span></a></li>
                </ul>
              </div>

            </div>
            <!-- /sidebar menu -->

            <!-- /menu footer buttons -->
            <div class="sidebar-footer hidden-small">
              <a data-toggle="tooltip" data-placement="top" title="Settings">
                <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Lock">
                <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
              </a>
              <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
                <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
              </a>
            </div>
            <!-- /menu footer buttons -->
          </div>
        </div>

        <!-- top navigation -->
        <div class="top_nav">
          <div class="nav_menu">
              <div class="nav toggle">
                <a id="menu_toggle"><i class="fa fa-bars"></i></a>
              </div>
              <nav class="nav navbar-nav">
              <ul class=" navbar-right">
                <li class="nav-item dropdown open" style="padding-left: 15px;">
                  <a href="javascript:;" class="user-profile dropdown-toggle" aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false">
                    <img src="images/img.jpg" alt="">John Doe
                  </a>
                  <div class="dropdown-menu dropdown-usermenu pull-right" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item"  href="javascript:;"> Profile</a>
                      <a class="dropdown-item"  href="javascript:;">
                        <span class="badge bg-red pull-right">50%</span>
                        <span>Settings</span>
                      </a>
                  <a class="dropdown-item"  href="javascript:;">Help</a>
                    <a class="dropdown-item"  href="login.html"><i class="fa fa-sign-out pull-right"></i> Log Out</a>
                  </div>
                </li>

                <li role="presentation" class="nav-item dropdown open">
                  <a href="javascript:;" class="dropdown-toggle info-number" id="navbarDropdown1" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-envelope-o"></i>
                    <span class="badge bg-green">6</span>
                  </a>
                  <ul class="dropdown-menu list-unstyled msg_list" role="menu" aria-labelledby="navbarDropdown1">
                    <li class="nav-item">
                      <a class="dropdown-item">
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="dropdown-item">
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="dropdown-item">
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a class="dropdown-item">
                        <span class="image"><img src="images/img.jpg" alt="Profile Image" /></span>
                        <span>
                          <span>John Smith</span>
                          <span class="time">3 mins ago</span>
                        </span>
                        <span class="message">
                          Film festivals used to be do-or-die moments for movie makers. They were where...
                        </span>
                      </a>
                    </li>
                    <li class="nav-item">
                      <div class="text-center">
                        <a class="dropdown-item">
                          <strong>See All Alerts</strong>
                          <i class="fa fa-angle-right"></i>
                        </a>
                      </div>
                    </li>
                  </ul>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        <!-- /top navigation -->

<!-- page content -->
<div class="right_col" role="main">

  <div class="title_right">

    <!--좌측-->
    <div class="col-md-9">

      <!-- 카드 차트(일째, 주 몇회 등)-->
      <div class="col-md-12">

        <!-- 몇 일째 -->
        <div class="col-md-3">
          <div class="x_panel tile fixed_height_150 overflow_hidden topcard">
              <div class="count_top">
                  <div class="membership">
                      <i class="fa fa-user"></i> 신규회원
                  </div>
                  <div class="count_month">
                      <i class="green">1 month, 5 day</i>
                  </div>
              </div>
              <div class="count_day">
                  <div class="day_num" id="randomNumber">36</div>
                  <div class="day_day"> Day </div>
                  <div class="day_day_hide"> 일째 </div>
              </div>
          </div>
      </div>
  
        <!-- 주 몇 회 -->
        <div class="col-md-3">
          <div class="x_panel tile fixed_height_150 overflow_hidden topcard2">
  
            <div class="howoften_top">
  
              <div class="ticket_icon">
                <i class="fa-regular fa-id-card"></i> 회원권 
              </div>
  
              <div calss="howoften_count">
                <!-- <i class="green"> 1 week, 3 times </i>  -->
                <i class="green" style="font-weight: 800;"> 월, 수, 금, 14:00 </i> 
              </div>
  
            </div>
  
            <div class="howoften_bottom">
                <div class="week_month">주</div>
                <div class="howoften_num">3</div>
                <div class="howoften_times">회</div>
                <!-- 여기에 칸을 세로로 두 칸 추가해서 월, 수, 금-->
                <!-- 여기에 칸을 세로로 두 칸 추가해서 오후 2시-->
                <!-- 라고 하고 싶으나 지금 적용된 how-often_bottom에 텍스트가 baseline으로 되있어서 세로길이가 늘어남-->
                <!-- <div class="howoften_times_hides">Times</div> -->
            </div>

          </div>
        </div>
  

        <!-- 남은 횟수 -->
        <div class="col-md-3">
          <div class="x_panel tile fixed_height_150 overflow_hidden topcard">
  
            <div class="ulmanamun_top">
  
              <div class="leftnumber_icon">
                <i class="fa-solid fa-arrow-down-9-1"></i> 남은 횟수 
              </div>
        
  
              <div calss="ulma_count">
                <i class="green">50%</i> 
              </div>
              
  
            </div>
  
            <div class="ulmanamun_bottom">
                <div class="leftnum_left">6</div>
                <div class="leftnum_right">/ 12</div>
                <div class="leftnum_times">
                  <div>
                    <div class="bar-container">
                      <div class="bar" style="width: 50%;"></div>
                  </div>
                </div>
            </div>
  
       
          </div>
        </div>
      </div>

      <!-- 멤버십 만료일 -->

      <div class="col-md-3">
        <div class="x_panel tile fixed_height_150 overflow_hidden topcard2">
            <div class="expiredate_top">
                <div class="expiredate_top_left">
                  <i class="fa-regular fa-calendar"></i> 멤버십 만료일
                </div>
                <div class="expiredate_top_right">
                    <i class="green">10일 남았어요</i>
                </div>
            </div>

            <div class="expiredate_bottom">
                <div class="expiredate_bottom_content">36</div>
            </div>
        </div>
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

        <div class="x_panel tile fixed_height_600 overflow_hidden donutbox">
          <div class="x_title">
            <h2>오늘의 운동</h2>
            <ul class="nav navbar-right panel_toolbox">
              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                  role="button" aria-expanded="false"><i
                    class="fa fa-wrench"></i></a>
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
            <table class="" style="width:100%">
              <tr>
                <th style="width:37%;">
                  <p>Top 5</p>
                </th>
              </tr>
              <table>
                <tr>
                  <td>
                    <canvas class="canvasDoughnut" height="140" width="140"
                    style="margin: 15px 10px 10px 0"></canvas>
                  </td>
              </tr>
              </table>

            </table>

          <!-- 차트 설명 -->
          </div>
          <div class="x_content">
            <table class="" style="width:100%">
              <tr>

                <th>
                  <div class="col-lg-7 col-md-7 col-sm-7 ">
                    <p class="">Device</p>
                  </div>
                  <div class="col-lg-5 col-md-5 col-sm-5 ">
                    <p class="">Progress</p>
                  </div>
                </th>
              </tr>
              <tr>
                <td>
                  <table class="tile_info">
                    <tr>
                      <td>
                        <p><i class="fa fa-square blue"></i>스쿼트 </p>
                      </td>
                      <td>80kcal</td>
                    </tr>
                    <tr>
                      <td>
                        <p><i class="fa fa-square green"></i>팔굽혀펴기
                        </p>
                      </td>
                      <td>270kcal</td>
                    </tr>
                    <tr>
                      <td>
                        <p><i class="fa fa-square purple"></i>줌바댄스
                        </p>
                      </td>
                      <td>200kcal</td>
                    </tr>
                    <tr>
                      <td>
                        <p><i class="fa fa-square aero"></i>라인댄스 </p>
                      </td>
                      <td>100kcal</td>
                    </tr>
                    <tr>
                      <td>
                        <p><i class="fa fa-square red"></i>Others </p>
                      </td>
                      <td>300kcal</td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
          </div>
        </div>
      </div>

      <!-- 꺾은 선 -->
      <div class="col-md-8 col-sm-8 ">
        <div class="x_panel tile fixed_height_287 overflow_hidden">
          <div class="x_title">
            <h2> 체중 변화 </h2>
            <ul class="nav navbar-right panel_toolbox">
              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                  role="button" aria-expanded="false"><i
                    class="fa fa-wrench"></i></a>
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

            <div class="demo-container" style="height:200px">
              <div id="chart_plot_02" class="demo-placeholder"></div>
            </div>

          </div>
        </div>
      </div>

      <!-- 표 차트 -->
      <div class="col-md-4 col-sm-4 ">
        <div class="x_panel tile fixed_height_287 overflow_hidden">
          <div class="x_title">
            <h2>운동 시간</h2>
            <ul class="nav navbar-right panel_toolbox">
              <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                  role="button" aria-expanded="false"><i
                    class="fa fa-wrench"></i></a>
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

            <table class="" style="width:100%">
              <tr>
                <th>
                  <div class="col-lg-7 col-md-7 col-sm-7 ">
                    <p class=""> 운동명 </p>
                  </div>
                  <div class="col-lg-5 col-md-5 col-sm-5 ">
                    <p class=""> 시간 </p>
                  </div>
                </th>
              </tr>

              <tr>
                <td>
                  <table class="tile_info">
                    <tr>
                      <td>
                        <p><i class="fa fa-square blue"></i> 스쿼트 </p>
                      </td>
                      <td>30회</td>
                    </tr>
                    <tr>
                      <td>
                        <p><i class="fa fa-square green"></i> 팔굽혀펴기
                        </p>
                      </td>
                      <td>20회</td>
                    </tr>
                    <tr>
                      <td>
                        <p><i class="fa fa-square purple"></i> 줌바댄스
                        </p>
                      </td>
                      <td>30 min</td>
                    </tr>
                    <tr>
                      <td>
                        <p><i class="fa fa-square aero"></i> 라인 댄스 </p>
                      </td>
                      <td>30 min</td>
                    </tr>
                    <tr>
                      <td>
                        <p><i class="fa fa-square red"></i> Others </p>
                      </td>
                      <td>20min</td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>

          </div>
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
                <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                  role="button" aria-expanded="false"><i
                    class="fa fa-wrench"></i></a>
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


            <h4>막대 세로그래프 (단위:kcal) 주/월/연</h4>
            <div class="widget_summary">
              <div class="w_left w_25">
                <span>월</span>
              </div>
              <div class="w_center w_55">
                <div class="progress">
                  <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 66%;">
                    <span class="sr-only">60% Complete</span>
                  </div>
                </div>
              </div>
              <div class="w_right w_20">
                <span>250</span>
              </div>
              <div class="clearfix"></div>
            </div>

            <div class="widget_summary">
              <div class="w_left w_25">
                <span>화</span>
              </div>
              <div class="w_center w_55">
                <div class="progress">
                  <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 45%;">
                    <span class="sr-only">60% Complete</span>
                  </div>
                </div>
              </div>
              <div class="w_right w_20">
                <span>300</span>
              </div>
              <div class="clearfix"></div>
            </div>
            <div class="widget_summary">
              <div class="w_left w_25">
                <span>수</span>
              </div>
              <div class="w_center w_55">
                <div class="progress">
                  <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 25%;">
                    <span class="sr-only">60% Complete</span>
                  </div>
                </div>
              </div>
              <div class="w_right w_20">
                <span>150</span>
              </div>
              <div class="clearfix"></div>
            </div>
            <div class="widget_summary">
              <div class="w_left w_25">
                <span>목</span>
              </div>
              <div class="w_center w_55">
                <div class="progress">
                  <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 5%;">
                    <span class="sr-only">60% Complete</span>
                  </div>
                </div>
              </div>
              <div class="w_right w_20">
                <span>0</span>
              </div>
              <div class="clearfix"></div>
            </div>
            <div class="widget_summary">
              <div class="w_left w_25">
                <span>금</span>
              </div>
              <div class="w_center w_55">
                <div class="progress">
                  <div class="progress-bar bg-green" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 2%;">
                    <span class="sr-only">60% Complete</span>
                  </div>
                </div>
              </div>
              <div class="w_right w_20">
                <span>80</span>
              </div>
              <div class="clearfix"></div>
            </div>


             
          </div>
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
                <div class="points">
                  NEW
                </div>
              </div>

              <div class="hispicture">

                <div>
                  <img src="../production/images/choidainpic.jpg">
                </div>

              </div>


              <div class="hisrank_kor">
                <div class="points">
                  신규회원
                </div>
              </div>
            </div>

            <div class="front_right">
              <div class="hisname">최 다 인</div>

              <div class="hisinfo">
                <div class="info_tr">
                  <div>등록일자</div>
                  <div>2023.07.23</div>
                </div>
                <div class="info_tr">
                  <div>성별</div>
                  <div>여성</div>
                </div>
                <div class="info_tr">
                  <div>나이</div>
                  <div>만 30세</div>
                </div>

                <!-- <div class="coords">
                  <span>회원등록</span>
                  <span>2023.07.23</span>
                </div>
                <div class="coords">
                  <span>성별</span>
                  <span>여성</span>
                </div>
                <div class="coords">
                  <span>나이</span>
                  <span>만 30살</span>
                </div>
                <div class="coords">
                  <span>연락처</span>
                  <span>010-2304-1709</span>
                </div>
                <div class="coords">
                  <span>몸무게</span>
                  <span>45kg</span>
                </div>
                <div class="coords">
                  <span>키</span>
                  <span>165cm</span>
                </div> -->
              </div>

            </div>
          </div>


          <div class="back">
            <!-- 뒷면 내용 -->
            <h2>아... 생각보다 안 예쁘다 그냥 좌우로 초록색 차오르는 걸로 만들자</h2>
          </div>
        </div>
      </div>
      


 <!-- 색이 차오르는 카드 -->

 




      <!-- 캘린더 -->
      <div class="x_panel tile fixed_height_287 overflow_hidden">
        <div class="x_title">
          <h2>캘린더</h2>
          <ul class="nav navbar-right panel_toolbox">
            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                role="button" aria-expanded="false"><i
                  class="fa fa-wrench"></i></a>
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

      <!-- 캘린더 설명 -->
      <div class="x_panel tile fixed_height_287 overflow_hidden">
        <div class="x_title">
          <h2>일 정</h2>
          <ul class="nav navbar-right panel_toolbox">
            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
            </li>
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown"
                role="button" aria-expanded="false"><i
                  class="fa fa-wrench"></i></a>
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


    </div>
  </div>

</div>

</div>
</div>

<div class="clearfix"></div>

<div class="row">


</div>

<!-- /page content -->
        

        <!-- footer content -->
        <!-- <footer>
          <div class="choidain_footer">
            <marquee behavior="" direction="">123123 </marquee>
          </div>
        </footer> -->
        <!-- /footer content -->

    <!-- jQuery -->
    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="../vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FastClick -->
    <script src="../vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="../vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="../vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="../vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="../vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="../vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="../vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="../vendors/Flot/jquery.flot.js"></script>
    <script src="../vendors/Flot/jquery.flot.pie.js"></script>
    <script src="../vendors/Flot/jquery.flot.time.js"></script>
    <script src="../vendors/Flot/jquery.flot.stack.js"></script>
    <script src="../vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="../vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="../vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="../vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="../vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="../vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="../vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="../vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="../vendors/moment/min/moment.min.js"></script>
    <script src="../vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="../build/js/custom.min.js"></script>
	
  </body>
</html>
