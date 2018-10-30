<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<link href="${conPath }/css/footer.css" rel="stylesheet">
</head>
<body>
	<footer>
	<c:if test="${empty member }">
	<div id="fSlogan">
		<p>일과 삶의 문화를 만듭니다.</p>
		<p><span>라이프 스타일 워라밸</span><span style="font-size: 5pt">TM</span></p>
		<img src="${conPath }/srcimg/line1px.jpg" id="lineImgf" alt="line">
	</div>
	<div id="footerNav">
		<ol id="fList1"> 
			<li class="boldOnly">WORK & LIFE</li>
			<li>워라밸 소개</li>
			<li>전체 공지사항</li>
		</ol>
		<ol id="fList2"> 
			<li class="boldOnly">Gather & Activity</li>
			<li>동호회 목록</li>
			<li>동호회 활동 보고서</li>
		</ol>
		<ol id="fList3"> 
			<li class="boldOnly">PLACES FOR WALB</li>
			<li>장소 예약 현황 둘러보기</li>
		</ol>
		<ol id="fList4"> 
			<li class="boldOnly">FUNDING HEARTS</li>
			<li>워라밸 펀딩 소개</li>
			<li>현재 진행 중 펀딩</li>
			<li>진행 종료된 펀딩</li>
		</ol>
		<ol id="fList5"> 
			<li class="boldOnly">HOT TAGS</li>
			<li class="boldOnly">SEARCH</li>
		</ol>
	</div>
		<div id="sendTop">
			<p><a href="#logoImg">▲</a></p>
			<p><a href="#logoImg">TOP</a></p>
			<p style="padding: 0">&nbsp;</p>
			<p id="copyR">Copyright ⓒ 2018 WALB All Rights Reserved</p>
		</div>
	</c:if>
	
	
	
	
	<c:if test="${not empty member }">
	<div id="fSlogan">
		<p>일과 삶의 문화를 만듭니다.</p>
		<p><span>라이프 스타일 워라밸</span><span style="font-size: 5pt">TM</span></p>
		<img src="${conPath }/srcimg/line1px.jpg" id="lineImgf" alt="line">
	</div>
	<div id="footerNav">
		<ol id="fList1"> 
			<li class="boldOnly">WORK & LIFE</li>
			<li><a href="#">워라밸 소개</a></li>
			<li><a href="#">전체 공지사항</a></li>
		</ol>
		<ol id="fList2"> 
			<li class="boldOnly">Gather & Activity</li>
			<li><a href="#">동호회 목록</a></li>
		</ol>
		<ol id="fList3"> 
			<li class="boldOnly">PLACES FOR WALB</li>
			<li><a href="#">장소 예약 현황 둘러보기</a></li>
		</ol>
		<ol id="fList4"> 
			<li class="boldOnly">FUNDING HEARTS</li>
			<li><a href="#">워라밸 펀딩 소개</a></li>
			<li><a href="#">현재 진행 중 펀딩</a></li>
			<li><a href="#">진행 종료된 펀딩</a></li>
		</ol>
		<ol id="fList5"> 
			<li class="boldOnly"><a href="#">HOT TAGS</a></li>
			<li class="boldOnly"><a href="#">SEARCH</a></li>
		</ol>
	</div>
		<div id="sendTop">
			
			<p><a href="#logoImg">▲</a></p>
			<p><a href="#logoImg">TOP</a></p>
			<p style="padding: 0">&nbsp;</p>
			<p id="copyR">Copyright ⓒ 2018 WALB All Rights Reserved</p>
		</div>
	</c:if>
	</footer>
</body>
</html>