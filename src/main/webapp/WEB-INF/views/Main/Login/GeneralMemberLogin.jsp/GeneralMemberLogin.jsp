<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link href="assets/Main/Login/css/style.css" rel="stylesheet" />
</head>

<body class="nav-md">
	<div class="container">
		<div class="left-panel-active">
			<!-- Sign Up -->
			<div class="container__form container--signup">
				<form action="/Main.say" method="POST" class="form" id="memberJoinForm">
					<h2 class="form__title">회원 가입</h2>
					<input type="hidden" name="c" value="memberAddInfo">
					<input type="hidden" name="loginType" value="member">
					<input type="text" placeholder="이름" class="input" name="memberName"
						required="required" /> <input type="email" placeholder="Email"
						class="input" name="memberEmail" required="required" /> <input
						type="password" placeholder="비밀번호" class="input"
						name="memberPassword1" required="required" />
					<button class="btn">회원 가입</button>
				</form>
			</div>

			<!-- Sign In -->
			<div class="container__form container--signin">
				<form action="/Main.say" method="POST" class="form"
					id="memberLoginForm">
					<c:if test="${loginError != null}">
						<div class="alert alert-danger" role="alert">${loginError}</div>
					</c:if>
					<h2 class="form__title">회원 로그인</h2>
					<input type="hidden" name="c" value="generalLoginCheck" /> <input
						type="hidden" name="loginType" value="member" /> <input
						type="email" placeholder="Email" class="input" name="id"
						required="required" value="${email}" /> <input type="password"
						placeholder="비밀번호" class="input" name="password"
						required="required" /> <a href="#" class="link">비밀번호를
						잊어먹으셨습니까?</a>
					<button class="btn">로그인</button>
				</form>
			</div>

			<!-- Overlay -->
			<div class="container__overlay">
				<div class="overlay">
					<div class="overlay__panel overlay--left">
						<button class="btn" id="memberSignIn">회원 로그인</button>
					</div>
					<div class="overlay__panel overlay--right">
						<button class="btn" id="memberSignUp">회원 가입</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script src="assets/Main/Login/js/custom.js"></script>
</body>
</html>
