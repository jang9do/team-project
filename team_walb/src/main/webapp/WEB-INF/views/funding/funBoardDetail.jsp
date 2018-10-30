<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<c:if test="${not empty funBoardDelete }">
	<script>alert('${funBoardDelete}');</script>
</c:if>
<c:if test="${not empty funBoardModifyMsg }">
	<script>alert('${funBoardModifyMsg}');</script>
</c:if>
	<div id="wrap">
		<div id="content">
			<p><img src="${conPath }/circleImg/${funBDetail.cPhoto}" alt="펀딩대표이미지"></p>
			<p>${funBDetail.funTitle }</p>
			<p>${funBDetail.funCon }</p>
			<p>추진동아리 : ${funBDetail.cName}(${funBDetail.mId })</p>
			<p>시작날짜 : <fmt:formatDate value="${funBDetail.funStart }" pattern="YYYY-MM-dd"/></p>
			<p>마감날짜 : <fmt:formatDate value="${funBDetail.funEnd }" pattern="YYYY-MM-dd"/></p>
			<p>진행중</p>
			<button onclick="location='${conPath}/funBoardList.do'">목록</button>
			<button onclick="location='${conPath}/funBoardServiceForm.do?funNum=${funBDetail.funNum}'">후원하기</button>
			<c:if test="${funBDetail.mId == member.mId }">
				<button onclick="location='${conPath}/funBoardModifyForm.do?funNum=${funBDetail.funNum }'">수정</button>
				<button onclick="location='${conPath}/funBoardDelete.do?funNum=${funBDetail.funNum }'">삭제</button>
			</c:if>
		</div>
	</div>
</body>
</html>
<jsp:include page="../main/footer.jsp" />