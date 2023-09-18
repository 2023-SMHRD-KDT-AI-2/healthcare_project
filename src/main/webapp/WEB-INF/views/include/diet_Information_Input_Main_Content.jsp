<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- 하루의 식단 정보 -->
<div class="x_panel">
	<div class="x_content">
		<!-- breakfast -->
		<button id="bfAdd" type="button" class="btn btn-primary">아침 추가</button>
		<button id="lunchAdd" type="button" class="btn btn-primary">점심 추가</button>
		<button id="dinnerAdd" type="button" class="btn btn-primary">저녁 추가</button>
		<button id="otherAdd" type="button" class="btn btn-primary">그외 추가</button>
		<div id="breakfast_panel" class="x_panel">
		</div>
		<!-- /breakfast end -->
		<!--lunch -->
		<div id="lunch_panel" class="x_panel">
		</div>
		<!-- /lunch end -->
		<!-- dinner -->
		<div id="dinner_panel" class="x_panel">
		</div>
		<!-- /dinner end -->
		<!-- otherfood -->
		<div id="other_panel" class="x_panel">
		</div>
		<!-- /otherfood end -->
		<!-- /food end -->
	</div>
</div>
<!-- /하루의 식단 정보 END -->
