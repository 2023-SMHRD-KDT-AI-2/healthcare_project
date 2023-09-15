<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <style>
      .gradient-custom-2 {
        /* fallback for old browsers */
        background: #fccb90;

        /* Chrome 10-25, Safari 5.1-6 */
        background: -webkit-linear-gradient(
          to right,
          #ee7724,
          #d8363a,
          #dd3675,
          #b44593
        );

        /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        background: linear-gradient(
          to right,
          #ee7724,
          #d8363a,
          #dd3675,
          #b44593
        );
      }

      @media (min-width: 768px) {
        .gradient-form {
          height: 100vh !important;
        }
      }
      @media (min-width: 769px) {
        .gradient-custom-2 {
          border-top-right-radius: 0.3rem;
          border-bottom-right-radius: 0.3rem;
        }
      }
    </style>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <!-- page content -->
        <div class="row justify-content-md-center" role="main">
          <!-- content -->
          <div class="col-md-8 col-sm-12">
            <!-- trainer login -->

            <section class="h-100 gradient-form" style="background-color: #eee">
              <div class="container py-5 h-100">
                <div
                  class="row d-flex justify-content-center align-items-center h-100"
                >
                  <div class="col-xl-10">
                    <div class="card rounded-3 text-black">
                      <div class="row g-0">
                        <div class="col-lg-6">
                          <div class="card-body p-md-5 mx-md-4">
                            <div class="text-center">
                              <img
                                src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/lotus.webp"
                                style="width: 185px"
                                alt="logo"
                              />
                              <h4 class="mt-1 mb-5 pb-1">We are The S.A.Y.</h4>
                            </div>

                            <form
                              action="/Main.say?c=trainerLoginCheck"
                              method="POST"
                            >
                              <p>Please login to your TRAINER ACCOUNT</p>

                              <div class="form-outline mb-4">
                                <input
                                  name="email"
                                  type="email"
                                  id="form2Example11"
                                  class="form-control"
                                  placeholder="Phone number or email address"
                                />
                                <label class="form-label" for="form2Example11"
                                  >Username</label
                                >
                              </div>

                              <div class="form-outline mb-4">
                                <input
                                  name="password"
                                  type="password"
                                  id="form2Example22"
                                  class="form-control"
                                />
                                <label class="form-label" for="form2Example22"
                                  >Password</label
                                >
                              </div>

                              <div class="text-center pt-1 mb-5 pb-1">
                                <button
                                  class="btn btn-primary btn-lg btn-block"
                                  type="submit"
                                >
                                  Log in
                                </button>
                                <a class="text-muted" href="#!"
                                  >Forgot password?</a
                                >
                              </div>

                              <div
                                class="d-flex align-items-center justify-content-center pb-4"
                              >
                                <p class="mb-0 me-2">Don't have an account?</p>
                                <button
                                  type="button"
                                  class="btn btn-outline-danger"
                                >
                                  Create new
                                </button>
                              </div>
                            </form>
                          </div>
                        </div>
                        <div
                          class="col-lg-6 d-flex align-items-center gradient-custom-2"
                        >
                          <div class="text-white px-3 py-4 p-md-5 mx-md-4">
                            <h4 class="mb-4">담배 가게 아가씨 - 송창식</h4>
                            <p class="small mb-0">
                              우리동네 담배가게에는 아가씨가 예쁘다네 짧은 머리
                              곱게 빗은것이 정말 예쁘다네 온동네 청년들이 너도
                              나도 기웃 기웃 기웃 그러나 그 아가씨는 새침떼기
                              앞집의 꼴두기 녀석은 딱지를 맞았다네 만화가게
                              용팔이 그 녀석도 딱지를 맞았다네 그렇다면 동네에선
                              오직 하나 나만 남았는데 아 기대하시라 개봉 박두
                              다음날 아침 일찍부터 담배하나 사러가서 가지고간
                              장미 한송이를 살짝 건네어 주고 그 아가씨가
                              놀랄적에 눈싸움 한판을 벌인다 하라 라 오 그 아가씨
                              웃었어 하루종일 가슴 설레이며 퇴근시간 기다렸지
                              오랫만에 말끔히 차려입고 그 아가씨 기다렸지 점잖게
                              다가서서 미소띠며 인 사를 했지 그러나 그 아가씨는
                              콧방귀 그렇다고 이대로 물러나면 대장부가 아니지 그
                              아가씨 발걸음 소리 맞춰 뒤따라 걸어간다 틀려서는
                              안되지 번호 부쳐 하나 둘 셋 오 위대할손 나의 끈기
                              바로 그때 이것 참 야단났네 골몰길 어귀에서 아랫
                              동네 불량배들에게 그 아가씨 포위됐네 옳다구나 이
                              때다 백마의 기사가 나가신다 아자 자 아 하늘빛이
                              노랗다 우리동네 담배가게에는 아가씨가 예쁘다네
                              지금은 그전보 다도 백배는 예쁘다네 나를 보면은
                              웃어주는 아가씨 나는 정말 사랑해 아라 라 에 나는
                              지금 담배사러 간다
                            </p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </section>
            <!-- /trainer login end -->
          </div>
          <!-- /content -->
        </div>
        <!-- /page content -->
      </div>
    </div>

    <jsp:include page="/WEB-INF/views/include/footer_script.jsp" />

    <script>
      function loginWithKakaoPersonalMember() {
        Kakao.Auth.authorize({
          redirectUri: "http://localhost/Main.say?c=kakao",
        });
      }
    </script>

    <!-- Custom Theme Scripts -->
    <script src="assets/Main/js/custom.js"></script>
  </body>
</html>
