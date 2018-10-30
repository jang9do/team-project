<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	var chk = 0;
	$(function(){
		var time=$('#selectTime').val();
		$('#selectTime').click(function(){
			time=$('#selectTime').val();
		});
		$('.bTime').css('font-weight', 'bold');
		$('.bTime').css('background-color', 'lightblue');
		$('.bTime').css('color', 'white');
		
		$('.aTime').css('font-weight', 'bold');
		$('.aTime').css('background-color', 'pink');
		$('.aTime').css('color', 'white');
	});
</script>
</head>
<body>
		<c:set var="count" value="0" />
		<table>
			<tr>
			<c:forEach begin="18" end="23" var="i">
				<c:forEach items="${actiList }" var="t">
					<fmt:formatDate value="${t.actiDate }" pattern="HH" var="time"/>
					<c:if test="${i==time }"><c:set var="count" value="${t.actiTime }" /><c:set var="cName" value="${t.cName }" /></c:if>
				</c:forEach>
					<c:if test="${count==0 }">
						<td id="${i }" class="bTime">${i }:00~${i+1 }:00</td>
					</c:if>
					<c:if test="${count!=0 }">
						<td id="${i }" class="aTime">${i }:00~${i+1 }:00<br>${cName }</td>
						<c:set var="count" value="${count-1 }" />
					</c:if>
			</c:forEach>
			</tr>
		</table>
</body>
</html>