<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="x_panel">
   <div class="x_content">
      <button id="exerciseAdd" type="button" class="btn btn-primary">운동
         추가</button>
      <div id="exercise_panel">
         <!-- exercise start -->
         <div class="col-md-3 col-sm-12  form-group">
            <label class="control-label col-md-3 col-sm-3 ">운동 종류</label>
            <div class="col-md-9 col-sm-9 ">
               <input type="text" placeholder=".col-md-3" class="form-control"
                  name="excercise_name">
            </div>
         </div>
         <div class="col-md-3 col-sm-12  form-group">
            <label class="control-label col-md-3 col-sm-3 ">MET</label>
            <div class="col-md-9 col-sm-9 ">
               <input type="text" placeholder=".col-md-3" class="form-control"
                  name="excercise_met" readonly>
            </div>
         </div>
         <div class="col-md-3 col-sm-12  form-group">
            <label class="control-label col-md-3 col-sm-3 ">운동 시간</label>
            <div class="col-md-9 col-sm-9 ">
               <input type="text" placeholder=".col-md-3" class="form-control"
                  name="excercise_time">
            </div>
         </div>
         <div class="col-md-3 col-sm-12  form-group">
            <label class="control-label col-md-3 col-sm-3 ">운동 소모 칼로리</label>
            <div class="col-md-9 col-sm-9 ">
               <input type="text" placeholder=".col-md-3" class="form-control"
                  name="excercise_calorie" readonly>
            </div>
         </div>
         <!-- /exercise end -->

      </div>
   </div>
</div>
<script src="assets/Exercise/js/custom_input_yongs_exercise.js"></script>
