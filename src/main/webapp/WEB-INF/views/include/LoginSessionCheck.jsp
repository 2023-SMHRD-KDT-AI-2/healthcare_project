<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${grade == null}">
<script>
alert("로그인을 하지 않은 상태. 추후 로그인 페이지로 이동합니다.")
</script>
	<!--<jsp:forward page="/Main.say?c=login" />-->
</c:if>
<c:if test="${loginType == null}">
<script>
alert("로그인을 하지 않은 상태. 추후 로그인 페이지로 이동합니다.")
</script>
	<!--<jsp:forward page="/Main.say?c=login" />-->
</c:if>