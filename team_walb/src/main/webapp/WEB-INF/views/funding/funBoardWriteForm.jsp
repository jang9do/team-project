<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<jsp:include page="../main/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워라밸</title>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
<link href="conPath/css/board.css" rel="stylesheet">
</head>
<body>
<c:if test="${not empty funBoardDelete }">
	<script>alert('${funBoardWriteMsg}');</script>
</c:if>
	<div id="wrap">
		<div id="content">
			<form action="${conPath }/funBoardWrite.do" method="post">
				<input type="hidden" value="1" name="cNum">
				<p>글제목: <input type="text" name="funTitle" required="required"></p>
				<p>글내용:</p>
				<p><textarea rows="20" cols="50" name="funCon" required="required"></textarea></p>
				<p>마감날짜: <input type="date" name="funEnding" required="required"></p>
				<p>목표금액: <input type="text" name="funGoal" required="required"></p>
				<p><input type="submit" value="글작성">&nbsp;<input type="button" onclick="history.back()" value="뒤로가기"></p>
			</form>
		</div>
	</div>
</body>
</html>
<jsp:include page="../main/footer.jsp" />