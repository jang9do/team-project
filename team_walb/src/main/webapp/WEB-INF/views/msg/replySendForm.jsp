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
	function msgSendFormClose(){
		window.close();
	}
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
				<div class="writeForm">
					<span>받는사람&nbsp; ${readMsg.mesFrom }</span>
					<span>제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목&nbsp;<input type="text" name="mesTitle" class="box" size="30" class="box"></span>
					<span>내&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;용&nbsp;</span><textarea rows="7" cols="32" name="mesContent">${readMsg.mesContent }</textarea><br>
				</div>
				<div class="btn_area">	
					<input type="button" value="취소" onclick="msgSendFormClose()">
					<input type="button" value="보내기" onclick="msgSend()">
				</div>
		</div>
	</div>
</body>
</html>