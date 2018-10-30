<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<jsp:include page="../main/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>워라밸</title>
	<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans" rel="stylesheet">
	<link href="${conPath }/css/fboard.css" rel="stylesheet">
</head>
<body>
<c:if test="${not empty fBoardUpdateResult }">
	<script>alert('${fBoardUpdateResult}');</script>
</c:if>
<c:if test="${not empty fBoardDeleteResult }">
	<script>alert('${fBoardDeleteResult}');</script>
</c:if>
	<div id="wrap">
		<div id="content">
			<section>
				<div id="fakeDiv"></div>
				<div id="bbstitle">
					<h1>VIEW ACTIVITY REPORT</h1>
					<img src="${conPath }/srcimg/line1px.jpg" id="lineImgf" alt="line">
					<p>
						<a href="${conPath}/fBoardList.do?pageNum=${param.pageNum }&cNum=${detail.cNum}">LIST</a>
						<c:if test="${not empty member and lNo==2 or lNo==1}">
						<span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
						<a href="${conPath}/fBoardUpdateForm.do?fNum=${detail.fNum }&pageNum=${param.pageNum }&cNum=${detail.cNum}&mName=${param.mName}">UPDATE</a>
						<span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
						<a href="${conPath}/fBoardDelete.do?fNum=${detail.fNum }&pageNum=${param.pageNum }&cNum=${detail.cNum}">DELETE</a>
						<span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
						<a href="${conPath}/fBoardReplyView.do?fNum=${detail.fNum }&pageNum=${param.pageNum }&cNum=${detail.cNum}&mName=${param.mName}">REPLY</a>
						</c:if>
					</p>
				</div>
				<div class="gap"></div>
				<div id="writewrap">
					<div id="writeform">
						<span id="title">제목 : </span>
						<span class="title">${detail.fTitle }</span>
						<div id="titlebottom">WRITE MEMBER : ${param.mName }, WRITE DATE : ${detail.fDate }</div>
						<div class="gap"></div>
						<span>${detail.fContent }</span>
					</div>
					<div class="gap"></div>
					<div class="gap"></div>
				</div>
			</section>
		</div>
	</div>
</body>
</html>
<jsp:include page="../main/footer.jsp"/>