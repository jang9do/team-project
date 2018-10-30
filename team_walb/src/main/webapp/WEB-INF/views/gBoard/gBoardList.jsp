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
<style>
	#content table tr td{
		height: 30px;
	}
	#content p{
		text-align: center;
		color: red;
		margin: 30px;
		margin-top: -10px;
	}
	#content p .pne{
		color: lightblue;
	}
	#content table #write{
		font-weight: bold;
	}
</style>
</head>
<body>
<c:if test="${not empty gboardDelete }"><script>alert('${gboardDelete}');</script></c:if>
<c:if test="${not empty gboardInsert }"><script>alert('${gboardInsert}');</script></c:if>
<div id="wrap">
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<table>
			<tr>
				<th>공지번호</th><th>제목</th><th>작성자</th><th>작성일</th>
			</tr>
			<c:forEach items="${gBoardList }" var="gl">
				<tr>
					<td>${gl.gNum }</td>
					<td id="title"><a href="${conPath }/gboardView.do?gNum=${gl.gNum}">${gl.gTitle }</a></td>
					<td>${gl.mId }</td>
					<td><fmt:formatDate pattern="YYYY-MM-dd" value="${gl.gDate }" /></td>
				</tr>
			</c:forEach>
			<c:if test="${member.lNo==1 }"><tr><td colspan="4" id="write"><a href="${conPath }/gboardInputForm.do">글 쓰기</a></td></tr></c:if>
		</table>
		<p>
			<c:if test="${startPage>10 }"><a href="${conPath }/gboardList.do?pageNum=${startPage-1}" class="pne">[이전]</a>&nbsp;</c:if>
			<c:forEach begin="${startPage }" end="${endPage }" step="1" var="page">
				<c:if test="${currentPage!=page }">
					<a href="${conPath }/gboardList.do?pageNum=${page}">[${page }]</a>&nbsp;
				</c:if>
				<c:if test="${currentPage==page }">
					[${page }]&nbsp;
				</c:if>
			</c:forEach>
			<c:if test="${pageCnt>endPage }"><a href="${conPath }/gboardList.do?pageNum=${endPage+1}" class="pne">[다음]</a>&nbsp;</c:if>
		</p>
	</div>
	<jsp:include page="../main/footer.jsp" />
</div>
</body>
</html>