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
    <link href="/srcimg/headIcon.png" type="image/png" rel="icon">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/CircleMain.css" />
	<link rel="stylesheet" type="text/css" href="css/tabstyle.css" />
</head>
<body>
<c:if test="${not empty circleOutResult}"><script>alert('${circleOutResult}');</script></c:if>
<c:if test="${not empty CircleJoinResult}"><script>alert('${CircleJoinResult}');</script></c:if>
<div id="wrap">
	<div id="content">
		<c:if test="${not empty mCircle1 }">
			<div>
				<p>${mCircle1.cName }</p>
				<a href="${conPath }/circleView.do?cNum=${mCircle1.cNum}"><img src="${conPath }/circleImg/${mCircle1.cPhoto }"></a><br>
				<div class="cg">${mCircle1.cName }<br>
				${mCircle1.cContent }</div>
			</div>
		</c:if>
		<c:if test="${not empty mCircle2 }">
			<div>
				<p>${mCircle2.cName }</p>
				<a href="${conPath }/circleView.do?cNum=${mCircle2.cNum}"><img src="${conPath }/circleImg/${mCircle2.cPhoto }"></a><br>
				<div class="cg">${mCircle2.cName }<br>
				${mCircle2.cContent }</div>
			</div>
		</c:if>
		<c:if test="${not empty mCircle3 }">
			<div>
				<p>${mCircle3.cName }</p>
				<a href="${conPath }/circleView.do?cNum=${mCircle3.cNum}"><img src="${conPath }/circleImg/${mCircle3.cPhoto }"></a><br>
				<div class="cg">${mCircle3.cName }<br>
				${mCircle3.cContent }</div>
			</div>
		</c:if>
	</div>
</div>
</body>
</html>
<jsp:include page="../main/footer.jsp"/>