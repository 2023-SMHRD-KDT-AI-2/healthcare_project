<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.sayproject.model.Diet.*"%>
<%@ page import="java.io.FileWriter" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.google.gson.Gson"%>

<%
	String mealData = (String) request.getAttribute("mealData");
	
	// ArrayList<Diet> breakfastDietList = (ArrayList) request.getAttribute("breakfastDietList");
	// ArrayList<Diet> lunchDietList = (ArrayList) request.getAttribute("lunchDietList");
	// ArrayList<Diet> dinnerDietList = (ArrayList) request.getAttribute("dinnerDietList");
	// ArrayList<Diet> otherfoodDietList = (ArrayList) request.getAttribute("otherfoodDietList");
	
	// System.out.print(breakfastDietList);
%>

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
<link href="assets/Diet/css/custom.css" rel="stylesheet" />
<link href="assets/Diet/css/custom-d.css" rel="stylesheet" />
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
						<h3>영양 섭취 정보</h3>
					</div>
				</div>
				<div class="clearfix"></div>
				
					<!-- add food content -->
					<div class="col-md-5 col-sm-12">
						<div class="x_panel">
							<div class="x_title">
								<div class="title_left">
									<h2>아침</h2>
								</div>
								<div class="clearfix"></div>
							</div>

							<div id="breakfast_food_info" class="x_content">

							</div>
						</div>

						<div class="x_panel">
							<div class="x_title">
								<div class="title_left">
									<h2>점심</h2>
								</div>
								<div class="clearfix"></div>
							</div>

							<div id="lunch_food_info" class="x_content">

							</div>
						</div>

						<div class="x_panel">
							<div class="x_title">
								<div class="title_left">
									<h2>저녁</h2>
								</div>
								<div class="clearfix"></div>
							</div>

							<div id="dinner_food_info" class="x_content">

							</div>
						</div>
						
						<div class="x_panel">
							<div class="x_title">
								<div class="title_left">
									<h2>간식</h2>
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
					<div class="col-md-4 col-sm-12">
						<div class="x_panel">
							<div class="x_title">
								<div class="title_left"><h2>오늘 내가 먹은 영양소는?</h2></div>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<canvas id="doughtnut-chart1"></canvas>
							</div>
							<div class="x_content">
								<div class="all_nutrient">
								</div>
							</div>
						</div>
					</div>
					<!-- /all nutrient content -->

					<div class="col-md-3 col-sm-12">
						<div class="x_panel">
							
						</div>
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
<script src="assets/Diet/js/custom.js"></script>
<script src="assets/Diet/js/custom-d.js"></script>

</body>
</html>
