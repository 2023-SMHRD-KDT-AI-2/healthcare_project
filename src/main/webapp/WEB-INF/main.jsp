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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>HealthCare | SAYPROJECT</title>

<!-- Bootstrap -->
<link href="cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css">
<link href="assets/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="assets/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="assets/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="assets/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<!-- Datatables -->

<link
	href="assets/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css"
	rel="stylesheet">
<link
	href="assets/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css"
	rel="stylesheet">
<link
	href="assets/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css"
	rel="stylesheet">
<link
	href="assets/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css"
	rel="stylesheet">
<link
	href="assets/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css"
	rel="stylesheet">
<!-- Custom Theme Style -->
<link href="assets/build/css/custom.min.css" rel="stylesheet">

</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<!-- left side menu -->
			<div class="col-md-3 left_col">
				<jsp:include page="/WEB-INF/views/include/side_left.html" />
			</div>
			<!-- /left side menu -->
			<!-- top navigation -->
			<div class="top_nav">
				<jsp:include page="/WEB-INF/views/include/top_nav.html" />
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Plain Page</h3>
						</div>

						<div class="title_right">
							<div class="col-md-5 col-sm-5   form-group pull-right top_search">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search for..."> <span
										class="input-group-btn">
										<button class="btn btn-default" type="button">Go!</button>
									</span>
								</div>
							</div>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">

						<div class="col-md-12 col-sm-12  ">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										Table design <small>Custom design</small>
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

									<p>
										Add class
										<code>bulk_action</code>
										to table for bulk actions options on row select
									</p>

									<div class="table-responsive">
										<table class="table table-striped jambo_table bulk_action">
											<thead>
												<tr class="headings">
													<th><input type="checkbox" id="check-all" class="flat">
													</th>
													<th class="column-title">Invoice</th>
													<th class="column-title">Invoice Date</th>
													<th class="column-title">Order</th>
													<th class="column-title">Bill to Name</th>
													<th class="column-title">Status</th>
													<th class="column-title">Amount</th>
													<th class="column-title no-link last"><span
														class="nobr">Action</span></th>
													<th class="bulk-actions" colspan="7"><a class="antoo"
														style="color: #fff; font-weight: 500;">Bulk Actions (
															<span class="action-cnt"> </span> ) <i
															class="fa fa-chevron-down"></i>
													</a></th>
												</tr>
											</thead>

											<tbody>
												<tr class="pointer">
													<td class="a-center "><input type="checkbox"
														class="flat" name="table_records"></td>
													<td class="">121000040</td>
													<td class="">May 23, 2014 11:47:56 PM</td>
													<td class="">121000210 <i
														class="success fa fa-long-arrow-up"></i></td>
													<td class="">John Blank L</td>
													<td class="">Paid</td>
													<td class="a-right a-right ">$7.45</td>
													<td class="last"><a href="#">View</a></td>
												</tr>
												<tr class="pointer">
													<td class="a-center "><input type="checkbox"
														class="flat" name="table_records"></td>
													<td class=" ">121000039</td>
													<td class=" ">May 23, 2014 11:30:12 PM</td>
													<td class=" ">121000208 <i
														class="success fa fa-long-arrow-up"></i>
													</td>
													<td class=" ">John Blank L</td>
													<td class=" ">Paid</td>
													<td class="a-right a-right ">$741.20</td>
													<td class=" last"><a href="#">View</a></td>
												</tr>
											</tbody>
										</table>
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
	<script
		src="assets/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="assets/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="assets/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script src="assets/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script src="assets/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script src="assets/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
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

	<script>
		$(document).ready(function() {
			var table = $('.dataTable').DataTable({
				language : {
					search : '검색 : ',
					url : '/resource/i18n/datatables/ko.json'
				},
				ajax : {
					url : "loadMembers.say",
					type : "GET",
					dataType : "json",
					dataSrc : 'data'
				},
				columns : [ {
					data : "no"
				}, {
					data : "name"
				}, {
					data : "age"
				}, {
					data : "gender"
				}, {
					data : "weight"
				}, {
					data : "height"
				}, {
					data : "job"
				}, {
					data : "phone_number"
				}, {
					data : "email"
				}, {
					data : "trainer"
				}, {
					data : "regist_day"
				} ],
				ordering : true, // ordering 활성화
				order : [ [ 0, "asc" ] ], //0번째 컬럼 오름차순
				paging : true, //페이징 기능 활성화. 기본이 true

				/*numbers - Page number buttons only
				simple - 'Previous' and 'Next' buttons only
				simple_numbers - 'Previous' and 'Next' buttons, plus page numbers
				full - 'First', 'Previous', 'Next' and 'Last' buttons
				full_numbers - 'First', 'Previous', 'Next' and 'Last' buttons, plus page numbers
				first_last_numbers - 'First' and 'Last' buttons, plus page numbers*/
				pagingType : "simple_numbers", // 페이징 버튼 타입 설정
				pageLength : 10, // 한페이지에 보여주는 데이터 개수 
				responsive : true, // 스크립트를 추가하면 반응형으로 작동하게해줌
				lengthChange : false, // pageLength 조절 불가하게 해줌
				info : true, // 페이지 상태표시
				autoWidth : true, //페이지 좌우 크기 조절시 테이블 크기 자동 적용
				select : true,
				serverSide : false,
				processing : true, // 서버와 통신 시 응답을 받기 전이라는 ui를 띄울 것인지 여부
				dom : 'Blfrtip',
				colReorder : true,
				scrollX : true,
			});

		});
	</script>
</body>
</html>
