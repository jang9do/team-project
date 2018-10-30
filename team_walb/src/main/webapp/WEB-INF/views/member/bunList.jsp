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
<style></style>
<link href="${conPath }/css/bunList.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
	function trClicked(bNum) {
		location.href = "${conPath}/viewBboard.do?bNum=" + bNum + "&pageNum=${paging.currentPage}";
	}
</script>
</head>
<body>
<c:if test="${not empty writeBboardMsg }">
	<script>
		alert('${writeBboardMsg}');
	</script>
</c:if>

	<div id="wrap">
		<jsp:include page="../main/header.jsp" />
		<div id="content">
			<div id="fakeDiv"></div>
			<div id="miniContent">
				<h1>
					SUDDEN GATHERING <span id="bunSub">${bunTitle }</span>
				</h1>
				<img src="${conPath }/srcimg/line1px.jpg" alt="line" id="lineImg">
				<p class="textRight">
					<span class="hoverColor"><a href="${conPath}/bunListAll.do">전체</a></span> | 
					<span class="hoverColor"><a href="${conPath }/bboardListIng.do">진행 중</a></span> | 
					<span class="hoverColor"><a href="${conPath }/bboardListPopular.do">인기 순</a></span>
				</p>
				<div class="gap"></div>

				<div id="bunList">

					<c:forEach var="list" items="${bunList }">
						<div class="bunDiv" onclick="(trClicked('${list.bNum}'))">
							<div class="bunDivImg">
								<img src="${conPath }/circleImg/${list.cPhoto}" class="cImg" alt="${list.cName } 동호회 Img">
							</div>
							<div class="blackDiv"></div>
							<div class="bunDivText">
								<div class="textUp">
									<div class="textUpTitle">
										<p style="color:white">${list.bTitle }</p>
									</div>
									<div class="textUpHour">
										<c:if test="${list.hour==1 }">
											<p style="color:yellow">★${list.hour }hour</p>
										</c:if>
										<c:if test="${list.hour!=1 && list.hour>0 && list.hour<10 }">
											<p style="color: #a8fff1">★${list.hour }hours</p>
										</c:if>
										<c:if test="${list.hour<0 }">
											<p style="color:white">종료</p>
										</c:if>
										<c:if test="${list.hour>9 }">
											<p style="color:white">진행</p>
										</c:if>
									</div>
								</div><!-- textUp -->
								<div class="textDown">
									<div class="textDownLeft" >
										<p style="color:white">${list.cName } 동호회</p>
										<p style="color:white">${list.bEnd }시</p>
									</div>
									<div class="textDownRight">
										<p style="color:white">현재 참여 인원</p>
										<p style="color:white">${list.bCount }명</p>
									</div>
								</div><!-- textDown -->
							</div><!-- bunDivText -->
						</div><!-- bunDiv -->
					</c:forEach>
					
				</div><!-- bunList -->
			</div>	<!-- miniContent -->

			<div id="paging">
			<div id="pagingWrap">
			<c:if test="${not empty pagingListAll }">
					<c:if test="${pagingListAll.startPage > pagingListAll.blockSize }">
						<a href="${conPath }/bunListAll.do?pageNum=${pagingListAll.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="p" begin="${pagingListAll.startPage }" end="${pagingListAll.endPage }">
						<c:if test="${p==pagingListAll.currentPage }">
							<b style="color:#ff00b6">${p }</b>
						</c:if>
						<c:if test="${p!=pagingListAll.currentPage }">
							<a href="${conPath }/bunListAll.do?pageNum=${p}">${p}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pagingListAll.endPage < pagingListAll.pageCnt }">
						<a href="${conPath }/bunListAll.do?pageNum=${pagingListAll.startPage+1}">다음</a>
					</c:if>
			</c:if>

			<c:if test="${not empty pagingListIng }">
					<c:if test="${pagingListIng.startPage > pagingListIng.blockSize }">
						<a href="${conPath }/bboardListIng.do?pageNum=${pagingListIng.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="p" begin="${pagingListIng.startPage }"
						end="${pagingListIng.endPage }">
						<c:if test="${p==pagingListIng.currentPage }">
							<b>${p }</b>
						</c:if>
						<c:if test="${p!=pagingListIng.currentPage }">
							<a href="${conPath }/bboardListIng.do?pageNum=${p}">${p}</a>
						</c:if>
					</c:forEach>
					<c:if test="${pagingListIng.endPage < pagingListIng.pageCnt }">
						<a
							href="${conPath }/bboardListIng.do?pageNum=${pagingListIng.startPage+1}">다음</a>
					</c:if>
			</c:if>


			<c:if test="${not empty pagingListPopular }">
				
					<c:if
						test="${pagingListPopular.startPage > pagingListPopular.blockSize }">
						<a href="${conPath }/bboardListPopular.do?pageNum=${pagingListPopular.startPage-1}">이전</a>
					</c:if>
					<c:forEach var="p" begin="${pagingListPopular.startPage }"
						end="${pagingListPopular.endPage }">
						<c:if test="${p==pagingListPopular.currentPage }">
							<b>${p }</b>
						</c:if>
						<c:if test="${p!=pagingListPopular.currentPage }">
							<a href="${conPath }/bboardListPopular.do?pageNum=${p}">${p}</a>
						</c:if>
					</c:forEach>
					<c:if
						test="${pagingListPopular.endPage < pagingListPopular.pageCnt }">
						<a href="${conPath }/bboardListPopular.do?pageNum=${pagingListPopular.startPage+1}">다음</a>
					</c:if>
			</c:if>
			</div> <!-- pagingWrap -->
			</div> <!-- paging -->










		</div>
		<!-- content -->
		<jsp:include page="../main/footer.jsp" />
	</div>
	<!-- wrap -->
</body>
</html>