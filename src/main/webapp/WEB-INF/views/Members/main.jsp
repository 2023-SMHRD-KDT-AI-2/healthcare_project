<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.sayproject.model.Members.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
/*
int memberListSize = -1;

Object obj = request.getAttribute("memberList");

ArrayList<Member> memberList = null;
if (obj != null) {
	memberList = new ArrayList<Member>();
	if (obj instanceof ArrayList<?>) {
		ArrayList<?> al = (ArrayList<?>) obj;
		if (al.size() > 0) {
			for (int i = 0; i < al.size(); i++) {
				Object o = al.get(i);
				if (o instanceof Member) {
					memberList.add((Member) o);
				}
			}
			if (memberList != null) {
				memberListSize = memberList.size();
			}
		}
	}
}
*/
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

<!-- Bootstrap -->
<link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css" />
<link href="assets/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<!-- Font Awesome -->
<link href="assets/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" />
<!-- NProgress -->
<link href="assets/vendors/nprogress/nprogress.css" rel="stylesheet" />
<!-- iCheck -->
<link href="assets/vendors/iCheck/skins/flat/green.css" rel="stylesheet" />
<!-- Animate.css -->
<link href="assets/vendors/animate.css/animate.min.css" rel="stylesheet" />
<!-- Datatables -->

<link
	href="assets/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
	rel="stylesheet" />
<link
	href="assets/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
	rel="stylesheet" />
<link
	href="assets/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
	rel="stylesheet" />
<link
	href="assets/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
	rel="stylesheet" />
<link
	href="assets/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
	rel="stylesheet" />
<!-- Custom Theme Style -->
<link href="assets/build/css/custom.min.css" rel="stylesheet" />
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- left side menu -->
			<div class="col-md-3 left_col">
				<jsp:include page="/WEB-INF/views/Members/include/side_left.html" />
			</div>
			<!-- /left side menu -->
			<!-- top navigation -->
			<div class="top_nav">
				<jsp:include page="/WEB-INF/views/Members/include/top_nav.html" />
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
							<!-- main content -->
							<%
							/* 기본적으로 메인 컨텐츠는 이 곳에 입력합니다. */
							%>

							<div class="x_panel">
								<div class="x_title">
									<h2>
										Table design <small>회원 명수 : ${memberList.size()} 명</small>
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
									<div class="table-responsive">
										<table class="table table-striped jambo_table bulk_action">
											<thead>
												<tr class="headings">
													<th><input type="checkbox" id="check-all" class="flat">
													</th>
													<th class="column-title">사진</th>
													<th class="column-title">카카오</th>
													<th class="column-title">이름</th>
													<th class="column-title">나이</th>
													<th class="column-title">성별</th>
													<th class="column-title">몸무게</th>
													<th class="column-title">키</th>
													<th class="column-title">등록일</th>
													<th class="column-title no-link last"><span
														class="nobr">이동</span></th>
													<th class="bulk-actions" colspan="9"><a class="antoo"
														style="color: #fff; font-weight: 500;">Bulk Actions (
															<span class="action-cnt"> </span> ) <i
															class="fa fa-chevron-down"></i>
													</a></th>
												</tr>
											</thead>

											<tbody>
												<c:forEach var="member" items="${memberList}">
													<tr class="even pointer">
														<td class="a-center "><input type="checkbox"
															class="flat" name="table_records"></td>
														<td class=" "><img src="${member.getPhotopath()}" width="100px"
															height="100px"></td>
														<td class=" ">${member.getKakao_id()}</td>
														<td class=" ">${member.getName()}</td>
														<td class=" ">${member.getAge()}</td>
														<td class=" ">${member.getGender()}</td>
														<td class="a-right a-right">${member.getWeight()}</td>
														<td class="a-right a-right">${member.getHeight()}</td>
														<td class=" ">${member.getRegist_day()}</td>
														<td class="last"><a href="#">이동</a></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
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
	<script
		src="assets/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="assets/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="assets/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script
		src="assets/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script
		src="assets/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script
		src="assets/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="assets/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="assets/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script
		src="assets/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="assets/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script
		src="assets/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
	<script src="assets/vendors/jszip/dist/jszip.min.js"></script>
	<script src="assets/vendors/pdfmake/build/pdfmake.min.js"></script>
	<script src="assets/vendors/pdfmake/build/vfs_fonts.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="assets/build/js/custom.min.js"></script>
</body>
</html>
