<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" isELIgnored="false"%> <%@ taglib
uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> <%
request.getAttribute("memberList"); %>
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
    <link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
    <link
      href="assets/vendors/bootstrap/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- Font Awesome -->
    <link
      href="assets/vendors/font-awesome/css/font-awesome.min.css"
      rel="stylesheet"
    />
    <!-- NProgress -->
    <link href="assets/vendors/nprogress/nprogress.css" rel="stylesheet" />
    <!-- iCheck -->
    <link href="assets/vendors/iCheck/skins/flat/green.css" rel="stylesheet" />
    <!-- Animate.css -->
    <link href="assets/vendors/animate.css/animate.min.css" rel="stylesheet" />
    <!-- Datatables -->

    <link
      href="assets/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="assets/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="assets/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="assets/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="assets/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- Custom Theme Style -->
    <link href="assets/build/css/custom.min.css" rel="stylesheet" />
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <!-- left side menu -->
        <div class="col-md-3 left_col">
          <jsp:include page="/WEB-INF/views/Main/include/side_left.html" />
        </div>
        <!-- /left side menu -->
        <!-- top navigation -->
        <div class="top_nav">
          <jsp:include page="/WEB-INF/views/Main/include/top_nav.html" />
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
                    <input
                      type="text"
                      class="form-control"
                      placeholder="Search for..."
                    />
                    <span class="input-group-btn">
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
                      <a class="hiddenanchor" id="signup"></a>
                      <a class="hiddenanchor" id="signin"></a>

                      <div class="login_wrapper">
                        <div class="animate form login_form">
                          <section class="login_content">
                            <form>
                              <h1>Login Form</h1>
                              <div>
                                <input
                                  type="text"
                                  class="form-control"
                                  placeholder="Username"
                                  required
                                />
                              </div>
                              <div>
                                <input
                                  type="password"
                                  class="form-control"
                                  placeholder="Password"
                                  required
                                />
                              </div>
                              <div>
                                <a
                                  class="btn btn-default submit"
                                  href="index.html"
                                  >Log in</a
                                >
                                <a class="reset_pass" href="#"
                                  >Lost your password?</a
                                >
                              </div>

                              <div class="clearfix"></div>

                              <div class="separator">
                                <p class="change_link">
                                  New to site?
                                  <a href="#signup" class="to_register">
                                    Create Account
                                  </a>
                                </p>

                                <div class="clearfix"></div>
                              </div>
                            </form>
                          </section>
                        </div>

                        <div
                          id="register"
                          class="animate form registration_form"
                        >
                          <section class="login_content">
                            <form>
                              <h1>Create Account</h1>
                              <div>
                                <input
                                  type="text"
                                  class="form-control"
                                  placeholder="Username"
                                  required
                                />
                              </div>
                              <div>
                                <input
                                  type="email"
                                  class="form-control"
                                  placeholder="Email"
                                  required
                                />
                              </div>
                              <div>
                                <input
                                  type="password"
                                  class="form-control"
                                  placeholder="Password"
                                  required
                                />
                              </div>
                              <div>
                                <a
                                  class="btn btn-default submit"
                                  href="index.html"
                                  >Submit</a
                                >
                              </div>

                              <div class="clearfix"></div>

                              <div class="separator">
                                <p class="change_link">
                                  Already a member ?
                                  <a href="#signin" class="to_register">
                                    Log in
                                  </a>
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

    <!-- jQuery -->
    <script src="assets/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="assets/vendors/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <!-- FastClick -->
    <script src="assets/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="assets/vendors/nprogress/nprogress.js"></script>
    <!-- iCheck -->
    <script src="assets/vendors/iCheck/icheck.min.js"></script>
    <!-- Datatables -->
    <script src="assets/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
    <script src="assets/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
    <script src="assets/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
    <script src="assets/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
    <script src="assets/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
    <script src="assets/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
    <script src="assets/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
    <script src="assets/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
    <script src="assets/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
    <script src="assets/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
    <script src="assets/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
    <script src="assets/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
    <script src="assets/vendors/jszip/dist/jszip.min.js"></script>
    <script src="assets/vendors/pdfmake/build/pdfmake.min.js"></script>
    <script src="assets/vendors/pdfmake/build/vfs_fonts.js"></script>
    <!-- Custom Theme Scripts -->
    <script src="assets/build/js/custom.min.js"></script>
  </body>
</html>
