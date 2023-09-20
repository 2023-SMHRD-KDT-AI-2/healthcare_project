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
<!-- Bootstrap -->
<link href="assets\css\bootstrap-4.6.2\bootstrap.min.css"
	rel="stylesheet" />
<!-- Animate.css -->
<link href="assets/vendors/animate.css/animate.min.css" rel="stylesheet">
<link href="assets/Main/Login/css/style.css" rel="stylesheet">
</head>

<body class="nav-md">

	<div class="container">
		<!-- Sign In -->
		<div class="container__form container--admin_and_trainer_signin">
			<form action="/Main.say" method="post" class="form"
				id="bossLoginForm">
				<input type="hidden" name="c" value="bossLoginCheck"> <input
					type="hidden" name="loginType" value="boss">
					<c:if test="${errorMessage != null}">
						<div class="alert alert-danger" role="alert">${errorMessage}
						</div>
					</c:if>
				<h2 class="form__title">대표자 로그인</h2>
				<input type="email" placeholder="Email" class="input" name="masterid" /> <input
					type="password" placeholder="비밀번호" class="input" name="masterpassword" />
				<button class="btn">로그인</button>
			</form>
		</div>
	</div>

	<script src="assets/Main/Login/js/custom.js"></script>
</body>
</html>
