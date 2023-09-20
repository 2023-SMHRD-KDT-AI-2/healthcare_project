<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>



<div class="left_col scroll-view">
	<div class="navbar nav_title" style="border: 0;">
		<a href="/Main.say?c=main" class="site_title"><i class="fa fa-paw"></i>
			<span>HealthCare!</span></a>
	</div>

	<div class="clearfix"></div>

	<!-- menu profile quick info -->
	<div class="profile clearfix">
		<div class="profile_pic">
			<c:choose>
				<c:when test="${empty profileImageUrl}">
					<img src="/images/Member/default.jpg" alt="..."
						class="img-circle profile_img">
				</c:when>
				<c:otherwise>
					<img src="${profileImageUrl}" alt="..."
						class="img-circle profile_img">
				</c:otherwise>
			</c:choose>
		</div>
		<div class="profile_info">
			<span>어서오세요,</span>
			<h2>${nickname}님</h2>
		</div>
		<div class="clearfix"></div>
	</div>
	<!-- /menu profile quick info -->

	<br />

	<!-- sidebar menu -->
	<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
		<div class="menu_section">
			<h3>General</h3>
			<ul class="nav side-menu">
				<li><a href="/Main.say?c=main"><i class="fa fa-home"></i>
						Home <span class="fa fa-chevron-down"></span></a></li>
				<li><a href="/Main.say?c=allTrainerList"><i class="fa fa-home"></i>
						전체 트레이너 정보 <span class="fa fa-chevron-down"></span></a></li>
				<li><a href="/Members.say"><i class="fa fa-edit"></i> 회원 정보 <span
						class="fa fa-chevron-down"></span></a></li>
				<li><a href="/Diet.say?c=sub2&no=${no}&name=${name}&age=${age}&gender=${gender}&weight=${weight}&height=${height}&trainer=${trainer}"><i class="fa fa-desktop"></i> 영양 정보 [${name}] <span
						class="fa fa-chevron-down"></span></a></li>
				<li><a href="/Exercise.say?c=sub2&no=${no}&name=${name}&age=${age}&gender=${gender}&weight=${weight}&height=${height}&trainer=${trainer}"><i class="fa fa-table"></i> 운동 정보 [${name}] <span
						class="fa fa-chevron-down"></span></a>
				</li>
				<c:if test="${loginType eq 'master'}">
				<li><a href="/Main.say?c=newTrainer"><i class="fa fa-table"></i> 새로운 트레이너 등록 <span
						class="fa fa-chevron-down"></span></a>
				</li>
				</c:if>
			</ul>
		</div>
	</div>
	<!-- /sidebar menu -->

	<!-- /menu footer buttons -->
	<div class="sidebar-footer hidden-small">
		<a data-toggle="tooltip" data-placement="top" title="Settings"> <span
			class="glyphicon glyphicon-cog" aria-hidden="true"></span>
		</a> <a data-toggle="tooltip" data-placement="top" title="FullScreen">
			<span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
		</a> <a data-toggle="tooltip" data-placement="top" title="Lock"> <span
			class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
		</a> <a data-toggle="tooltip" data-placement="top" title="Logout"
			href="login.html"> <span class="glyphicon glyphicon-off"
			aria-hidden="true"></span>
		</a>
	</div>
	<!-- /menu footer buttons -->
</div>