<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워라밸</title>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
<link href="${conPath }/css/content.css" rel="stylesheet">
</head>
<body>
<div id="wrap">
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<table>
			<tr>
				<th>회원아이디</th><th>회원이름</th><th>회원등급</th><th>생일</th><th>입사일</th>
			</tr>
			<tr>
				<td>${CircleMaster.mId }</td>
				<td>${CircleMaster.mName }</td>
				<td>Circle Master</td>
				<td><fmt:formatDate value="${CircleMaster.mBirth }" pattern="YYYY-MM-dd"/></td>
				<td><fmt:formatDate value="${CircleMaster.mHire }" pattern="YYYY-MM-dd"/></td>
			</tr>
			<c:forEach items="${CircleMemberList }" var="cm">
				<tr>
					<td>${cm.mId }</td>
					<td>${cm.mName }</td>
					<td>Nomal Member</td>
					<td><fmt:formatDate value="${cm.mBirth }" pattern="YYYY-MM-dd"/></td>
					<td><fmt:formatDate value="${cm.mHire }" pattern="YYYY-MM-dd"/></td>
				</tr>
			</c:forEach>
		</table>
		<p><button onclick="history.back()">뒤로가기</button></p>
	</div>
	<jsp:include page="../main/footer.jsp" />
</div>
</body>
</html>