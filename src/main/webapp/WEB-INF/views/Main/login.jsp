<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
request.getAttribute("memberList");
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
<jsp:include page="/WEB-INF/views/include/header.jsp" />
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
							<div class="login">
								<div>
									<a class="hiddenanchor" id="signup"></a> <a
										class="hiddenanchor" id="signin"></a>

									<div class="login_wrapper">
										<div class="animate form login_form">
											<section class="login_content">
												<form>
													<h1>Login Form</h1>
													<div>
														<input type="text" class="form-control"
															placeholder="Username" required />
													</div>
													<div>
														<input type="password" class="form-control"
															placeholder="Password" required />
													</div>
													<div>
														<a class="btn btn-default submit" href="index.html">Log
															in</a> <a class="reset_pass" href="#">Lost your password?</a>
													</div>

													<div class="clearfix"></div>

													<div class="separator">
														<p class="change_link">
															New to site? <a href="#signup" class="to_register">
																Create Account </a>
														</p>

														<div class="clearfix"></div>
													</div>
												</form>
											</section>
										</div>

										<div id="register" class="animate form registration_form">
											<section class="login_content">
												<form>
													<h1>Create Account</h1>
													<div>
														<input type="text" class="form-control"
															placeholder="Username" required />
													</div>
													<div>
														<input type="email" class="form-control"
															placeholder="Email" required />
													</div>
													<div>
														<input type="password" class="form-control"
															placeholder="Password" required />
													</div>
													<div>
														<a class="btn btn-default submit" href="index.html">Submit</a>
													</div>

													<div class="clearfix"></div>

													<div class="separator">
														<p class="change_link">
															Already a member ? <a href="#signin" class="to_register">
																Log in </a>
														</p>

														<div class="clearfix"></div>
													</div>
												</form>
											</section>
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
	</div>
	<jsp:include page="/WEB-INF/views/include/footer_script.jsp" />
</body>
</html>
