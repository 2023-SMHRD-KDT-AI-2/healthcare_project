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

							<div class="col-md-12 col-sm-12">
								<div class="x_panel">
									<div class="x_content">
										<form class="" action="" method="post" novalidate>
											<span class="section">새로운 트레이너 등록</span>
											<div class="field item form-group">
												<label class="col-form-label col-md-3 col-sm-3  label-align">Name<span
													class="required">*</span></label>
												<div class="col-md-6 col-sm-6">
													<input class="form-control" data-validate-length-range="6"
														data-validate-words="2" name="name"
														placeholder="ex. John f. Kennedy" required="required" />
												</div>
											</div>
											<div class="field item form-group">
												<label class="col-form-label col-md-3 col-sm-3  label-align">Occupation<span
													class="required">*</span></label>
												<div class="col-md-6 col-sm-6">
													<input class="form-control" class='optional'
														name="occupation" data-validate-length-range="5,15"
														type="text" />
												</div>
											</div>
											<div class="field item form-group">
												<label class="col-form-label col-md-3 col-sm-3  label-align">email<span
													class="required">*</span></label>
												<div class="col-md-6 col-sm-6">
													<input class="form-control" name="email" class='email'
														required="required" type="email" />
												</div>
											</div>
											<div class="field item form-group">
												<label class="col-form-label col-md-3 col-sm-3  label-align">Confirm
													email address<span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6">
													<input class="form-control" type="email" class='email'
														name="confirm_email" data-validate-linked='email'
														required='required' />
												</div>
											</div>
											<div class="field item form-group">
												<label class="col-form-label col-md-3 col-sm-3  label-align">Number
													<span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6">
													<input class="form-control" type="number" class='number'
														name="number" data-validate-minmax="10,100"
														required='required'>
												</div>
											</div>
											<div class="field item form-group">
												<label class="col-form-label col-md-3 col-sm-3  label-align">Date<span
													class="required">*</span></label>
												<div class="col-md-6 col-sm-6">
													<input class="form-control" class='date' type="date"
														name="date" required='required'>
												</div>
											</div>
											<div class="field item form-group">
												<label class="col-form-label col-md-3 col-sm-3  label-align">Time<span
													class="required">*</span></label>
												<div class="col-md-6 col-sm-6">
													<input class="form-control" class='time' type="time"
														name="time" required='required'>
												</div>
											</div>

											<div class="field item form-group">
												<label class="col-form-label col-md-3 col-sm-3  label-align">Password<span
													class="required">*</span></label>
												<div class="col-md-6 col-sm-6">
													<input class="form-control" type="password" id="password1"
														name="password"
														pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#$%^&*]).{8,}"
														title="Minimum 8 Characters Including An Upper And Lower Case Letter, A Number And A Unique Character"
														required /> <span
														style="position: absolute; right: 15px; top: 7px;"
														onclick="hideshow()"> <i id="slash"
														class="fa fa-eye-slash"></i> <i id="eye" class="fa fa-eye"></i>
													</span>
												</div>
											</div>

											<div class="field item form-group">
												<label class="col-form-label col-md-3 col-sm-3  label-align">Repeat
													password<span class="required">*</span>
												</label>
												<div class="col-md-6 col-sm-6">
													<input class="form-control" type="password"
														name="password2" data-validate-linked='password'
														required='required' />
												</div>
											</div>
											<div class="field item form-group">
												<label class="col-form-label col-md-3 col-sm-3  label-align">Telephone<span
													class="required">*</span></label>
												<div class="col-md-6 col-sm-6">
													<input class="form-control" type="tel" class='tel'
														name="phone" required='required'
														data-validate-length-range="8,20" />
												</div>
											</div>
											<div class="field item form-group">
												<label class="col-form-label col-md-3 col-sm-3  label-align">message<span
													class="required">*</span></label>
												<div class="col-md-6 col-sm-6">
													<textarea required="required" name='message'></textarea>
												</div>
											</div>
											<div class="ln_solid">
												<div class="form-group">
													<div class="col-md-6 offset-md-3">
														<button type='submit' class="btn btn-primary">Submit</button>
														<button type='reset' class="btn btn-success">Reset</button>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<!-- /main content END -->
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

	<jsp:include page="/WEB-INF/views/include/footer_script.jsp" />
	<!-- Members Custom Scripts -->
	<script src="assets/Main/js/custom.js"></script>

	<script> let goodColor = [
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
				label : '연령',
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