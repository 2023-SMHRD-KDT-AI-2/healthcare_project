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
							<div class="x_content">
								<div class="container">
									<div class="row row-cols-3">
										<c:forEach items="${arrayListAllTrainerAccount}" var="trainer"
											varStatus="i">

											<div class="col ">
												<div class="card mb-3" style="max-width: 540px;">
													<div class="row no-gutters">
														<div class="col-md-5 p-1">
															<img src="${trainer.getPhotopath()}"
																class="img-thumbnail"
																alt="${trainer.getName()} (${trainer.getAge()}) 님">
														</div>
														<div class="col-md-7">
															<div class="card-body">
																<h5 class="card-title">${trainer.getName()}
																	(${trainer.getAge()}) 님</h5>
																<p class="card-text">고유번호 : ${trainer.getNo()}</p>
																<p class="card-text">아이디 : ${trainer.getEmail()}</p>
																<p class="card-text">닉네임 : ${trainer.getNickname()}</p>
															</div>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
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

	<jsp:include page="/WEB-INF/views/include/footer_script.jsp" />
	<!-- Members Custom Scripts -->
	<script src="assets/Main/js/custom.js"></script>
</body>
</html>