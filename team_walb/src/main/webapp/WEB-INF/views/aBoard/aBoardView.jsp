<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워라밸</title>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<link rel="stylesheet" href="${conPath }/css/content.css">
<link rel="stylesheet" href="${conPath }/css/aBoardList.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>
<script>
	var starChk=0;
	$(function () {
		$("#rateYoMain").rateYo({
			rating: ${aBoardView.aScore },
			readOnly: true
		});
		$("#rateYoReply").rateYo({
			halfStar: true,
			onSet: function (rating, rateYoInstance) {
				starChk=1;
				$('#reScore').val(rating);
			}
		})
		var cnt = $("#cnt").val();
		for(var i=1; i<=cnt; i++){
			var rate = $("#cnt"+i).val();
			$("#rateYo"+i).rateYo({
				rating: rate,
				readOnly: true
			});
		}
	});
	function star(){
		if(starChk==0){
			alert('별점을 입력해주세요');
			return false;
		}
	}
</script>
</head>
<body>
<c:if test="${not empty aRepleInsert }"><script>alert('${aRepleInsert}');</script></c:if>
<c:if test="${not empty aBoardModify }"><script>alert('${aBoardModify}');</script></c:if>
<div id="wrap">
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<p>동아리 활동 보고</p>
		<p>&nbsp;&nbsp;제목 : ${aBoardView.aTitle }</p>
		<div id="detail">
			<div id="aimg"><img src="${conPath }/circleImg/${aBoardView.cPhoto}"></div>
			<span>작성동아리(작성자) : ${aBoardView.cName }(${aBoardView.mId })<br>
			행사일 : <fmt:formatDate value="${aBoardView.bDate }" pattern="YYYY-MM-dd" /><br>
			작성일 : <fmt:formatDate value="${aBoardView.aDate }" pattern="YYYY-MM-dd" /><br><div id="rateYoMain"></div>&nbsp;${aBoardView.aScore }&nbsp;점</span>
		</div>
		<div id="aContent">${aBoardView.aContent }</div>
		<p id="btnp"><c:if test="${member.mId == aBoardView.mId }">
					<button onclick="location.href='${conPath}/aBoardDelete.do?aNum=${param.aNum}'">글 삭제</button>&nbsp;
					<button onclick="location.href='${conPath}/aBoardModifyForm.do?aNum=${param.aNum}'">글 수정</button>&nbsp;
			</c:if>
			<button onclick="history.back()">뒤로가기</button>
		</p>
		
		<form action="${conPath }/aReple.do" method="post" onsubmit="return star()">
			<input type="hidden" name="reScore" id="reScore">
			<input type="hidden" name="mId" value="${mId }">
			<input type="hidden" name="aNum" value="${aBoardView.aNum }">
			<c:set var="cnt" value="0" />
			<table>
				<c:if test="${aBoardView.cNum eq member.mCircle1 || aBoardView.cNum eq member.mCircle2 || aBoardView.cNum eq member.mCircle3 }">
					<caption>덧글쓰기</caption>
					<tr>
						<th id="memId">${mId }</th><td id="aplyForm"><textarea name="reContent"></textarea></td><td><input type="submit" value="전송"></td><td><div id="rateYoReply"></div></td>
					</tr>
				</c:if>
				<c:forEach items="${aReplyList }" var="ar">
					<c:set var="cnt" value="${cnt+1 }" />
					<input type="hidden" id="cnt${cnt }" value="${ar.reScore }">
					<tr>
						<th>${ar.mId }</th><td class="apCon">${ar.reContent }</td><td><fmt:formatDate value="${ar.reDate }" pattern="YYYY-MM-dd" /></td><td><div id="rateYo${cnt }"></div></td>
					</tr>
				</c:forEach>
			</table>
			<input type="hidden" id="cnt" value="${cnt }">
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</div>
</body>
</html>