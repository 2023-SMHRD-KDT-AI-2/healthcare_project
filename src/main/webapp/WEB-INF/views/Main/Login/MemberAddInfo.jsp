<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>

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
<!-- Main/Login/Logout Custom Theme Style -->
<link href="assets/Main/css/custom.css" rel="stylesheet" />
</head>

<%
String id = (String) session.getAttribute("id");
String nick = (String) session.getAttribute("nick");
String email = (String) session.getAttribute("email");
String age_range = (String) session.getAttribute("age_range");
String birthday = (String) session.getAttribute("birthday");
String profile_image = (String) session.getAttribute("profile_image");
String name = (String) session.getAttribute("name");



System.out.print(id);
System.out.print(nick);
System.out.print(email);
System.out.print(profile_image);

%>


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
						<div class="clearfix"></div>

						<div class="row">
							<div class="col-md-12 col-sm-12">
								<!-- content -->
								<div class="col-md-3 col-sm-6">
									<div class="x_panel">

										<!-- 카카오에 입력값이 profile_image가 넘어올경우 -->
										<c:if test="${!empty profile_image}">
											<div class="x_content">
												<div class="card" style="width: 100%">
													<img src=${profile_image} class="card-img-top" alt="..." />
													<div class="card-body">
														<p class="card-text">[${email}] ${name} 님 반갑습니다.</p>
													</div>
												</div>
											</div>
										</c:if>

										<!-- 카카오 로그인이 아닌 일반회원 로그인 시 진행 -->
										<c:if test="${empty profile_image}">
											<div class="x_content">
												<div class="card" style="width: 100%">
													<input type="file" name="filename" id="fileInput" style="float: right;">
													 <img id="imagePreview" src="" alt="사진을 업로드해주세요">
													<div class="card-body">
														<p class="card-text">
															<!--input태그 안의 email 이름 가져오기-->
															[<span id="displayEmail"></span>] <span id="displayName"></span>
															님 반갑습니다.
														</p>
													</div>
												</div>
											</div>
										</c:if>

										<script>
											// 파일 입력 필드
											var fileInput = document
													.getElementById("fileInput");

											// 이미지 미리보기를 표시할 이미지 요소
											var imagePreview = document
													.getElementById("imagePreview");

											// 파일 입력 필드가 변경될 때마다 호출되는 함수
											fileInput
													.addEventListener(
															"change",
															function() {
																var file = fileInput.files[0];

																if (file) {
																	var reader = new FileReader();

																	reader.onload = function(
																			e) {
																		imagePreview.src = e.target.result;
																	};

																	reader
																			.readAsDataURL(file);
																} else {
																	// 파일을 선택하지 않았을 때의 처리
																	imagePreview.src = "";
																}
															});
										</script>

										<script>
											// Name입력 요소와 표시할 요소를 가져옵니다.
											var nameInput = document
													.getElementById("name");
											var displayName = document
													.getElementById("displayName");
											// Eamil입력 요소와 표시할 요소를 가져옵니다.
											var emailInput = document
													.getElementById("idOrEmail");
											var displayEmail = document
													.getElementById("displayEmail");

											// 입력 값이 변경될 때마다 실행되는 함수를 만듭니다.
											nameInput
													.addEventListener(
															"input",
															function() {
																// 입력된 값을 가져와서 표시할 요소에 넣습니다.
																var enteredName = nameInput.value;
																displayName.textContent = enteredName;
															});

											emailInput
													.addEventListener(
															"input",
															function() {
																// 입력된 값을 가져와서 표시할 요소에 넣습니다.
																var enteredEmail = emailInput.value;
																displayEmail.textContent = enteredEmail;
															});
										</script>




									</div>
								</div>
								<div class="col-md-9 col-sm-6">
									<div class="x_panel">
										<div class="x_content">
											<div class="col-md-12 col-sm-6">
												<!-- 추가 정보 입력 Form -->
												<form id="personalMemberAddInfo"
													action="/Main.say?c=personalMemberAddInfo" method="get"
													data-parsley-validate
													class="form-horizontal form-label-left">
													<span class="section">Personal Member Info</span>
													<div class="item form-group">
														<label
															class="col-form-label col-md-3 col-sm-3 label-align"
															for="first-name">카카오 번호 <span class="required">*</span>
														</label>
														<div class="col-md-6 col-sm-6 ">
															<input type="text" name="memberObjectId"
																value="${id}" readOnly class="form-control ">
														</div>
													</div>
													<div class="item form-group">
														<label
															class="col-form-label col-md-3 col-sm-3 label-align"
															for="first-name">ID or Email <span
															class="required">*</span>
														</label>
														<div class="col-md-6 col-sm-6 ">
															<input type="text" name="idOrEmail" value=${email}
																readOnly class="form-control ">
														</div>
													</div>
													
													<div class="item form-group">
														<label
															class="col-form-label col-md-3 col-sm-3 label-align"
															for="first-name">이름 <span class="required">*</span>
														</label>
														<div class="col-md-6 col-sm-6 ">
															<input type="text" id="name" required="required" value=${name}
																data-validate-length-range="6" data-validate-words="2"
																class="form-control ">
														</div>
													</div>
													<div class="item form-group">
														<label
															class="col-form-label col-md-3 col-sm-3 label-align"
															for="first-name">몸무게 <span class="required">*</span>
														</label>
														<div class="col-md-6 col-sm-6 ">
															<input type="number" name="weight" required="required"
																class="form-control" data-validate-minmax="30,200">
														</div>
													</div>
													<div class="item form-group">
														<label
															class="col-form-label col-md-3 col-sm-3 label-align"
															for="first-name">키 <span class="required">*</span>
														</label>
														<div class="col-md-6 col-sm-6 ">
															<input type="number" name="height" required="required"
																class="form-control" data-validate-minmax="100,200">
														</div>
													</div>
													<div class="item form-group">
														<label
															class="col-form-label col-md-3 col-sm-3 label-align"
															for="first-name">주소 <span class="required">*</span>
														</label>
														<div class="col-md-6 col-sm-6 ">
															<input type="text" id="address" required="required"
																class="form-control ">
														</div>
													</div>
													<div class="item form-group">
														<label
															class="col-form-label col-md-3 col-sm-3 label-align"
															for="first-name">연락처 <span class="required">*</span>
														</label>
														<div class="col-md-6 col-sm-6 ">
															<input type="text" id="phonenumber" required="required"
																class="form-control ">
														</div>
													</div>
													<div class="item form-group">
														<label
															class="col-form-label col-md-3 col-sm-3 label-align">Gender</label>
														<div class="col-md-6 col-sm-6 ">
															<div id="gender" class="btn-group" data-toggle="buttons">
																<label class="btn btn-secondary"
																	data-toggle-class="btn-primary"
																	data-toggle-passive-class="btn-default"> <input
																	type="radio" name="gender" value="male"
																	class="join-btn"> &nbsp; Male &nbsp;
																</label> <label class="btn btn-primary"
																	data-toggle-class="btn-primary"
																	data-toggle-passive-class="btn-default"> <input
																	type="radio" name="gender" value="female"
																	class="join-btn"> Female
																</label>
															</div>
														</div>
													</div>
													<div class="item form-group">
														<label
															class="col-form-label col-md-3 col-sm-3 label-align"
															for="first-name">나이 <span class="required">*</span>
														</label>
														<div class="col-md-6 col-sm-6 ">
															<input type="text" id="age" required="required"
																class="form-control ">
														</div>
													</div>
													<div class="item form-group">
														<label
															class="col-form-label col-md-3 col-sm-3 label-align"
															for="first-name">회원구분 <span class="required">*</span>
														</label>
														<div class="col-md-6 col-sm-6 ">
															<input type="text" id="age" required="required" placeholder="인증코드 입력"
																class="form-control">
														</div>
														<label
															class="col-form-label col-md-3 col-sm-3 label-align" style="text-align: left !important;"
															for="first-name"><span style="text-align: left;"><i class="fa fa-asterisk"></i>Trainer 코드입력</span>
														</label>
													</div>
													<div class="item form-group">
														<label
															class="col-form-label col-md-3 col-sm-3 label-align">생일
															<span class="required">*</span>
														</label>
														<div class="col-md-6 col-sm-6 ">
															<input id="birthday" name="birthday"
																class="date-picker form-control"
																placeholder="dd-mm-yyyy" type="text" required="required"
																type="text" onfocus="this.type='date'"
																onmouseover="this.type='date'"
																onclick="this.type='date'" onblur="this.type='text'"
																onmouseout="timeFunctionLong(this)">
															<script>
																function timeFunctionLong(
																		input) {
																	setTimeout(
																			function() {
																				input.type = 'text';
																			},
																			60000);
																}
															</script>
														</div>
													</div>

													<div class="ln_solid"></div>
													<div class="item form-group">
														<div class="col-md-6 col-sm-6 offset-md-3">
															<button class="btn btn-primary" type="button">Cancel</button>
															<button class="btn btn-primary" type="reset">Reset</button>
															<button type="submit" class="btn btn-success">Submit</button>
														</div>
													</div>
												</form>
												<!-- /추가 정보 입력 Form END -->
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /content -->
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
		<!-- Main/Login/Logout Custom Theme Script -->
		<script src="assets/Main/js/custom.js"></script>
</body>
</html>
