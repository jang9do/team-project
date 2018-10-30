<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<form action="${conPath }/funBoardModify.do" method="post">
				<input type="hidden" value="${funBDetail.funNum }" name="funNum">
				<p>글제목: <input type="text" name="funTitle" value="${funBDetail.funTitle }"></p>
				<p>글내용:</p>
				<p><textarea rows="20" cols="50" name="funCon">${funBDetail.funCon }</textarea></p>
				<p>마감날짜: <input type="date" name="funEnding" value="<fmt:formatDate value="${funBDetail.funEnd }" pattern="YYYY-MM-dd" />"></p>
				<p>목표금액: <input type="number" name="funGoal" value="${funBDetail.funGoal }"></p>
				<p><input type="submit" value="글수정">&nbsp;<input type="button" onclick="history.back()" value="뒤로가기"></p>
			</form>
		</div>
	</div>
</body>
</html>
<jsp:include page="../main/footer.jsp" />