<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.sayproject.model.Members.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
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
<link href="assets/Members/css/custom.css" rel="stylesheet" />

<style>

/* 박스 안 차트 공간 */

.bar_box{
	display: flex;
	flex-direction: column;
	height: 100%;
}

.bar_top{
	height:10%;
}

.bar_bottom{
	height: 90%;
	margin: 10px;
	
} 


.x_panel2{
position: relative;
width: 100%;
margin-bottom: 10px;
padding: 10px 17px;
display: inline-block;
background: #fff;
-webkit-column-break-inside: avoid;
-moz-column-break-inside: avoid;
column-break-inside: avoid;
opacity: 1;
-webkit-transition: all .2s ease;
transition: all .2s ease;
}



/* 차트들 컨테이너*/
.x_panel .widthBarChart-container{
	width: 100%;
	height: 100%;
}

.x_panel .DoughnutPieChart-container{
	width: 90%;
	height: 90%;
}

.x_panel .lineWaveChart-contatiner{
	width: 100%;
	height: 100%;
}

.x_panel .demo-container{
	width: 100%;
	height: 100%;
}






.left_area{
	display: flex;
	flex-direction: column;
}

.left_top{
	width: 100%;
	height: 10%;
	display: flex;
}

.left_middle{
	width:100%;
	height: 30%;
	display: flex;
}

.left_bottom{
	width: 100%;
	height:60%;
}

.left_top_l{
	background-color: rgb(61, 240, 195);
	display: flex;
	width: 40%;
	height: 100%;
}

.left_top_r{
	background-color: rgb(238, 120, 238);
	display: flex;
	width: 60%;
	height: 100%;
}	




/* Exercise 에서 가져온 css*/

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
      color: #490000; 
      color: #1abb9c;
    }




    .fixed_height_115{
      height: 115px;
    }

	.fixed_height_300{
	  height: 300px;
	}

	.fixed_height_380{
		height :380px;
	}

    .fixed_height_680{
      height:680px;
    }



    .four_card{
      display: flex;
    }

    .count_top{
      display: flex;
      flex-direction: row;
    }

	.membership{
		width: 82%;
	}

	.membership2{
		width: 70%;
	}

	.count_month{
		width: 18%;
		font-style: italic;
		color:#d4fff6;
		font-weight: bold;
	}

	.count_month2{
		width: 30%;
		font-style: italic;
		color:#d4fff6;
		font-weight: bold;
	}

    .count_bottom{
      display: flex;
      flex-direction: row;
    }

    /* 일째 작업 */

    .count_day{
      display:flex;
      align-items: baseline;
    }


    .day_num{
      width:35%;
      color:#ffffff;
      font-size: 50px;
      font-weight: 800;
      font-family: 'Poppins', sans-serif;
	  text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5);
    }

    .day_day{
      width:65%;
      font-size: 25px;
      font-weight: 800;
      color: #ffffff;
      display: none;
      font-family: 'Noto Sans KR', sans-serif;
	  	  text-shadow: 2px 2px 2px rgba(0, 0, 0, 0.5);
    }

    .day_clock{
      display: flex;
      flex-direction: column;
    }

    .day_day_hide {
      
      font-size: 18px;
      font-weight: 800;
      color: #ffffff;
      z-index: 1;
      font-family: 'Noto Sans KR', sans-serif;
    }


    .topcard1{
      background: linear-gradient(45deg, #8640fb, #a835ec, #c628ed);
      color:  white ;
	  font-weight: bold;
	  box-shadow: 5px 5px 10px 0px rgba(0, 0, 0, 0.5);
    }

    .topcard2{
      background: linear-gradient(45deg,#5086f0, #42b4eb, #17e4e5);
      color: white ;
	  font-weight: bold;
	  box-shadow: 5px 5px 10px 0px rgba(0, 0, 0, 0.5);
    }

	.topcard3{
      background: linear-gradient(45deg,#28c4ba, rgb(60, 210, 205),#20dcd7);
      color: white ;
	  font-weight: bold;
	  box-shadow: 5px 5px 10px 0px rgba(0, 0, 0, 0.5);
    }

	.topcard4{
      background: linear-gradient(45deg,#5086f0, #42b4eb, #17e4e5);
      color: white ;	  font-weight: bold;
    }





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

        

.x_content_top_{
  display: flex;
  flex-direction: column;
}
.x_content_top{
  display: flex;
  flex-direction: column;
}
  
 .x_content_top_t{
    width: 20%;

    text-align: left;
 }

 .x_content_top_b{
    width: 80%;
    align-items: center;
    align-content: center;
    margin-left: 25px;
 }
 
 /* 스케줄러 timetable */
.blue {
  background: #4e8eef;
  color: white;
  font-weight: bold;
}

.purple {
  background: #933bf4;
  color: white;
  font-weight: bold;
}

.navy {
  background: #34495e;
  color: white;
  font-weight: bold;
}

.green {
  background: #30c9c1;
  color: white;
  font-weight: bold;
}

.red {
  background: #f7288c;
  color: white;
  font-weight: bold;
}

.orange {
  background: #ff9a1e;
  color: white;
  font-weight: bold;
}

.cs335, .cs426, .md303, .md352, .md313, .cs240 {
  font-weight: 300;
  cursor: pointer;
}

.x_panel .tab table {
  font-family: 'Open Sans', Helvetica;
  color: #ffffff;
  font-weight: bold;
}
.x_panel .tab table tr:nth-child(2n) {
  background: #eaeaea;
}
.x_panel .tab table tr:nth-child(2n+3) {
  background: #fff;
}
.x_panel .tab table th, table td {
  padding: 1em;
  width: 5em;
}

/* .x_panel .tab table td {
  font-family: 'Open Sans', Helvetica;
  color: #ffffff;
  font-weight: bold;
} */

.days, .time {
  background: #2d2d2e;
  text-transform: uppercase;
  font-size: 0.6em;
  text-align: center;
}

.time {
  width: 3em !important;
}

/* Add this attribute to the element that needs a tooltip */
[data-tooltip] {
  position: relative;
  z-index: 2;
  cursor: pointer;
}

/* Hide the tooltip content by default */
[data-tooltip]:before,
[data-tooltip]:after {
  visibility: hidden;
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
  opacity: 0;
  pointer-events: none;
  -moz-transition: ease 0.5s all;
  -o-transition: ease 0.5s all;
  -webkit-transition: ease 0.5s all;
  transition: ease 0.5s all;
}

/* Position tooltip above the element */
[data-tooltip]:before {
  position: absolute;
  bottom: 110%;
  left: 50%;
  margin-bottom: 5px;
  margin-left: -80px;
  padding: 7px;
  width: 160px;
  -moz-border-radius: 6px;
  -webkit-border-radius: 6px;
  border-radius: 6px;
  background-color: black;
  color: #fff;
  content: attr(data-tooltip);
  text-align: center;
  font-size: 14px;
  line-height: 1.2;
}

/* Triangle hack to make tooltip look like a speech bubble */
[data-tooltip]:after {
  position: absolute;
  bottom: 110%;
  left: 50%;
  margin-left: -5px;
  width: 0;
  border-top: 5px solid black;
  border-right: 5px solid transparent;
  border-left: 5px solid transparent;
  content: " ";
  font-size: 0;
  line-height: 0;
}

/* Show tooltip content on hover */
[data-tooltip]:hover:before,
[data-tooltip]:hover:after {
  visibility: visible;
  bottom: 90%;
  filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
  opacity: 1;
} */


</style>


</head>

<body class="nav-md">
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
			<div class="right_col" role="main">
				<div class="">
					<div class="row">
						<div class="col-md-9 col-sm-12 left_area">
							
							<!-- main content -->
						<div class="row">
						<div class="left_top">

				<!-- 전체 회원 수 -->
				<div class="col-md-3">
				<div class="x_panel2 tile fixed_height_115 overflow_hidden topcard1">
					<div class="count_top">
						<div class="membership">
							<i class="fa fa-user"></i> 전체 회원수
						</div>
						<div class="count_month">
							▼ 16명
						</div>
					</div>
					<div class="count_day">
						<div class="day_num"><span class="randomNumber">80</span></div>
						<div class="day_day"> 명 </div>
						<div class="day_day_hide"> 명 </div>
					</div>
				</div>
			</div>

			<!-- 이번달 신규회원  -->
			<div class="col-md-3">
			<div class="x_panel2 tile fixed_height_115 overflow_hidden topcard2">
				<div class="count_top">
					<div class="membership">
						<i class="fa fa-user"></i> 이번달 신규회원
					</div>
					<div class="count_month">
						▲ 2명
					</div>
				</div>
				<div class="count_day">
					<div class="day_num"><span class="randomNumber">15</span></div>
					<div class="day_day"> 명 </div>
					<div class="day_day_hide"> 명 </div>
				</div>
			</div>
		</div>
								

		
		<!-- 나의 회원수 -->
		<div class="col-md-3">
		<div class="x_panel2 tile fixed_height_115 overflow_hidden topcard3">
			<div class="count_top">
				<div class="membership">
					<i class="fa fa-user"></i> 나의 회원수 
				</div>
				<div class="count_month">
					▲ 8명
				</div>
			</div>
			<div class="count_day">
				<div class="day_num"><span class="randomNumber">12</span></div>
				<div class="day_day"> 명 </div>
				<div class="day_day_hide"> 명 </div>
			</div>
		</div>
	</div>
		
		<!-- 오늘 PT예약 -->	
		<div class="col-md-3">
			<div class="x_panel2 tile fixed_height_115 overflow_hidden topcard2">
				<div class="count_top">
					<div class="membership2">
						<i class="fa fa-user"></i> 오늘PT예약
					</div>
					<div class="count_month2">
						2023. 09. 12
					</div>
				</div>
				<div class="count_day">
					<div class="day_num"><span class="randomNumber">5</span></div>
					<div class="day_day"> 건 </div>
					<div class="day_day_hide"> 건 </div>
				</div>
			</div>
		</div>

							<!-- <div class="left_top_l"></div>
							<div class="left_top_r"></div> -->
						</div>
					</div>

						
	<!-- 차트 칸 -->
					<div class="row">
						<div class="left_middle">
							
							<!-- 가로 막대 차트 (회원 연령) -->
							<div class="col-md-5">
							<div class="x_panel tile fixed_height_300 overflow_hidden topcard">
							
							<div class="bar_box">
								<div class="bar_top">
									<p>회원 연령</p>
								</div>
	
								<div class="bar_bottom">
									<div class="widthBarChart-container">
										<canvas id="widthBar-chart"></canvas>
									</div>
								</div>
							</div>

							</div>
						  	</div>


					  
							<!-- 파이 차트 (회원 성별) -->
							<!-- <div class="col-md-3">
							<div class="x_panel tile fixed_height_300 overflow_hidden topcard">
							
							<div class="bar_box">
								<div class="bar_top">
									회원 성별
								</div>
	
								<div class="bar_bottom">
									<div class="DoughnutPieChart-container">
										<canvas id="DoughnutPie-chart"></canvas>
									</div>
								</div>
							</div>
					
							  </div>
							</div> -->

							<!-- 물결 차트 (신규회원수) -->
							<div class="col-md-7">
								<div class="x_panel tile fixed_height_300 overflow_hidden topcard">
								
								<div class="bar_box">
									<div class="bar_top">
										<p>회원수</p>
									</div>
		
									<div class="bar_bottom">
											<div id="chart_plot_02" class="demo-placeholder"></div>
	

										<!-- <div class="lineWaveChart-contatiner">
											<canvas id="LineWave-chart"></canvas>
										</div> -->
									</div>
								</div>
						
								  </div>
								</div>
					  
					

				  <!-- <div class="left_top_l"></div>
				  <div class="left_top_r"></div> -->
			  </div>
			</div>




							<!-- <div class="x_panel">
								<div class="card-group">
									<div class="card border-dark mb-3" style="max-width: 18rem;">
										<div class="card-header">Doughnut Chart</div>
										<div class="card-body text-danger">
											<canvas id="doughnutChart"></canvas>
										</div>
									</div>
									<div class="card border-dark mb-3" style="max-width: 18rem;">
										<div class="card-header">PolarAreaChart</div>
										<div class="card-body text-danger">
											<canvas id="polarAreaChart"></canvas>
										</div>
									</div>
									<div class="card border-dark mb-3" style="max-width: 18rem;">
										<div class="card-header">Header</div>
										<div class="card-body text-danger">
											<canvas id="barChart" height="300px"></canvas>
										</div>
									</div>
									<div class="card border-dark mb-3" style="max-width: 18rem;">
										<div class="card-header">Header</div>
										<div class="card-body text-danger">
											<canvas id="pieChart"></canvas>
										</div>
									</div>
								</div>
							</div> -->

							<div class="left_bottom">

								<div class="x_panel fixed_height_380">
									<table id="dataTable" class="display dataTable">
										<thead>
											<tr>
												<th>사진</th>
												<th>번호</th>
												<th>이름</th>
												<th>나이</th>
												<th>성별</th>
												<th>몸무게</th>
												<th>키</th>
												<th>직업</th>
												<th>연락처</th>
												<th>트레이너</th>
												<th>등록일</th>
											</tr>
										</thead>
										<!-- table ajax return data-->
									</table>
								</div>

							</div>
							<!-- /main content -->
						</div>


						<div class="col-md-3 col-sm-12">
							<div class="x_panel">
								<div id='fullCalendar'></div>

								<!-- 하단 캘린더 주석 처리 -->
								<!-- <br>
								<div id='calendar'></div> -->
							</div>


							<div class="x_panel">
								<div class='tab'>
									<table border='0' cellpadding='0' cellspacing='0'>
									  <tr class='days'>
										<th></th>
										<th>MON</th>
										<th>TUE</th>
										<th>WED</th>
										<th>THU</th>
										<th>FRI</th>
									  </tr>
									  <tr>
										<td class='time'>9</td>
										<td class='cs335 blue' data-tooltip='줌바댄스'>최다인</td>
										<td class='cs426 purple' data-tooltip='크로스핏'>최병훈</td>
										<td></td>
										<td></td>
										<td></td>
									  </tr>
									  <tr>
										<td class='time'>10</td>
										<td></td>
										<td></td>
										<td class='md352 green' data-tooltip='요가'>장지웅</td>
										<td></td>
										<td></td>
									  </tr>
									  <tr>
										<td class='time'>11</td>
										<td></td>
										<td class='cs335 blue' data-tooltip='줌바댄스'>최다인</td>
										<td></td>
										<td></td>
										<td class='md313 red' data-tooltip='개인PT'>장건욱</td>
									  </tr>
									  <tr>
										<td class='time'>12</td>
										<td></td>
										<td></td>
										<td class='md313 red' data-tooltip='개인PT'>장건욱</td>
										<td></td>
										<td></td>
									  </tr>
									  <tr>
										<td class='time'>13</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									  </tr>
									  <tr>
										<td class='time'>14</td>
										<td></td>
										<td></td>
										<td class='cs426 purple' data-tooltip='크로스핏'>최병훈</td>
										<td class='cs240 orange' data-tooltip='개인PT'>장건욱</td>
										<td></td>
									  </tr>
									  <tr>
										<td class='time'>15</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									  </tr>
									  <tr>
										<td class='time'>16</td>
										<td></td>
										<td></td>
										<td></td>
										<td class='cs240 orange' data-tooltip='개인PT'>이나행</td>
										<td></td>
									  </tr>
									  <tr>
										<td class='time'>17</td>
										<td</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									  </tr>
									  <tr>
										<td class='time'>18</td>
										<td class='md352 green' data-tooltip='요가'>장지웅</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									  </tr>
									  <tr>
										<td class='time'>19</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td class='md352 green' data-tooltip='요가'>장지웅</td>
									  </tr>
									  <td class='time'>20</td>
									  <td></td>
									  <td></td>
									  <td></td>
									  <td></td>
									  <td></td>
									</tr>
									</table>
								  </div>
							</div>


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
	<!-- Members Custom Scripts -->
	<script src="assets/Members/js/custom.js"></script>

	<!-- chart.js -->
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<script>
		<!-- doughnut chart -->
		const doughnut = document.getElementById('doughnutChart');

		new Chart(doughnut,
				{
					type : 'doughnut',
					data : {
						labels : [ 'Red', 'Blue', 'Yellow', 'Green', 'Purple',
								'Orange' ],
						datasets : [ {
							label : '# of Votes',
							data : [ 12, 19, 3, 5, 2, 3 ],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							y : {
								beginAtZero : true
							}
						}
					}
				});
		/* polarArea chart */
		const polarArea = document.getElementById('polarAreaChart');

		new Chart(polarArea,
				{
					type : 'polarArea',
					data : {
						labels : [ 'Red', 'Blue', 'Yellow', 'Green', 'Purple',
								'Orange' ],
						datasets : [ {
							label : '# of Votes',
							data : [ 12, 19, 3, 5, 2, 3 ],
							borderWidth : 1
						} ]
					},
					options : {
						scales : {
							y : {
								beginAtZero : true
							}
						}
					}
				});
		/* bar Chart */
		const bardata = {
				  labels: ['1', '2','3','4','5','6','7'],
				  datasets: [{
				    label: 'My First Dataset',
				    data: [65, 59, 80, 81, 56, 55, 40],
				    backgroundColor: [
				      'rgba(255, 99, 132, 0.2)',
				      'rgba(255, 159, 64, 0.2)',
				      'rgba(255, 205, 86, 0.2)',
				      'rgba(75, 192, 192, 0.2)',
				      'rgba(54, 162, 235, 0.2)',
				      'rgba(153, 102, 255, 0.2)',
				      'rgba(201, 203, 207, 0.2)'
				    ],
				    borderColor: [
				      'rgb(255, 99, 132)',
				      'rgb(255, 159, 64)',
				      'rgb(255, 205, 86)',
				      'rgb(75, 192, 192)',
				      'rgb(54, 162, 235)',
				      'rgb(153, 102, 255)',
				      'rgb(201, 203, 207)'
				    ],
				    borderWidth: 1
				  }]
				};
		const barconfig = {
				  type: 'bar',
				  data: bardata,
				  options: {
				    scales: {
				      y: {
				        beginAtZero: true
				      }
				    }
				  },
				};

		
		const bar = document.getElementById('barChart');
		new Chart(bar, barconfig);
		/* pie chart */
		const piedata = {
				  labels: [
				    'Red',
				    'Blue',
				    'Yellow'
				  ],
				  datasets: [{
				    label: 'My First Dataset',
				    data: [300, 50, 100],
				    backgroundColor: [
				      'rgb(255, 99, 132)',
				      'rgb(54, 162, 235)',
				      'rgb(255, 205, 86)'
				    ],
				    hoverOffset: 4
				  }]
				};
		const pieconfig = {
				  type: 'pie',
				  data: piedata,
				};
		const pie = document.getElementById('pieChart');
		new Chart(pie, pieconfig);
	</script>



<!-- 가로 바 막대 차트 (연령) -->
<script>
	let widthBarChart = $('#widthBar-chart');
	let myWidthBarChart = new Chart(widthBarChart, {
	type:'bar',
	data:{
		labels:[
			'20대','30대','40대', '50대', '60대'
		],
		datasets:[
			{
				data:[7,15,30,3,20],
				backgroundColor:["#bc69fa", /* 초록색 */
								 "#7386FF",
								 "#5C9EF5",
								 "#00E1FD",
								 "#1cd8d0"],
				borerColor:[    "#bc69fa",
								 "#7386FF",
								 "#5C9EF5",
								 "#00E1FD",
								 "#00E1FD"],
				hoverBackgroundColor:[
								 "#bc69fa",
								 "#7386FF",
								 "#5C9EF5",
								 "#00E1FD",
								 "#00E1FD"],
				borderWidth: 1
			},

		]
	},
	options:{

		maintainAspectRatio :false,
        plugins: {
            legend: {
                display: false,
                labels: {
                    color: 'rgb(255, 99, 132)'
                }
            }
        },
		indexAxis: 'y'
	}
});
</script>

<!-- 도넛 차트 (성별) -->
<script>
    let doughnutPieChart = $('#DoughnutPie-chart');
    let mydoughnutPieChart = new Chart(doughnutPieChart, {
        type: 'doughnut',
        data: {
            labels: [
                '남성', '여성'
            ],
            datasets: [
                {
                    data: [7, 15],
                    backgroundColor: ["#bc69fa", "#7386FF"],
                    borderColor: ["#bc69fa", "#7386FF"],
                    hoverBackgroundColor: ["#bc69fa", "#7386FF"],
                    borderWidth: 1
                },
            ]
        },
        options: {
            maintainAspectRatio: false,
            legend: {
                display: false // 범례를 숨김
            },
            indexAxis: 'y',
        }
    });
</script>



<!-- 꺾은선 2줄 차트 (월별 신규 회원수 + 월별 회원 수) -->
<script>
	let LineWaverChart = $('#LineWave-chart');
	let myLineWaverChart = new Chart(LineWaverChart, {
	type:'line',
	data:{
		labels:[
			'4월','5월', '6월', '7월', '8월', '9월'
		],
		datasets:[
			{
				data:[7,15],
				backgroundColor:["#bc69fa", 
								 "#7386FF",
								 "#bc69fa", 
								 "#7386FF",
								 "#bc69fa", 
								 "#7386FF"],
				borerColor:[    "#bc69fa",
								 "#7386FF",
								 "#bc69fa", 
								 "#7386FF",
								 "#bc69fa", 
								 "#7386FF"],
				hoverBackgroundColor:[
								 "#bc69fa",
								 "#7386FF",
								 "#bc69fa", 
								 "#7386FF",
								 "#bc69fa", 
								 "#7386FF"],
				borderWidth: 1
			},

		]
	},
	options:{
		maintainAspectRatio :false,
		legend:{
			display:false
		},
		indexAxis: 'y', 
	}
});
</script>




	<!-- calendar.js : https://github.com/williamtroup/Calendar.js -->
	<!-- <script src="assets/js/Calendar/calendar.js"></script>
	<script>
		var calendarInstance = new calendarJs("calendar", {
			exportEventsEnabled : true,
		});

		document.title += " v" + calendarInstance.getVersion();

		var event = {
			from : new Date(),
			to : new Date(),
			title : "New Event",
			description : "A description of the new event"
		};

		calendarInstance.addEvent(event);
	</script> -->

	<!-- full canlendar -->
	<script
		src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.8/index.global.min.js'></script>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('fullCalendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				initialView : 'dayGridMonth'
			});
			calendar.render();
		});
	</script>
</body>
</html>