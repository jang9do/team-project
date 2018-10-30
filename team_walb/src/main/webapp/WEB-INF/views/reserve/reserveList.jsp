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
<c:if test="${not empty actiInsert }"><script>alert('${actiInsert}');</script></c:if>
<c:if test="${not empty reserveDelete }"><script>alert('${reserveDelete}');</script></c:if>
<c:if test="${not empty actiResult }"><script>alert('${actiResult}')</script></c:if>
<div id="wrap">
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<table>
			<tr>
				<th>신청번호</th><th id="title">제목</th><th>요청장소</th><th>신청날짜</th><th>이용시간</th><th>승인여부</th><th id="chk">활동확인</th>
			</tr>
			<c:forEach items="${reserveList }" var="rl">
				<tr>
					<td>${rl.actiNum }</td>
					<td>${rl.actiTitle }</td>
					<td>${rl.pName }</td>
					<td><fmt:formatDate value="${rl.actiDate }" pattern="YYYY-MM-dd" /></td>
					<td>${rl.actiTime }</td>
					<td>
						<c:if test="${rl.actiChk==0 }">승인대기</c:if>
						<c:if test="${rl.actiChk==1 }">승인완료</c:if>
					</td>
					<td>
						<c:if test="${rl.actiChk==1 }">
							<button onclick="location.href='${conPath}/actiResultChk.do?actiNum=${rl.actiNum }&cNum=${param.cNum }'">활동완료</button>&nbsp;
							<button onclick="location.href='${conPath}/reserveDelete.do?actiNum=${rl.actiNum }&cNum=${param.cNum }'">신청취소</button>&nbsp;
							<button onclick="location.href='${conPath}/aBoardInputForm.do?actiNum=${rl.actiNum }&cNum=${param.cNum}&cName=${param.cName}'">후기작성</button>&nbsp;
						</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp" />
</div>
</body>
</html>