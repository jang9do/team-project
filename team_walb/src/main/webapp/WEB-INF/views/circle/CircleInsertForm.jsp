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
</head>
<body>
<c:if test="${not empty CircleInsertResult }"><script>alert('${CircleInsertResult}');</script></c:if>
<div id="wrap">
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<form action="${conPath }/circleInsert.do" method="post">
			<table>
				<tr>
					<th>동아리 이름</th><td><input type="text" name="cName"></td>
				</tr>
				<tr>
					<th>동아리장</th><td><input type="text" name="mId"></td>
				</tr>
				<tr>
					<th>동아리 설명</th><td><textarea name="cContent" rows="15" cols="100"></textarea></td>
				</tr>
				<tr>
					<th>활동 시간</th>
					<td>
						<select name="cTime">
							<option>일</option>
							<option>월</option>
							<option>화</option>
							<option>수</option>
							<option>목</option>
							<option>금</option>
							<option>토</option>
						</select>
					</td>
				</tr>
				<tr><td><input type="submit" value="등록"><input type="button" value="뒤로가기" onclick="history.back();"></td></tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</div>
</body>
</html>