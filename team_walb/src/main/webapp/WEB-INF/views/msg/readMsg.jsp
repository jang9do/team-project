<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/readMsg.css" rel="stylesheet">
<script>
	function readMsgClose(){
		window.close();
	}
</script>
</head>
<body>
	<div id="wrap">
		<div id="content">
		<c:if test="${readMsg.mesTo eq mId}">
			<div class="mes_area">
				<div class="first-line">
					<img src="${conPath }/srcimg/LOGO-walb.png" alt="logo" id="logo">
					<span>No. ${readMsg.mesNum }</span>
				</div>
				<input type="hidden" name="mesNum" value="${readMsg.mesNum }">
				<p id="mesTitle">${readMsg.mesTitle }</p>
				<p id="mesFrom">보낸 사람 &nbsp;&nbsp;${readMsg.mName}(${readMsg.mesFrom})</p>
				<p id="sendTime">받은 시간&nbsp;&nbsp;&nbsp; ${fn:substring(readMsg.mesDate, 0, 16)}</p>
				<p id="mesCon">${readMsg.mesContent }</p>
				<div class="btn_area">
					<button type="button" class="button" onclick="location='${conPath}/msgSendForm.do?mesNum=${readMsg.mesNum}'">답장</button>
					<button type="button" class="button" onclick="location='${conPath}/deleteMsg.do?mesNum=${readMsg.mesNum}'">삭제</button>
					<button type="button" class="button" onclick="readMsgClose()">닫기</button>
				</div>
			</div>
		</c:if>
		<c:if test="${readMsg.mesTo ne mId }">
			<div class="mes_area">
				<div class="first-line">
					<img src="${conPath }/srcimg/LOGO-walb.png" alt="logo" id="logo">
					<span>${readMsg.mesNum }</span>	
				</div>
				<input type="hidden" name="mesNum" value="${readMsg.mesNum }">
				<p>${readMsg.mesTitle }</p>
				<p>받는 사람 ${readMsg.mesTo}</p>
				<p>보낸 시간 ${fn:substring(readMsg.mesDate, 0, 16)}</p>
				<p>${readMsg.mesContent }</p>
				<div class="btn_area">
					<button type="button" class="button" onclick="location='${conPath}/deleteMsg.do?mesNum=${readMsg.mesNum}'">삭제</button>
					<button type="button" class="button" onclick="readMsgClose()">닫기</button>
				</div>
			</div>
		</c:if>
		</div>
	</div>
</body>
</html>