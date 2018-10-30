<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워라밸</title>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
<link href="${conPath }/css/content.css" rel="stylesheet">
<style>
	#content a img{
		width: 150px;
		height: 150px;
	}
</style>
</head>
<body>
<c:if test="${not empty CircleInsertResult }"><script>alert('${CircleInsertResult}');</script></c:if>
<div id="wrap">
<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<c:forEach items="${CircleTop3 }" var="t">
			<a href="${conPath }/circleViewHit.do?cNum=${t.cNum}"><img src="${conPath }/circleImg/${t.cPhoto }">${t.cName }</a>
		</c:forEach>
		<br>
		<c:forEach items="${CircleList }" var="c">
			<a href="${conPath }/circleViewHit.do?cNum=${c.cNum}"><img src="${conPath }/circleImg/${c.cPhoto }">${c.cName }</a>
		</c:forEach>
		<br>
		<p>
			<c:if test="${startPage>10 }"><a href="${conPath }/circleList.do?pageNum=${startPage-1}">[이전]</a>&nbsp;</c:if>
			<c:forEach begin="${startPage }" end="${endPage }" step="1" var="page">
				<c:if test="${page != currentPage }"><a href="${conPath }/circleList.do?pageNum=${page}">[${page }]&nbsp;</a></c:if>
				<c:if test="${page eq currentPage }">[${page }]&nbsp;</c:if>
			</c:forEach>
			<c:if test="${pageCnt>endPage }"><a href="${conPath }/circleList.do?pageNum=${endPage+1}">[다음]</a>&nbsp;</c:if>
		</p>
	</div>
<jsp:include page="../main/footer.jsp"/>
</div>
</body>
</html>