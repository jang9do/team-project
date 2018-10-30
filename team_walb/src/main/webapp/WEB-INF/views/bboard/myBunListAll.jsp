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
<style></style>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
<link href="${conPath }/css/bList.css" rel="stylesheet">
<!-- 리스트 css로 변경 -->
<script>
	function trClicked(bNum){
		location.href="${conPath}/viewBboard.do?bNum="+bNum+"&pageNum=${paging.currentPage}";
	}
</script>

  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../main/header.jsp" />

		<div id="content">
			<div id="fakeDiv"></div>
			<div id="miniContent">
				<h3>${mId }님의 전체 번개 목록</h3>
				<img src="${conPath }/srcimg/line1px.jpg" alt="line" id="lineImg">
				<div class="gap"></div>
				<p class="textRight"><!-- My -->
					<span><a href="${conPath}/myBunListAll.do">전체 번개 목록</a></span> | 
					<span><a href="">진행 중 번개목록</a></span> | 
					<span><a href="">완료된 번개목록</a></span>
				</p>
				<div class="gap"></div>
				<table>
					<c:set var="num" value="${paging.total - paging.startRow +1 }" />
					<tr>
						<th class="leftT">No.</th>
						<th>동호회명</th>
						<th>번개 모임</th>
						<th>진행 여부</th>
						<th>등록 시간</th>
						<th>마감 시간</th>
						<th>신청 인원</th>
						<th>생성 인원</th>
					</tr>
					<c:forEach var="list" items="${myBunListAll }">
						<tr onclick="(trClicked('${list.bNum}'))" class="clickHover">
							<td class="leftT">${num }</td>
							<td>${list.cName }</td>
							<td>${list.bTitle }</td>
							<c:if test="${list.bActi==0 }">
								<td class="ing">ING</td>
							</c:if>
							<c:if test="${list.bActi==1 }">
								<td class="end">END</td>
							</c:if>
							<td>${list.bStart }시</td>
							<td>${list.bEnd }시</td>
							<td>${list.bCount }명</td>
							<td>${list.bPeople }명</td>
						</tr>
						<c:set var="num" value="${num-1 }" />
					</c:forEach>
				</table>
				<div class="gap"></div>
				<div id="paging">
				<div id="pagingWrap">
					<c:if test="${paging.startPage > paging.blockSize }">
						<a href="${conPath }/myBunListAll.do?pageNum=${paging.startPage-1}">&lt;</a>
						<!-- a 태그에 display block하고 사이즈 주고 border 주기 -->
					</c:if>
					<c:forEach var="i" begin="${paging.startPage }"
						end="${paging.endPage }">
						<c:if test="${i==paging.currentPage }">
							<b>${i }</b>
							<!-- b 태그에 사이즈 주고 border+background-color -->
						</c:if>
						<c:if test="${i!=paging.currentPage }">
							<a href="${conPath }/myBunListAll.do?pageNum=${i}">${i }</a>
							<!-- a 태그에 display block하고 사이즈 주고 border 주기 -->
						</c:if>
					</c:forEach>
					<c:if test="${paging.endPage < paging.pageCnt }">
						<a href="${conPath }/myBunListAll.do?pageNum=${paging.endPage+1}">></a>
						<!-- a 태그에 display block하고 사이즈 주고 border 주기 -->
					</c:if>
				</div>
				</div><!-- paging -->
				
			</div>
		</div>
		<!-- content -->
		<jsp:include page="../main/footer.jsp" />
	</div>
</body>
</html>