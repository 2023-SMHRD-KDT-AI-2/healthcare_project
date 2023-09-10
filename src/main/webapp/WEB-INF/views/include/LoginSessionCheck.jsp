<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:if test="${grade == null}">
	<jsp:forward page="/Main.say?c=login" />
</c:if>
<c:if test="${loginType == null}">
	<jsp:forward page="/Main.say?c=login" />
</c:if>
