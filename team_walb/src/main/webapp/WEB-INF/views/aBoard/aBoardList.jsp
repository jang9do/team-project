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
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<link href="${conPath }/css/content.css" rel="stylesheet">
<link href="${conPath }/css/reserveList.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<script>
	$(function(){
		for(var i=1; i<=10; i++){
			$('#star'+i).rateYo({
				rating: $('#cnt'+i).val(),
				readOnly: true
			});
		}
	})
</script>
<style>
	#content p{
		text-align: center;
		color: red;
	}
	#content p .pne{
		color: lightblue;
	}
	#content table tr #chk{
		width: 200px
	}
</style>
</head>
<body>
<c:if test="${not empty aBoardDelete }"><script>alert('${aBoardDelete}');</script></c:if>
<c:if test="${not empty aBoardInput }"><script>alert('${aBoardInput}');</script></c:if>
<div id="wrap">
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<table>
			<tr>
				<th>게시번호</th>
				<th>게시동아리</th>
				<th id="title">제목</th>
				<th>등록일</th>
				<th id="chk">별점</th>
			</tr>
			<c:set var="cnt" value="0" />
			<c:forEach items="${aBoardList }" var="a">
				<c:set var="cnt" value="${cnt+1 }" />
				<tr>
					<td>${a.aNum }</td>
					<td>${a.cName }</td>
					<td><a href="${conPath}/aBoardView.do?aNum=${a.aNum}">${a.aTitle }</a></td>
					<td><fmt:formatDate value="${a.aDate }" pattern="YYYY-MM-dd"/></td>
					<td><div id="star${cnt }"></div></td>
				</tr>
				<input type="hidden" id="cnt${cnt }" value="${a.aScore }">
			</c:forEach>
		</table>
		<p>
			<c:if test="${startPage>10 }"><a href="${conPath }/aBoardList.do?pageNum=${startPage-1}" class="pne">[이전]</a>&nbsp;</c:if>
			<c:forEach begin="${startPage }" end="${endPage }" step="1" var="page">
				<c:if test="${currentPage!=page }">
					<a href="${conPath }/aBoardList.do?pageNum=${page}">[${page }]</a>&nbsp;
				</c:if>
				<c:if test="${currentPage==page }">
					[${page }]&nbsp;
				</c:if>
			</c:forEach>
			<c:if test="${pageCnt>endPage }"><a href="${conPath }/aBoardList.do?pageNum=${endPage+1}" class="pne">[다음]</a>&nbsp;</c:if>
		</p>
	</div>
	<jsp:include page="../main/footer.jsp" />
</div>
</body>
</html>