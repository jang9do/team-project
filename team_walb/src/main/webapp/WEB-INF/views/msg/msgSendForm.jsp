<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/msgForm.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	//닫기 버튼 클릭시 창 닫기
	function msgSendFormClose(){
		window.close();
	}
	
	//쪽지 발송 후 창닫기(부모창으로 돌아가기)
	function msgSend(){
		window.close();
		var mesFrom = $('#mesFrom').val();
		var mesTo = $('#mesTo').val();
		var mesTitle = $('#mesTitle').val();
		var mesContent = $('#mesContent').val()
		opener.location.href="${conPath }/msgSend.do?mesFrom="+encodeURI(mesFrom)+"&mesTo="+encodeURI(mesTo)+
		"&mesTitle="+encodeURI(mesTitle)+"&mesContent="+encodeURI(mesContent);
	}
</script>
</head>
<body>
	<div id="wrap">
		<div id="content">
			<input type="hidden" name="mesFrom" id="mesFrom" value="${mesFrom }">
				<div class="first-line">
					<img src="${conPath }/srcimg/LOGO-walb.png" alt="logo" id="logo">
				</div>
			<c:if test="${empty readMsg }">
				<div class="writeForm">
					<span>받는사람&nbsp;<input type="text" name="mesTo" id="mesTo" class="box" size="30"></span>
					<span>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목&nbsp;<input type="text" name="mesTitle" id="mesTitle" class="box" size="30"></span>
					<span>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용&nbsp;</span><textarea rows="7" cols="32" name="mesContent" id="mesContent"></textarea><br>
				</div>
				<div class="btn_area">
					<input type="button" value="취소" onclick="msgSendFormClose()" class="box">
					<input type="button" value="보내기" onclick="msgSend()" class="box">
				</div>
			</c:if>
			<c:if test="${not empty readMsg }">
				<div class="writeForm">
					<span>받는사람&nbsp;<input type="text" name="mesTo" id="mesTo" class="box" size="30" value="${readMsg.mesFrom }" readonly="readonly"></span>
					<span>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목&nbsp;<input type="text" name="mesTitle" id="mesTitle" class="box" size="30" value="[re]"></span>
					<span>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용&nbsp;</span><textarea rows="7" cols="32" name="mesContent" id="mesContent">${readMsg.mesContent }</textarea><br>
				</div>
				<div class="btn_area">
					<input type="button" value="취소" onclick="msgSendFormClose()">
					<input type="button" value="보내기" onclick="msgSend()">
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>