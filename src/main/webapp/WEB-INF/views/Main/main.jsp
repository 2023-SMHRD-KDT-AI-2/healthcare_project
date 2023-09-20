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
<link href="assets/Main/css/custom.css" rel="stylesheet" />
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
						<div class="col-md-12">
							<!-- main content -->
							<%
							/* 기본적으로 메인 컨텐츠는 이 곳에 입력합니다. */
							%>
							<!-- 상단 박스 -->
							<div class="x_panel">
								<div class="col-md-2">
									<!--  왼쪽 상단 카드 박스 -->
									<div class="x_panel">
										<div class="card-deck bg-light">
											<div class="card text-center">
												<div class="card-header" style="font-size: 15px; color: #084B8A;">출석 상황</div>
												<div class="card-body text-info">
													<h5>
														<i class="glyphicon glyphicon-ok"></i> &nbsp;
														${attendenceCountForTriner} / ${trainerMemberCount}
													</h5>
												</div>
											</div>
										</div>
									</div>
									<div class="x_panel">
										<div class="card-deck bg-light">
											<div class="card text-center">
												<div class="card-header" style="font-size: 15px; color: red;">트레이너 평점</div>
												<div class="card-body text-danger">
													<h5>
														<i class="fa fa-arrow-up"></i> &nbsp; ${avgGrade}
													</h5>
												</div>
											</div>
										</div>
									</div>
									<div class="x_panel">
										<div class="card-deck bg-light">
											<div class="card text-center">
												<div class="card-header" style="font-size: 15px; color: #5C9EF5;">이달의 우수 트레이너</div>
												<div class="card-body text-primary">
													<h5>
														<i class="fa fa-thumbs-o-up" aria-hidden="true"></i> &nbsp; ${TrainerName}
													</h5>
												</div>
											</div>
										</div>
									</div>
									<div class="x_panel">
										<div class="card-deck bg-light">
											<div class="card text-center">
												<div class="card-header" style="font-size: 15px; color: green;"> 현재 pt회원 수  </div>
												<div class="card-body text-success" style="color :084B8A">
													<h5>
														<i class="fa fa-line-chart" aria-hidden="true"></i> &nbsp; ${trainerMemberCount}명
													</h5>
												</div>
											</div>
										</div>
									</div>
									<!--  /왼쪽 상단 카드 박스 END -->
								</div>
								<!-- /상단 박스 END -->
								<!-- 하단 박스 -->
								<div class="col-md-10">
									<!-- 오른쪽 차트, 그래프 -->
									<div class="x_panel">
										<div class="card-deck bg-light">
											<div class="card">
												<div class="card-header" style="font-size: 15px; color: #084B8A;">남녀 성비</div>
												<div class="card-body text-danger">
													<canvas id="doughnutChart" style="height: 100%"></canvas>
												</div>
												<div style="font-size: 22px; height: 60px; text-align: center; font-family: Jeju Gothic, Garamond">
													<i class="fa fa-square" style="color: #5C9EF5;"></i>
													남성 : ${male}명 &nbsp; <!-- <- 띄어쓰기 하는하는 것.-->
													<i class="fa fa-square" style="color: #bc69fa;"></i>
													여성 : ${female}명
												</div>
											</div>

											<div class="card">
												<div class="card-header" style="font-size: 15px; color: #084B8A;">회원 연령 분포</div>
												<div class="card-body text-danger">
													<canvas id="barChart" height="300px"></canvas>
												</div>
													<div style="font-size: 22px; height: 60px; text-align: center; font-family: Jeju Gothic, Garamond">
														<i class="fa fa-square" style="color: #084B8A;"></i>
														총 회원 수 : ${male+female}명
													</div>
											</div>
											<div class="card">
											<div id='calendar'></div>
											</div>
										</div>
									</div>
									<!-- /오른쪽 차트, 그래프 END -->
								</div>
								<!-- /하단 박스 END -->
							</div>
						</div>
					</div>
					<div class="row">
						<!-- 회원 목록 DataTables -->
						<div class="col-md-12">
							<div class="x_panel">
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
						<!-- /회원 목록 DataTables END -->
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

	<jsp:include page="/WEB-INF/views/include/footer_script.jsp" />
	<!-- Members Custom Scripts -->
	<script src="assets/Main/js/custom.js"></script>

	<script > let goodColor = [
        "#bc69fa",
        "#7386FF",
        "#5C9EF5",
        "#00E1FD",
        "#01F6D5",
        "#8258FA",
        "#5858FA",
    ];</script>


	<script>
		// doughnut chart
		const doughnut = document.getElementById('doughnutChart');
		
		new Chart(doughnut, {
			type : 'doughnut',
			data : {
				labels : [ '남성', '여성' ],
	            datasets : [ {
	               label : '# 인원 수',
	               data : [ ${male}, ${female} ],
	               backgroundColor: ["#5C9EF5","#bc69fa"],
	               borderWidth : 1
				} ]
			}
		});
		// polarArea chart
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
		// bar Chart
		const bardata = {
			labels : [ '10대', '20대', '30대', '40대', '50대', '60대', '70대' ],
			datasets : [ {
				label : '인원수',
	            data : [ ${teenage}, ${twenty}, ${thirty}, ${forty}, ${fifty}, ${sixty}, ${seventy}],
	            backgroundColor : goodColor,
	            borderColor : goodColor,
	            borderWidth : 1
			} ]
		};
		const barconfig = {
			type : 'bar',
			data : bardata,
			options : {
				indexAxis : 'y',
				scales : {
					y : {
						beginAtZero : true
					}
				}
			},
		};

		const bar = document.getElementById('barChart');
		new Chart(bar, barconfig);
		// pie chart 
		const piedata = {
			labels : [ 'Red', 'Blue', 'Yellow' ],
			datasets : [ {
				label : 'My First Dataset',
				data : [ 300, 50, 100 ],
				backgroundColor : [ 'rgb(255, 99, 132)', 'rgb(54, 162, 235)',
						'rgb(255, 205, 86)' ],
				hoverOffset : 4
			} ]
		};
		const pieconfig = {
			type : 'pie',
			data : piedata,
		};
		const pie = document.getElementById('pieChart');
		new Chart(pie, pieconfig);
	</script>

	<!-- calendar.js : https://github.com/williamtroup/Calendar.js -->
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
	</script>
</body>
</html>