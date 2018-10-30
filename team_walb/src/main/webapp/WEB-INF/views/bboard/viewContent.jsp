<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워라밸</title>
<style></style>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
  <link href="${conPath }/css/viewBcontent.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
</script>


</head>
<body>
	<c:if test="${not empty bunapplyChkError }">
		<script>
			alert('${bunapplyChkError}');`
		</script>
	</c:if>
	<c:if test="${not empty bunMsg }">
		<script>
			alert('${bunMsg}');
		</script>
	</c:if>

	<%-- ${viewBboard } --%>
	<div id="wrap">
	<jsp:include page="../main/header.jsp"/>
	
	<div id="content">
	<div id="fakeDiv"></div>
		<div id="miniContent">
			<h3>지금 이 시각! 번개모임</h3>
			<img src="${conPath }/srcimg/line1px.jpg" alt="line" id="lineImg">
			<div class="gap"></div>
			<div id="divWrap">
			<div id="leftDiv">
				<div id="leftImg">
					<img src="${conPath }/circleImg/${viewBboard.cPhoto}">
				</div>
				<div id="cContent">
					<p style="color: white">┃${viewBboard.cName} 동호회</p>
				</div>
			</div>
			<div id="rightDiv">
				<table>
					<tr>
						<th>모임 제목 : </th>
						<td colspan="3">${viewBboard.bTitle }</td>
					</tr>
					<tr>
						<th>신청 마감시간 : </th>
						<td colspan="3">${viewBboard.bEnd }시</td>
					</tr>
					<tr>
						<th>현재 신청인원 : </th>
						<td class="tdWidth">${viewBboard.bCount } 명</td>
						<th>모임 최소인원 : </th>
						<td class="tdWidth">${viewBboard.bPeople } 명</td>
					</tr>
				</table>

				<div id="btnDiv">
					<c:if test="${empty member || empty nonParticipant && empty participant }">
						<input type="button" class="btnMouse" value="전체 번개 모임" onclick="location.href='bunListAll.do?pageNum=${pageNum }'">
					</c:if>
					<c:if test="${not empty member && not empty nonParticipant }">
						<input type="button" class="btnMouse" value="번개 참여" onclick="location.href='${conPath}/participateBun.do?bNum=${viewBboard.bNum }'">
						<input type="button" class="btnMouse" value="전체 번개 모임" onclick="location.href='${conPath}/bunListAll.do?pageNum=${pageNum }'">
					</c:if>
					<c:if test="${not empty member && not empty participant }">
						<input type="button" class="btnMouse" value="참여 취소" onclick="location.href='${conPath}/cancleBun.do?bNum=${viewBboard.bNum }'">
						<input type="button" class="btnMouse" value="번개 목록" onclick="location.href='${conPath}/bunListAll.do?pageNum=${pageNum }'">
					</c:if>
				</div>
			</div><!-- rightDiv -->
			</div>
		<div id="bUp">
			<div id="bUpTitle">
				<p>모임 내용</p>
			</div>
			<div id="bUpContent">
				<p>${viewBboard.bContent }</p>
			</div>
		</div>

		</div><!-- miniContent -->
	
	
	</div><!-- content -->
	<jsp:include page="../main/footer.jsp"/>
	</div>
</body>
</html>