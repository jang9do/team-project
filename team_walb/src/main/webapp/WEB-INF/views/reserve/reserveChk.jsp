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
<link href="${conPath }/css/reserveList.css" rel="stylesheet">
</head>
<body>
<c:if test="${not empty actiChkResult }"><script>alert('${actiChkResult }');</script></c:if>
<div id="wrap">
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<table>
			<tr>
				<th>신청번호</th><th>신청 동아리</th><th id="title">신청 제목</th><th>신청일</th><th>활동시간</th><th id="chk">승인</th>
			</tr>
			<c:forEach items="${actiAdmin }" var="aa">
				<tr>
					<td>${aa.actiNum }</td>
					<td>${aa.cName }</td>
					<td>${aa.actiTitle }</td>
					<td><fmt:formatDate value="${aa.actiDate }" pattern="YYYY-MM-dd" /></td>
					<td>${aa.actiTime}</td>
					<td><button onclick="location.href='${conPath }/actiChk.do?actiNum=${aa.actiNum}'">승인</button>&nbsp;<button onclick="location.href='${conPath }/reserveAdminDelete.do?actiNum=${aa.actiNum}">거부</button></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp" />
</div>
</body>
</html>