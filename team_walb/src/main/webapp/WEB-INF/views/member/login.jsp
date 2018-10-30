<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워라밸</title>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
<style>
#wrap #content {
	text-align: center;
}

#logFrmMsg {
	color: red;
}
</style>
<link href="${conPath }/css/centerMini.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<c:if test="${not empty loginMsg }">
		<script>
			$(document).ready(function() {
				$('#logFrmMsg').text("");
				$('#logFrmMsg').text("${loginMsg}");
			});
		</script>
	</c:if>

	<div id="wrap">
		<jsp:include page="../main/header.jsp" />
		<div id="content">
			<div id="fakeDiv"></div>
			<div id="miniContentLog">
				<div id="lTitle">
					<h1>WORK AND LIFE BALANCE</h1>
					<img src="${conPath }/srcimg/line1px.jpg" alt="line">
				</div>
				<div class="gap"></div>
				<div id=logImgDiv>
					<img alt="logImg" src="${conPath }/srcimg/logImg.jpg">
				</div>
				<div id="logForm">
					<h1>LOG-IN</h1>
				<form action="${conPath }/login.do" method="post" name="logFrm">
					<div id="insertId" class="square">
						<input type="text" name="mId" placeholder="아이디">
					</div>
					<div id="insertPw" class="square">
						<input type="password" name="mPw" placeholder="비밀번호">
					</div>
					<div class="square" id="noSquare">
						<p id="logFrmMsg">&nbsp;
						<p>
					</div>
					<div id="btns">
						<input type="submit" value="로그인" class="square">
						<input type="button" value="회원가입" class="square">
					</div>
				</form>
				</div>
			</div>

		</div>
		<jsp:include page="../main/footer.jsp" />
	</div>
</body>
</html>