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
					<div class="row">
						<div class="col-md-12 col-sm-12">
							<!-- main content -->
							<%
							/* 기본적으로 메인 컨텐츠는 이 곳에 입력합니다. */
							%>

							<div class="x_panel">
								<div class="x_title">
									<h2>
										전체 회원 정보 <small>회원 명수 : ${memberList.size()} 명</small>
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
									<div class="container">
										<div class="row row-cols-3">
											<c:forEach var="member" items="${memberList}" varStatus="i">
												<c:if test="${i.index >= ((page * 8) - 8) && i.index <= page * 8}">
													<div class="col ">
														<div class="card mb-3" style="max-width: 540px;">
															<div class="row no-gutters">
																<div class="col-md-5 p-1">
																	<img src="${member.getPhotopath()}"
																		class="img-thumbnail" style="max-height:270px"
																		alt="${member.getName()} (${member.getAge()}) 님">
																</div>
																<div class="col-md-7">
																	<div class="card-body">
																		<h5 class="card-title">${member.getName()}
																			(${member.getAge()}) 님</h5>
																		<p class="card-text">연락처 :
																			${member.getPhone_number()}</p>
																		<p class="card-text">
																			<small class="text-muted">등록일 :
																				${member.getRegist_day()}</small>
																		</p>
																		<!-- 출석 버튼 -->
																		<div class="attendence">
																			<p class="card-text">
																				<a
																					href="Exercise.say?c=sub2&no=${member.getNo()}&name=${member.getName()}&age=${member.getAge()}&gender=${member.getGender()}&weight=${member.getWeight()}&height=${member.getHeight()}&trainer=${member.getTrainer()}"><button
																						type="button" class="btn btn-light btn-block">운동</button></a><a
																					href="Diet.say?c=main&no=${member.getNo()}&name=${member.getName()}&age=${member.getAge()}&gender=${member.getGender()}&weight=${member.getWeight()}&height=${member.getHeight()}&trainer=${member.getTrainer()}"><button
																						type="button" class="btn btn-dark btn-block">식단</button></a>
																				<!-- 출석하였을 때의 처리 -->
																				<c:if test="${member.getAttendence()}">
																					<a
																						href="/Members.say?c=registAttendence&oid=${member.getNo()}&name=${member.getName()}&trainerNumber=${member.getTrainer()}">
																						<button type="button"
																							class="btn btn-success btn-block">출석완료</button>
																					</a>
																				</c:if>
																				<!-- 미출석시에 처리 -->
																				<c:if test="${!member.getAttendence()}">
																					<a
																						href="/Members.say?c=registAttendence&oid=${member.getNo()}&name=${member.getName()}&trainerNumber=${member.getTrainer()}">
																						<button type="button"
																							class="btn btn-primary btn-block">출석확인</button>
																					</a>
																				</c:if>

																			</p>
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</c:if>
											</c:forEach>
										</div>
										<!-- Pagination  -->
										<nav aria-label="Page navigation example">
											<ul class="pagination justify-content-center">
												<c:if test="${page == 1}">
													<li class="page-item disabled"><a class="page-link"
													href="#" tabindex="-1">Previous</a></li>
												</c:if>
												<c:if test="${page > 1}">
													<li class="page-item"><a class="page-link" href="/Members.say?c=Main&page=${page-1}">Previous</a></li>
												</c:if>
												<li class="page-item"><a class="page-link" href="/Members.say?c=Main&page=${page+1}">Next</a>
												</li>
											</ul>
										</nav>
									</div>
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