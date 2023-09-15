<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 회원 E-Mail -->
<div class="form-group row">
	<label class="control-label col-md-3 col-sm-3 ">회원 EMAIL</label>
	<div class="col-md-9 col-sm-9 ">
		<c:choose>
			<c:when test="${idOrEmail != null}">
				<input type="text" class="form-control" readonly="readonly"
					placeholder="Read-Only Input" name="id" value=${email}>
			</c:when>
			<c:otherwise>
				<input type="text" class="form-control" readonly="readonly"
					placeholder="Read-Only Input" name="id" value="defaultEmail">
			</c:otherwise>
		</c:choose>
	</div>
</div>
<!-- /회원 E-Mail END -->
<!-- 회원 이름 -->
<div class="form-group row">
	<label class="control-label col-md-3 col-sm-3 ">회원 이름</label>
	<div class="col-md-9 col-sm-9 ">
		<c:choose>
			<c:when test="${nickname != null}">
				<input type="text" class="form-control" readonly="readonly"
					placeholder="Read-Only Input" name="name" value=${name}>
			</c:when>
			<c:otherwise>
				<input type="text" class="form-control" readonly="readonly"
					placeholder="Read-Only Input" name="name" value="DefaultName">
			</c:otherwise>
		</c:choose>
	</div>
</div>
<!-- /회원 이름 END -->
<!-- 담당 트레이너 -->
<div class="form-group row">
	<label class="control-label col-md-3 col-sm-3 ">담당 트레이너</label>
	<div class="col-md-9 col-sm-9 ">
		<c:choose>
			<c:when test="${trainer != null}">
				<input type="text" class="form-control" readonly="readonly"
					placeholder="Read-Only Input" name="trainer" value=${trainer}>
			</c:when>
			<c:otherwise>
				<input type="text" class="form-control" readonly="readonly"
					placeholder="Read-Only Input" name="trainer" value="트레이너 미지정">
			</c:otherwise>
		</c:choose>
	</div>
</div>
<!-- /담당 트레이너 END -->
<!-- 회원 현재 몸무게 -->
<div class="form-group row ">
	<label class="control-label col-md-3 col-sm-3 ">몸무게</label>
	<div class="col-md-9 col-sm-9 ">
		<c:choose>
			<c:when test="${weight != null}">
				<input type="text" class="form-control"
					placeholder="몸무게를 입력해주세요. 숫자만 입력 가능 : kg" name="weight"
					value=${weight}>
			</c:when>
			<c:otherwise>
				<input type="text" class="form-control"
					placeholder="몸무게를 입력해주세요. 숫자만 입력 가능 : kg" name="weight" value="0">
			</c:otherwise>
		</c:choose>
	</div>
</div>
<!-- /현재 회원 몸무게 END -->
<!-- 현재 회원 키 -->
<div class="form-group row ">
	<label class="control-label col-md-3 col-sm-3 ">키</label>
	<div class="col-md-9 col-sm-9 ">
		<c:choose>
			<c:when test="${height != null}">
				<input type="text" class="form-control"
					placeholder="몸무게를 입력해주세요. 숫자만 입력 가능 : kg" name="height"
					value=${height}>
			</c:when>
			<c:otherwise>
				<input type="text" class="form-control"
					placeholder="몸무게를 입력해주세요. 숫자만 입력 가능 : kg" name="height" value="0">
			</c:otherwise>
		</c:choose>
	</div>
</div>

<!-- /현재 회원 키 END -->
<!-- 수정할 날짜 정보 -->
<!-- 시작시 기본 날짜 설정은 value를 이용 -->
<div class="form-group row ">
	<label class="control-label col-md-3 col-sm-3 ">입력할 날짜</label>
	<div class="col-md-9 col-sm-9 ">
	<input type="text" id="datePicker" class="form-control" value="2019-06-27" />
	</div>
</div>
<!-- /수정할 날짜 정보 END -->