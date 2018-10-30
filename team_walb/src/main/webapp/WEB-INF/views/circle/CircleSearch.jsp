<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<jsp:include page="../main/header.jsp" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>워라밸</title>
	<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans" rel="stylesheet">
	<link href="${conPath }/css/search.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<!-- 서치관련 스크립트 부분 시작 -->
	<script>
		$(function(){
			$('.weekend').click(function(){
				$('#cTime').val($(this).val());
			});
		});
		function color(obj) { 
			var buttons = obj.form.test; 
			for(var i=0,len=buttons.length ; i<len ; i++) { 
			buttons[i].style.backgroundColor = "";
			buttons[i].style.color = "";
			buttons[i].style.fontWeight = "";
			} 
			obj.style.backgroundColor = "#ff00b6";
			obj.style.color = "#a8fff1";
			obj.style.fontWeight = "bold";
			}
	</script>
	<!-- 서치관련 스크립트 부분 끝 -->
</head>
<body>
	<div id="wrap">
		<div id="content">
			<section>
				<div id="fakeDiv"></div>
				<div id="searchtitle">
					<h1>SEARCH</h1>
					<img src="${conPath }/srcimg/line1px.jpg" id="lineImgf" alt="line">
				</div>
				<div class="gap"></div>
				<div id="searchwrap">
					<form action="${conPath }/circleSearch.do">
						<input type="hidden" name="cTime" id="cTime">
						<div id="searchformname">
							<span id="acname">ACTIVITY<br>NAME</span>
							<input type="text" name="cName"" class="inputbox">
						</div>
						<div id="searchformcontent">
							<span id="accontent">ACTIVITY<br>CONTENT</span>
							<input type="text" name="cContent" class="inputbox">
						</div>
						<div class="gap"></div>
						<div id="acday">
							<p>ACTIVITY DAY</p>
							<div class="day1">
								<input type="button" class="weekend" value="월" name="test" onclick="color(this)">
								<input type="button" class="weekend" value="화" name="test" onclick="color(this)">
								<input type="button" class="weekend" value="수" name="test" onclick="color(this)">
								<input type="button" class="weekend" value="목" name="test" onclick="color(this)">
							</div>
							<div class="day2">
								<input type="button" class="weekend" value="금" name="test" onclick="color(this)">
								<input type="button" class="weekend" value="토" name="test" onclick="color(this)">
								<input type="button" class="weekend" value="일" name="test" onclick="color(this)">
							</div>
						</div>
						<input type="submit" value="SEARCH" class="searchbtn">
					</form>
				</div>
				<!-- 동아리 시작 -->
				
				<c:set value="0" var="cnt" />
				<c:forEach items="${CircleSearchList }" var="t">
					<div id="circles">
						<a href="${conPath }/circleViewHit.do?cNum=${t.cNum}">
							<img src="${conPath }/circleImg/${t.cPhoto }">
							<div class="cg">ACTIVITY NAME : ${t.cName }<br>ACTIVITY CONTENT : ${t.cContent }</div>
						</a>
						<c:if test="${cnt%3 == 2 }"></c:if>
						<c:set value="${cnt+1 }" var="cnt" />
					</div>
				</c:forEach>
				<!-- 동아리 끝 -->
				<!-- 페이징 시작 -->
				<div id="paging">
					<div id="pagingWrap">
						<c:if test="${paging.startPage > paging.blockSize }">
							<a href="${conPath }/circleSearch.do?pageNum=${startPage-1}&cName=${param.cName}&cContent=${param.cContent}&cTime=${param.cTime}""><</a>
						</c:if>
						<c:forEach var="page" step="1" begin="${startPage }" end="${endPage }">
							<c:if test="${page==paging.currentPage }">
								<b style="color:#ff00b6">${page }</b>
							</c:if>
							<c:if test="${page!=paging.currentPage }">
								<a href="${conPath }/circleSearch.do?pageNum=${page}&cName=${param.cName}&cContent=${param.cContent}&cTime=${param.cTime}">${page}</a>
							</c:if>
						</c:forEach>
						<c:if test="${paging.endPage<paging.pageCnt }">
							<a href="${conPath }/circleSearch.do?pageNum=${endPage+1}&cName=${param.cName}&cContent=${param.cContent}&cTime=${param.cTime}">></a>
						</c:if>
					</div> <!-- pagingWrap end -->
				</div> <!-- paging end -->
			</section>
		</div>
	</div>
</body>
</html>
<jsp:include page="../main/footer.jsp" />