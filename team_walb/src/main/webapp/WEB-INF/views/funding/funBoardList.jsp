<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<jsp:include page="../main/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워라밸</title>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
<link rel="stylesheet" type="text/css" href="css/tabstyle.css" />
<link href="${conPath }/css/content.css" rel="stylesheet">
<link href="${conPath }/css/funding.css" rel="stylesheet">
<style>
</style>
</head>
<body>
<c:if test="${not empty fundingMsg }">
	<script>alert('${fundingMsg}');</script>
</c:if>
<c:if test="${not empty funBoardDelete }">
	<script>alert('${funBoardDelete}');</script>
</c:if>
<c:if test="${not empty funBoardWriteMsg }">
	<script>alert('${funBoardWriteMsg}');</script>
</c:if>
	<div id="wrap">
		<div id="content">
			<h2>{ 동아리 펀딩게시판 }</h2>
			<c:set var="num" value="${paging.total - paging.startRow + 1 }" />
			<c:forEach var="funBoard" items="${funBoardList }">
				<div class="funWrap">
					<p id="funimg"><a href="${conPath}/funBoardDetail.do?funNum=${funBoard.funNum }&pageNum=${paging.currentPage}">
							<img src="${conPath }/circleImg/${funBoard.cPhoto}" alt="펀딩대표이미지">
						</a>
					</p>
					<p class="funcon"><a href="${conPath}/funBoardDetail.do?funNum=${funBoard.funNum }&pageNum=${paging.currentPage}">${funBoard.funTitle }</a></p>
					<p>추진동아리 : ${funBoard.cName }</p>
					<p><progress value="${funBoard.funGold/funBoard.funGoal*100}" max="100"></progress></p>
					<p id="funprice" class="funcon">
						<fmt:formatNumber value="${funBoard.funGold}" pattern="#,### 원" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<fmt:formatNumber value="${funBoard.funGold/funBoard.funGoal*100}" pattern="#,##" /> %
					</p>
				</div>
			</c:forEach>
			<!-- 페이징처리 시작 -->
			<div id="paging">
				<c:if test="${paging.startPage>paging.blockSize }">
					[ <a href="${conPath }/funBoardList.do?pageNum=${paging.startPage-1}&cNum=${param.cNum}"> 이 전 </a> ]
				</c:if>
				<c:forEach var="i" begin="${paging.startPage }"
					end="${paging.endPage }">
					<c:if test="${i==paging.currentPage }">
						<b>${i }</b>
					</c:if>
					<c:if test="${i!=paging.currentPage }">
						<a href="${conPath }/funBoardList.do?pageNum=${i}&cNum=${param.cNum}">${i }</a>
					</c:if>
				</c:forEach>
				<c:if test="${paging.endPage<paging.pageCnt }">
					[ <a href="${conPath }/funBoardList.do?pageNum=${paging.endPage+1}&cNum=${param.cNum}"> 다 음 </a>]
				</c:if>
			</div>
			<!-- 페이징 처리 끝 -->
			<button onclick="location='${conPath}/funBoardWriteForm.do'">새펀딩등록</button>
		</div>
	</div>
</body>
</html>
<jsp:include page="../main/footer.jsp" />