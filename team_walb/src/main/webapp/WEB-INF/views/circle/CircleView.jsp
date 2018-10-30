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
	#content table{
		margin: 0 auto;
		background-color: lightyellow;
	}
	#content table td, #content table th{
		border: 2px solid orange;
	}
	#content table tr td img{
		width: 100px;
		hegith: 100px;
	}
</style>
</head>
<body>
<c:if test="${not empty CircleJoinResult}"><script>alert('${CircleJoinResult}');</script></c:if>
<div id="wrap">
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<table>
			<tr>
				<td rowspan="4"><img src="${conPath }/circleImg/${Circle.cPhoto }"></td>
				<th>동아리 번호</th>
				<td>${Circle.cNum }</td>
			</tr>
			<tr>
				<th>동아리 이름</th>
				<td>${Circle.cName }</td>
			</tr>
			<tr>
				<th>동아리장</th>
				<td>${Circle.mId }</td>
			</tr>
			<tr>
				<th>활동요일</th>
				<td>${Circle.cTime }</td>
			</tr>
			<c:if test="${member.mId==Circle.mId }">
				<tr>
					<th colspan="3">동아리장 메뉴</th>
				</tr>
				<tr>
					<td colspan="3">
						<a href="${conPath }/reserve.do?cNum=${param.cNum}">활동신청</a>&nbsp;&nbsp;
						<a href="${conPath }/reserveList.do?cNum=${param.cNum}&cName=${Circle.cName}">신청내역</a>
						<a href="${conPath }/circleModifyForm.do?cNum=${param.cNum}&cName=${Circle.cName}">동아리 정보수정</a>
						<a href="${conPath }/circleDelete.do?cNum=${param.cNum}">동아리 해체</a>
					</td>
				</tr>
			</c:if>
			<tr>
				<th colspan="3">상세설명</th>
			</tr>
			<tr>
				<td colspan="3">${Circle.cContent }</td>
			</tr>
			<tr>
				<td><a href="${conPath }/fBoardList.do?cNum=${param.cNum}">자유게시판</a></td>
				<c:if test="${not empty member && (member.mCircle1==param.cNum || member.mCircle2==param.cNum || member.mCircle3==param.cNum)}">
					<td><a href="${conPath }/circleOut.do?cNum=${param.cNum}">동아리 탈퇴</a></td>
				</c:if>
				<c:if test="${not empty member && (member.mCircle1!=param.cNum && member.mCircle2!=param.cNum && member.mCircle3!=param.cNum) && (member.mCircle1==0 || member.mCircle2==0 || member.mCircle3==0)}">
					<td><a href="${conPath }/circleJoin.do?cNum=${param.cNum}">동아리 가입</a></td>
				</c:if>
				<c:if test="${empty member}">
					<td><a href="${conPath }/loginView.do">로그인</a></td>
				</c:if>
				<td><a href="${conPath }/circleMemberList.do?cNum=${param.cNum}&mId=${Circle.mId}">회원목록</a></td>
			</tr>
		</table>
	</div>
	<jsp:include page="../main/footer.jsp" />
</div>
</body>
</html>