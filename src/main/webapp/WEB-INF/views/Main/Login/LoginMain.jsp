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
<!-- Custom Theme Style -->
<link href="assets/Main/css/custom.css" rel="stylesheet" />
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- page content -->
			<div class="row justify-content-md-center " role="main">
				<!-- content -->
				<div class="col-md-4 col-sm-12">
					<!-- boss login -->
					<!-- boss login form -->
					<!-- /boss login form end -->
					<!-- /boss login end -->
					<!-- trainer login -->
					<!-- /boss login form end -->
					<!-- /trainer login end -->
					<!-- personal member login -->
					<div class="x_panel">
						<div class="card">
							<div class="card-body">
								<h5 class="card-title">일반회원</h5>
								<!-- personal member login form -->
								<form>
									<div class="form-floating mb-3">
										<input type="email" class="form-control" id="floatingInput"
											placeholder="name@example.com"> <label
											for="floatingInput">Email address</label>
									</div>
									<div class="form-floating">
										<input type="password" class="form-control"
											id="floatingPassword" placeholder="Password"> <label
											for="floatingPassword">Password</label>
									</div>
									<div>
									<a href="#" class="btn btn-primary btn-xs" style="height: 55px;"><i class="fa fa-smile-o"></i>회원가입</a>
									<a id="kakao-login-btn" href="javascript:loginWithKakao()">
										<img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="222"
										  alt="카카오 로그인 버튼" />
									  </a>
									</div>
								</form>
								<!-- /personal member login form end -->
							</div>
						</div>
					</div>
					<!-- /personal member login end -->
				</div>
				<!-- /content -->
			</div>
			<!-- /page content -->
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/include/footer_script.jsp" />

	<!-- 여기에 카카오 로그인  -->
    <!--jquery cdn-->
	<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
	
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

	<div id="result"></div>
	<script>
	Kakao.init('b4e6ac8dba99c113a639e05a1b88906c'); // 사용하려는 앱의 JavaScript 키 입력
	console.log(Kakao.isInitialized());
	</script>


	
	<script>
		// 3. 데모버전으로 들어가서 카카오로그인 코드를 확인.
function loginWithKakao() {
Kakao.Auth.login({
   success: function (authObj) {
	   console.log(authObj); // access토큰 값
	   Kakao.Auth.setAccessToken(authObj.access_token); // access토큰값 저장

	   getInfo();
	   

   },
   fail: function (err) {
	   console.log(err);
   }
});
}



// 4. 엑세스 토큰을 발급받고, 아래 함수를 호출시켜서 사용자 정보를 받아옴.
function getInfo() {
Kakao.API.request({
   url: '/v2/user/me',
   success: function (res) {
	   console.log(res);
	   // 이메일, 성별, 닉네임, 프로필이미지
	
	   let id = res.id;
	   let nick = JSON.stringify(res.properties.nickname);
	   let email = JSON.stringify(res.kakao_account.email);
	   let gender = JSON.stringify(res.kakao_account.gender);
	   let age_range = JSON.stringify(res.kakao_account.age_range);
	   let name = JSON.stringify(res.kakao_account.name);              
	   let profile_image = JSON.stringify(res.properties.profile_image);
	   let phone = JSON.stringify(res.kakao_account.phone_number);
	   let connect = JSON.stringify(res.connected_at)
	   let birthday = JSON.stringify(res.kakao_account.birthday);

	  
	 
	   sessionStorage.setItem("id", id);
	   sessionStorage.setItem("nick", nick);
	   sessionStorage.setItem("email", email);
	   sessionStorage.setItem("gender", gender);
	   sessionStorage.setItem("name", name);
	   sessionStorage.setItem("phone", phone);
	   sessionStorage.setItem("connect", connect);
	   
	   console.log(email, gender,name, phone);
	  
	  $.ajax({
		  // json을 보내줄 페이지 url
		 url:"http://localhost/Main.say?c=kakaoLogin",
		 data:{"id":id, "nick":nick, "email":email, "gender":gender, "age_range":age_range,
		  "name":name, "profile_image":profile_image, "phone":phone, "connect":connect, "birthday": birthday},
		 type : "post",
		  
	  })               
	 window.location.href="http://localhost/Main.say?c=memberAddInfo"
	 
   },
   fail: function (error) {
	   alert('카카오 로그인에 실패했습니다. 관리자에게 문의하세요.' + JSON.stringify(error));
   }
});
}

  
// 5. 로그아웃 기능 - 카카오 서버에 접속하는 엑세스 토큰을 만료, 사용자 어플리케이션의 로그아웃은 따로 진행.
function kakaoLogout() {
if (!Kakao.Auth.getAccessToken()) {
   alert('Not logged in.');
   return;
}
Kakao.Auth.logout(function() {
   alert('logout ok\naccess token -> ' + Kakao.Auth.getAccessToken());
});
}
	 </script>

	<!-- Custom Theme Scripts -->
	<script src="assets/Main/js/custom.js"></script>
</body>
</html>
