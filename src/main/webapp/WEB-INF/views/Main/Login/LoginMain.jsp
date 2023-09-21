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
<link href="/assets/Main/Login/css/style.css" rel="stylesheet">
</head>

<body class="nav-md">
	<div class="container">
		<!-- Sign In -->
		<div class="container__form container--admin_and_trainer_signin">
			<div class="jumbotron">
				<h1 class="display-4">Hellow PT</h1>
				<p class="lead">해당 페이지는 관리자 / 트레이너 / 일반 회원의 로그인 구분을 위해 만들어 둔 페이지입니다.</p>
				<hr class="my-4">
				<p>추후 각각의 페이지, 혹은 웹, 앱으로 분리 될 수 있습니다.</p>
			</div>
			<div class="row justify-content-center">
				<div class="col-8">
					<a href="/Main.say?c=bossLogin"><button type="button"
							class="btn btn-outline-primary btn-block">최고 관리자 로그인</button></a>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-8">
					<a href="/Main.say?c=trainerLogin"><button type="button"
							class="btn btn-outline-secondary btn-block">트레이너 로그인</button></a>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-8">
					<a href="/Main.say?c=generalLogin"><button type="button"
							class="btn btn-outline-danger btn-block">일반회원 로그인</button></a>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-8">
					<a id="kakao-login-btn"
						href="javascript:loginWithKakaoPersonalMember()"><button
							type="button" class="btn btn-secondary btn-block">카카오 회원
							로그인</button></a>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/include/footer_script.jsp" />

	<script>
		function loginWithKakaoPersonalMember() {
			Kakao.Auth.authorize({
				redirectUri : "http://localhost/Main.say?c=kakao",
			});
		}
	</script>
	<script src="assets/Main/Login/js/custom.js"></script>
</body>

</html>