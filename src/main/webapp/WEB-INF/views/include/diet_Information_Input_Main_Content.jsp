<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="x_panel">
	<div class="x_content">
		<!-- breakfast -->
		<button id="bfAdd" type="button" class="btn btn-primary">아침 추가</button>
		<button id="lunchAdd" type="button" class="btn btn-primary">점심 추가</button>
		<button id="dinnerAdd" type="button" class="btn btn-primary">저녁 추가</button>
		<button id="otherAdd" type="button" class="btn btn-primary">그외 추가</button>
		<div id="breakfast_panel" class="x_panel">
			<div class="x_content">
				<div class="col-md-4 col-sm-12  form-group">
					<label class="control-label col-md-3 col-sm-3 ">아침 먹은 것</label>
					<div class="col-md-9 col-sm-9 ">
						<input type="text" placeholder=".col-md-3" class="form-control"
							name="breakfast_foodname_1">
					</div>
				</div>
				<div class="col-md-4 col-sm-12  form-group">
					<label class="control-label col-md-3 col-sm-3 ">아침 먹은 양</label>
					<div class="col-md-9 col-sm-9 ">
						<input type="text" placeholder=".col-md-3" class="form-control"
							name="breakfast_gram_1">
					</div>
				</div>
				<div class="col-md-4 col-sm-12  form-group">
					<label class="control-label col-md-3 col-sm-3 ">아침 먹은 칼로리</label>
					<div class="col-md-9 col-sm-9 ">
						<input type="text" placeholder=".col-md-3" class="form-control"
							name="breakfast_calorie_1">
					</div>
				</div>
			</div>
		</div>
		<!-- /breakfast end -->
		<!--lunch -->
		<div id="lunch_panel" class="x_panel">
			<div class="x_content">
				<div class="col-md-4 col-sm-12  form-group">
					<label class="control-label col-md-3 col-sm-3 ">점심 먹은 것</label>
					<div class="col-md-9 col-sm-9 ">
						<input type="text" placeholder=".col-md-3" class="form-control"
							name="lunch_foodname_1">
					</div>
				</div>
				<div class="col-md-4 col-sm-12  form-group">
					<label class="control-label col-md-3 col-sm-3 ">점심 먹은 양</label>
					<div class="col-md-9 col-sm-9 ">
						<input type="text" placeholder=".col-md-3" class="form-control"
							name="lunch_gram_1">
					</div>
				</div>
				<div class="col-md-4 col-sm-12  form-group">
					<label class="control-label col-md-3 col-sm-3 ">점심 먹은 칼로리</label>
					<div class="col-md-9 col-sm-9 ">
						<input type="text" placeholder=".col-md-3" class="form-control"
							name="lunch_calorie_1">
					</div>
				</div>
			</div>
		</div>
		<!-- /lunch end -->
		<!-- dinner -->
		<div id="dinner_panel" class="x_panel">
			<div class="x_content">
				<div class="col-md-4 col-sm-12  form-group">
					<label class="control-label col-md-3 col-sm-3 ">저녁 먹은 것</label>
					<div class="col-md-9 col-sm-9 ">
						<input type="text" placeholder=".col-md-3" class="form-control"
							name="dinner_foodname_1">
					</div>
				</div>
				<div class="col-md-4 col-sm-12  form-group">
					<label class="control-label col-md-3 col-sm-3 ">저녁 먹은 양</label>
					<div class="col-md-9 col-sm-9 ">
						<input type="text" placeholder=".col-md-3" class="form-control"
							name="dinner_gram_1">
					</div>
				</div>
				<div class="col-md-4 col-sm-12  form-group">
					<label class="control-label col-md-3 col-sm-3 ">저녁 먹은 칼로리</label>
					<div class="col-md-9 col-sm-9 ">
						<input type="text" placeholder=".col-md-3" class="form-control"
							name="dinner_calorie_1">
					</div>
				</div>
			</div>
		</div>
		<!-- /dinner end -->
		<!-- otherfood -->
		<div id="other_panel" class="x_panel">
			<div class="x_content">
				<div class="col-md-4 col-sm-12  form-group">
					<label class="control-label col-md-3 col-sm-3 ">간식이나 그외 등등
						먹은 것</label>
					<div class="col-md-9 col-sm-9 ">
						<input type="text" placeholder=".col-md-3" class="form-control"
							name="other_foodname_1">
					</div>
				</div>
				<div class="col-md-4 col-sm-12  form-group">
					<label class="control-label col-md-3 col-sm-3 ">간식이나 그외 등등
						먹은 양</label>
					<div class="col-md-9 col-sm-9 ">
						<input type="text" placeholder=".col-md-3" class="form-control"
							name="other_gram_1">
					</div>
				</div>
				<div class="col-md-4 col-sm-12  form-group">
					<label class="control-label col-md-3 col-sm-3 ">간식이나 그외 등등
						먹은 칼로리</label>
					<div class="col-md-9 col-sm-9 ">
						<input type="text" placeholder=".col-md-3" class="form-control"
							name="other_calorie_1">
					</div>
				</div>
			</div>
		</div>
		<!-- /otherfood end -->
		<!-- /food end -->

	</div>
</div>

<script src="assets/Diet/js/custom_input_food.js"></script>
