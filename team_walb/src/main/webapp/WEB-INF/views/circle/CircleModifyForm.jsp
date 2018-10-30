<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	<c:if test="${not empty CircleInsertResult }"><script>alert('${CircleInsertResult}');</script></c:if>
	<div id="wrap">
		<jsp:include page="../main/header.jsp" />
		<div id="content">
			<form action="${conPath }/circleModify.do" method="post"
				enctype="multipart/form-data">
				<input type="hidden" value="${param.cNum }" name="cNum">
				<table>
					<tr>
						<th>동아리 이름</th><td><input type="text" name="cName" value="${circleView.cName}" readonly="readonly"></td>
					</tr>
					<tr>
						<th>동아리장</th>
						<td><input type="text" name="mId" value="${circleView.mId}"
							readonly="readonly"></td>
					</tr>
					<tr>
						<th>동아리 설명</th>
						<td><textarea name="cContent" rows="15" cols="100">${circleView.cContent }</textarea></td>
					</tr>
					<tr>
						<th>활동 시간</th>
						<td><select name="cTime">
								<option
									<c:if test="${circleView.cTime=='일' }">selected="selected"</c:if>>일</option>
								<option
									<c:if test="${circleView.cTime=='월' }">selected="selected"</c:if>>월</option>
								<option
									<c:if test="${circleView.cTime=='화' }">selected="selected"</c:if>>화</option>
								<option
									<c:if test="${circleView.cTime=='수' }">selected="selected"</c:if>>수</option>
								<option
									<c:if test="${circleView.cTime=='목' }">selected="selected"</c:if>>목</option>
								<option
									<c:if test="${circleView.cTime=='금' }">selected="selected"</c:if>>금</option>
								<option
									<c:if test="${circleView.cTime=='토' }">selected="selected"</c:if>>토</option>
						</select></td>
					</tr>
					<tr>
						<th>사진</th>
						<td><img src="${conPath }/circleImg/${circleView.cPhoto }"><br>사진변경<input
							type="file" name="cPhoto"></td>
					</tr>
					<tr>
						<td><input type="submit" value="등록"><input
							type="button" value="뒤로가기" onclick="history.back();"></td>
					</tr>
				</table>
			</form>
		</div>
		<jsp:include page="../main/footer.jsp" />
	</div>
</body>
</html>