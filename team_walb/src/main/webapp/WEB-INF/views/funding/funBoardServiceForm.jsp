<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<jsp:include page="../main/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워라밸</title>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
<link rel="stylesheet" type="text/css" href="css/tabstyle.css" />
<link href="${conPath }/css/content.css" rel="stylesheet">
</head>
<body>
<c:if test="${not empty fundingMsg }">
	<script>alert('${fundingMsg}');</script>
</c:if>
	<div id="wrap">
		<div id="content">
			<form action="${conPath }/funBoardService.do" method="post">
				<input type="hidden" name="funNum" value="${param.funNum}">
				<p>후원하실 금액 : <input type="number" name="funGold"></p>
				<p>후원금액을 입력하시고 꼭 아래 계좌로 무통장입금 부탁드립니다!</p>
				<p>후원계좌 : 농협 15385-54-156248 예금주 : (주)워라벨</p>
				<p>후원해주심에 진심으로 감사드립니다.</p>
				<input type="submit" value="후원하기">
			</form>
		</div>
	</div>	
</body>
</html>