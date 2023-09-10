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
					<div class="page-title">
						<div class="title_left">
							<h3></h3>
						</div>
						<div class="title_right">
							<div class="col-md-5 col-sm-5 form-group pull-right top_search">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search for..." /> <span class="input-group-btn">
										<button class="btn btn-default" type="button">Go!</button>
									</span>
								</div>
							</div>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12">
							<!-- main content -->
							<%
							/* 기본적으로 메인 컨텐츠는 이 곳에 입력합니다. */
							%>

							<div class="x_panel">
								<div class="x_title">
									<h2>
										Form Basic Elements <small>different form elements</small>
									</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											<div class="dropdown-menu"
												aria-labelledby="dropdownMenuButton">
												<a class="dropdown-item" href="#">Settings 1</a> <a
													class="dropdown-item" href="#">Settings 2</a>
											</div></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<br />
									<form class="form-horizontal form-label-left" action="Members.say?c=inputProcess" method="post">
										<div class="form-group row">
											<label class="control-label col-md-3 col-sm-3 ">회원 ID</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" class="form-control" readonly="readonly"
													placeholder="Read-Only Input" name="id" value="1">
											</div>
										</div>
										<div class="form-group row">
											<label class="control-label col-md-3 col-sm-3 ">회원 이름</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" class="form-control" readonly="readonly"
													placeholder="Read-Only Input" name="name" value="윤춘자">
											</div>
										</div>
										<div class="form-group row">
											<label class="control-label col-md-3 col-sm-3 ">담당
												트레이너</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" class="form-control" readonly="readonly"
													placeholder="Read-Only Input" name="trainer" value="1001">
											</div>
										</div>
										<div class="form-group row ">
											<label class="control-label col-md-3 col-sm-3 ">몸무게</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" class="form-control"
													placeholder="몸무게를 입력해주세요. 숫자만 입력 가능 : kg" name="weight">
											</div>
										</div>
										<div class="form-group row ">
											<label class="control-label col-md-3 col-sm-3 ">키</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" class="form-control"
													placeholder="몸무게를 입력해주세요. 숫자만 입력 가능 : kg" name="height">
											</div>
										</div>
										<!-- breakfast -->
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">아침 먹은
												것</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="breakfast_foodname">
											</div>
										</div>
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">아침 먹은
												양</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="breakfast_gram">
											</div>
										</div>
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">아침 먹은
												칼로리</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="breakfast_calorie">
											</div>
										</div>
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">아침 먹은
												것</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="breakfast_foodname">
											</div>
										</div>
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">아침 먹은
												양</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="breakfast_gram">
											</div>
										</div>
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">아침 먹은
												칼로리</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="breakfast_calorie">
											</div>
										</div>
										<!-- /breakfast end -->
										<!--lunch -->
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">점심 먹은
												것</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="lunch1_foodname">
											</div>
										</div>
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">점심 먹은
												양</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="lunch1_gram">
											</div>
										</div>
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">점심 먹은
												칼로리</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="lunch1_calorie">
											</div>
										</div>
										<!-- /lunch end -->
										<!-- dinner -->
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">저녁 먹은
												것</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="dinner1_foodname">
											</div>
										</div>
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">저녁 먹은
												양</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="dinner1_graam">
											</div>
										</div>
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">저녁 먹은
												칼로리</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="dinner1_calorie">
											</div>
										</div>
										<!-- /dinner end -->
										<!-- otherfood -->
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">간식이나 그외 등등 먹은
												것</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="other_foodname">
											</div>
										</div>
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">간식이나 그외 등등 먹은
												양</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="other_gram">
											</div>
										</div>
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">간식이나 그외 등등 먹은
												칼로리</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="other_calorie">
											</div>
										</div>
										<!-- /otherfood end -->
										<!-- /food end -->
										<!-- exercise start -->
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">운동 종류</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="excercise_name">
											</div>
										</div>
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">운동 시간</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="excercise_time">
											</div>
										</div>
										<div class="col-md-4 col-sm-12  form-group">
											<label class="control-label col-md-3 col-sm-3 ">운동 소모 칼로리</label>
											<div class="col-md-9 col-sm-9 ">
												<input type="text" placeholder=".col-md-3"
													class="form-control" name="excercise_calorie">
											</div>
										</div>										
										<!-- /exercise end -->
										<div class="row"></div>
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-9 col-sm-9  offset-md-3">
												<button type="button" class="btn btn-primary">Cancel</button>
												<button type="reset" class="btn btn-primary">Reset</button>
												<button type="submit" class="btn btn-success">Submit</button>
											</div>
										</div>

									</form>
								</div>
							</div>
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
	<script src="assets/Members/js/custom.js"></script>
</body>
</html>