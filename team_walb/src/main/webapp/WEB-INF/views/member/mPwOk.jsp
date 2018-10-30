<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	function exitMember(){
		window.close();
		opener.location.href="${conPath}/secession.do?mPw="+$('#mPw').val();
	}
	function closeWindow(){
		window.close();
	}
</script>
</head>
<body>
		<h1>회원 탈퇴 확인</h1>
		<table>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="mPw" id="mPw"></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="button" value="탈퇴" onclick="exitMember()">
					<input type="button" value="취소" onclick="closeWindow()">
				</td>
			</tr>
		</table>
</body>
</html>