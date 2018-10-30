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
<c:if test="${not empty writeResult }">
	<script>alert('${writeResult}');</script>
</c:if>
<c:if test="${not empty fBoardUpdateResult }">
	<script>alert('${fBoardUpdateResult}');</script>
</c:if>
<c:if test="${not empty fBoardDeleteResult }">
	<script>alert('${fBoardDeleteResult}');</script>
</c:if>
<c:if test="${not empty replyResult }">
	<script>alert('${replyResult}');</script>
</c:if>
	<div id="wrap">
		<div id="content">
			<section>
				<div id="fakeDiv"></div>
				<div id="bbstitle">
					<c:set var="num" value="${paging.total - paging.startRow + 1 }"/>
					<h1>동아리 자유게시판</h1>
					<img src="${conPath }/srcimg/line1px.jpg" id="lineImgf" alt="line">
					<c:if test="${not empty member and lNo==2 or lNo==1}">
					<p><a href="${conPath }/fBoardWriteForm.do?cNum=${param.cNum}">FBOARD WRITE</a></p>
					</c:if>
				</div>
				<div id="bbswrap">
					<div id="bbsnum">번 호</div>
					<div id="bbstitle">제 목</div>
					<div id="bbsmid">작 성 자</div>
					<div id="bbsdate">글 쓴 날 짜</div>
					<c:choose>
	                    <c:when test="${list.size() ==0 }">
	                    	<div id="bbszero">게시글이 없습니다.</div>
	                    </c:when>
	                    <c:otherwise>
							<c:forEach var="fboard" items="${list }">
								<div class="bbsnum">${num }</div>
								<div class="bbstitle">
									<c:forEach var="i" begin="1" end="${fboard.fIndent }">
										<c:if test="${i==fboard.fIndent }">&nbsp;&nbsp;<span id="reple">re</span></c:if>
										<c:if test="${i!=fboard.fIndent }">&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
									</c:forEach>
									<a href="${conPath}/fBoardDetail.do?fNum=${fboard.fNum }&pageNum=${paging.currentPage}&cNum=${param.cNum}&mName=${fboard.mName}">${fboard.fTitle }</a>
								</div>
								<div class="bbsmid">${fboard.mName }</div>
								<div class="bbsdate">${fboard.fDate}</div>
								<c:set var="num" value="${num-1 }"/>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>

				<div id="paging">
					<div id="pagingWrap">
						<c:if test="${paging.startPage > paging.blockSize }">
							<a href="${conPath }/fBoardList.do?pageNum=${paging.startPage-1}&cNum=${param.cNum}"><</a>
						</c:if>
						<c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
							<c:if test="${i==paging.currentPage }">
								<b style="color:#ff00b6">${i }</b>
							</c:if>
							<c:if test="${i!=paging.currentPage }">
								<a href="${conPath }/fBoardList.do?pageNum=${i}&cNum=${param.cNum}">${i}</a>
							</c:if>
						</c:forEach>
						<c:if test="${paging.endPage<paging.pageCnt }">
							<a href="${conPath }/fBoardList.do?pageNum=${paging.endPage+1}&cNum=${param.cNum}">></a>
						</c:if>
					</div> <!-- pagingWrap -->
				</div> <!-- paging -->
			</section>
		</div>
	</div>
</body>
</html>
<jsp:include page="../main/footer.jsp"/>