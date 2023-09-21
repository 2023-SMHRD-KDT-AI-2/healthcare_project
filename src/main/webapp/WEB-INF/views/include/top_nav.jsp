<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="nav_menu">
	<div class="nav toggle">
		<a id="menu_toggle"><i class="fa fa-bars"></i></a>
	</div>
	<nav class="nav navbar-nav">
		<ul class=" navbar-right">
			<li class="nav-item dropdown open" style="padding-left: 15px;">
				<a href="javascript:;" class="user-profile dropdown-toggle"
				aria-haspopup="true" id="navbarDropdown" data-toggle="dropdown"
				aria-expanded="false"> <c:choose>
						<c:when test="${empty profileImageUrl}">
							<img src="/images/Member/default.jpg" alt="...">${nickname}
				</c:when>
						<c:otherwise>
							<img src="${profileImageUrl}" alt="...">${nickname}
				</c:otherwise>
					</c:choose>
			</a>
				<div class="dropdown-menu dropdown-usermenu pull-right"
					aria-labelledby="navbarDropdown">
					<a class="dropdown-item" href="/Main.say?c=login"> Profile</a> <a
						class="dropdown-item" href="javascript:;"> <span
						class="badge bg-red pull-right">50%</span> <span>Settings</span>
					</a> <a class="dropdown-item" href="javascript:;">Help</a> <a
						class="dropdown-item" href="/Main.say?c=logout"><i
						class="fa fa-sign-out pull-right"></i> Log Out</a>
				</div>
			</li>

			<li role="presentation" class="nav-item dropdown open"><a
				href="javascript:;" class="dropdown-toggle info-number"
				id="navbarDropdown1" data-toggle="dropdown" aria-expanded="false">
					<i class="fa fa-envelope-o"></i> <span class="badge bg-green">6</span>
			</a>
				<ul class="dropdown-menu list-unstyled msg_list" role="menu"
					aria-labelledby="navbarDropdown1">
					<li class="nav-item"><a class="dropdown-item"> <span
							class="image"><img src="images/img.jpg"
								alt="Profile Image" /></span> <span> <span>손지영</span> <span
								class="time">3 mins ago</span>
						</span> <span class="message"> 빨리 연락 부탁드립니다. 출근을 하셔야지. 이렇게 무단 결근을 하시면 어떻게 합니까? </span>
					</a></li>					
				</ul></li>
		</ul>
	</nav>
</div>