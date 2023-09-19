<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sayproject.model.Diet.*"%>
<%@ page import="java.io.FileWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.google.gson.Gson"%>

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

<!-- FullCalendar -->
<link href="assets/vendors/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
<link href="assets/vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print">

<!-- Custom Theme Style -->
<link href="assets/Diet/css/custom.css" rel="stylesheet" />
<link href="assets/Diet/css/custom-d.css" rel="stylesheet" />
<style>
	.dropdown-menu {         
		max-height: 600px;
		overflow-y: auto;
}
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
				<div class="page-title">
					<div class="title_left">
						<h3><span id="page-title-member"></span><small>님이 섭취한 영양소는?<small></h3>
					</div>
					<div class="title_right">
						<div class="col-md-3"></div>
						<div class="col-md-3"></div>
						<div class="col-md-3">
							<div class="btn-group">
								<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
								  회원목록
								</button>
								<div class="dropdown-menu" id="memberList">
								</div>
							  </div>
						</div>
						<div class="col-md-3">
							<fieldset>
								<div class="control-group">
								  <div class="controls">
									<div class="xdisplay_inputx form-group row has-feedback">
									  <input type="text" class="form-control has-feedback-left" id="single_calCustom" placeholder="First Name" aria-describedby="inputSuccess2Status">
										  <span class="fa fa-calendar-o form-control-feedback left" aria-hidden="true"></span>
									  <span id="inputSuccess2Status" class="sr-only">(success)</span>
									</div>
								  </div>
								</div>
							</fieldset>	
						</div>
					</div>
				<div class="clearfix"></div>
				
					<!-- add food content -->
					<div class="col-md-6 col-sm-12">
						<div class="x_panel" style="background-color: #F8F9FA; border-radius: 10px;">
							<div class="x_title">
								<div class="title_left">
									<h2 style="font-weight: bold;">아침</h2>
								</div>
								<div class="clearfix"></div>
							</div>

							<div id="breakfast_food_info" class="x_content">

							</div>
						</div>

						<div class="x_panel" style="background-color: #F8F9FA; border-radius: 10px;">
							<div class="x_title">
								<div class="title_left">
									<h2 style="font-weight: bold;">점심</h2>
								</div>
								<div class="clearfix"></div>
							</div>

							<div id="lunch_food_info" class="x_content">

							</div>
						</div>

						<div class="x_panel" style="background-color: #F8F9FA; border-radius: 10px;">
							<div class="x_title">
								<div class="title_left">
									<h2 style="font-weight: bold;">저녁</h2>
								</div>
								<div class="clearfix"></div>
							</div>

							<div id="dinner_food_info" class="x_content">

							</div>
						</div>
						
						<div class="x_panel" style="background-color: #F8F9FA; border-radius: 10px;">
							<div class="x_title">
								<div class="title_left">
									<h2 style="font-weight: bold;">간식</h2>
								</div>
								<div class="x_content"></div>			
								<div class="clearfix"></div>
							</div>

							<div id="otherfood_food_info" class="x_content">

							</div>
						</div>
					</div>
					<!-- /add food content -->
					
					<!-- all nutrient content -->
					<div class="col-md-6 col-sm-12">
						<div class="x_panel" style="background-color: #F8F9FA; border-radius: 10px;">
							<div class="x_title">
								<div class="title_left"><h2  style="font-weight: bold;">오늘 내가 먹은 영양소는?</h2></div>
								<div class="clearfix"></div>
							</div>
							<div id="all_nutrient_chart">
							</div>
							<div class="x_content">
								<div id="all_nutrient_progressBar">
								</div>
							</div>
						</div>
					</div>
					<!-- /all nutrient content -->
					<div class="clearfix"></div>
				</div>

				<div class="clearfix"></div>
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
<script src="assets/Diet/js/autocomplete.js"></script>
<script src="assets/Diet/js/bootstrap-autocomplete.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0/dist/chartjs-plugin-datalabels.min.js"></script>
<script src="assets/Diet/js/index.js"></script>
<script src="assets/Diet/js/mock.js"></script>
<script src="assets/Diet/js/source.js"></script>
<script src="assets/Diet/js/util.js"></script>

<!-- FullCalendar -->
<script src="assets/vendors/moment/min/moment.min.js"></script>
<script src="assets/vendors/fullcalendar/dist/fullcalendar.min.js"></script>

<script>
	// GetFoodName.java에서 request.setAttribute("no", request.getParameter("no")) 가 실행되면
	// Diet.say?c=main으로 no가 넘어온다
	// 넘어온 no는 jsp파일에서 먼저 스크립트 태그를 열어서 변수를 담아준 다음
	// custom-d.js 에서 사용한다.
	let receivedID = "${no}";
</script>
<script src="assets/Diet/js/custom.js"></script>
<script src="assets/Diet/js/custom-d.js"></script>
</body>
</html>
