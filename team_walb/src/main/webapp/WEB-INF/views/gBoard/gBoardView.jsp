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
<link href="${conPath }/css/reserveList.css" rel="stylesheet">
</head>
<style>
	#content table tr td{
		overflow: hidden; 
  		text-overflow: ellipsis;
  		white-space: nowrap;
  		width: 600px;
  		text-align: left;
		padding-left: 10px;
	}
	#content table tr th{
		width: 100px;
	}
	#content table tr td a{
		width: 100px;
	}
	#content table tr .con{
		height: 500px;
		vertical-align: top;
		padding: 10px;
	}
	#content table tr .btn{
		text-align: center;
	}
</style>
<body>
<c:if test="${not empty gBoardModify }"><script>alert('${gBoardModify }');</script></c:if>
<div id="wrap">
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<table>
			<tr>
				<th>제목</th><td>${gboardView.gTitle }</td>
			</tr>
			<tr>
				<th>작성자</th><td>${gboardView.mId }</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><a href="${conPath }/gboardFile/${gboardView.gFile }">${gboardView.gFile }</a></td>
			</tr>
			<tr>
				<th colspan="2">내용</th>
			</tr>
			<tr>
				<td colspan="2" class="con">${gboardView.gContent }</td>
			</tr>
			<tr>
				<td colspan="2" class="btn">
					<c:if test="${member.mId eq gboardView.mId }">
						<button onclick="location.href='${conPath}/gboardModifyForm.do?gNum=${gboardView.gNum }&mId=${gboardView.mId }'">수정</button>
						<button onclick="location.href='${conPath}/gboardDelete.do?gNum=${gboardView.gNum }'">삭제</button>
					</c:if>
					<button onclick="history.back()">뒤로가기</button>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp" />
</div>
</body>
</html>