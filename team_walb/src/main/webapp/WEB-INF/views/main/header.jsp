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
<style>
</style>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Noto+Sans" rel="stylesheet">
<link href="${conPath }/css/header.css" rel="stylesheet">

</head>
<body>
	<header>
		<div id="logoImg">
			<a href="${conPath }/main.do"><img src="${conPath }/srcimg/LOGO-walb.png" alt="logo"></a>
		</div>
		<div id="gnb">
			<ul id="menu">
				<li>Work & Life
					<ol class="subMenu">
						<li><a href="#">워라밸 소개</a></li>
						<li><a href="${conPath }/gboardList.do">전체 공지사항</a></li>
					</ol>
				</li>
				<li>Gather &amp; Activity
					<ol class="subMenu">
						<li><a href="${conPath }/circleList.do">동호회 소개</a></li>
						<li><a href="${conPath }/aBoardList.do">활동 보고서</a></li>						
					</ol>
				</li>
				<li>WALB PLACES
					<ol class="subMenu">
						<li><a href="${conPath }/reserveView.do">장소예약현황</a></li>
					</ol>
				</li>
				<li>FUNDING HEARTS
				<ol class="subMenu">
						<li><a href="${conPath }/funBoardList.do">진행 중 펀딩</a></li>
					</ol>
				</li>
				<li><a href="#">HOT TAGS</a>
				<ol class="subMenu">
					<li><a href="${conPath }/bunListAll.do">번개 모임</a></li>
					<li><a href="${conPath }/writeBboardForm.do">번개 신청</a></li>
				</ol>
				</li>
			</ul>
		</div>
	<!-- 로그인 전, 비회원 소개 외에 액세스 불가 -->
		<c:if test="${empty member }">
		<div id="hIcon">
			<ul id="iconMenu">
				<li>
					<a href="#"><img src="${conPath }/srcimg/memberIcon.png" alt="memberIcon"></a>
						<ol class="iconSubMenu">
							<li><a href="${conPath }/loginView.do">로그인</a></li>
							<li><a href="${conPath }/joinForm.do">회원가입</a></li>
						</ol>
				</li>
				<li><a href="${conPath }/circleSearch.do"><img src="${conPath }/srcimg/searchIcon.png" alt="searchIcon"></a></li>
			</ul>
		</div>
		</c:if>
		
	<!-- 로그인 후, 일반회원 및 동아리장 -->
		<c:if test="${not empty member and lNo==2}">
		<div id="hIcon">
			<ul id="iconMenu">
				<li><img src="${conPath }/srcimg/myMenuIcon.png" alt="myMenuIcon">
					<ol class="iconSubMenu">
						<li><a href="${conPath }/circleMain.do">MY LIST</a></li>
						<li><a href="${conPath }/myBunListAll.do">번개 LIST</a></li>
					</ol>
				</li>
				<li><img src="${conPath }/srcimg/memberIcon.png" alt="memberIcon">
					<ol class="iconSubMenu">
						<li><a href="${conPath }/details.do">나의 정보</a></li>
						<li><a href="${conPath }/logout.do">로그아웃</a></li>
					</ol>
				</li>
				<li>
				<c:if test="${msgChkNum==0 }">
				<div id="msgDiv">
					<img src="${conPath }/srcimg/messageIcon.png" alt="messageIcon">
				</div>
				</c:if>
				<c:if test="${msgChkNum!=0 }">
				<div id="msgDiv">
					<img src="${conPath }/srcimg/messageIcon.png" alt="messageIcon">
					<div id="msgNum"><p>${msgChkNum }</p></div>
				</div>
				</c:if>
					<ol class="iconSubMenu">
						<li><a href="${conPath }/msgMain.do">메세지</a></li>
						<li><a href="#">초대장</a></li>
					</ol>
				</li>
				<li><a href="${conPath }/circleSearch.do"><img src="${conPath }/srcimg/searchIcon.png" alt="searchIcon"></a>
				</li>
			</ul>
		</div>
		</c:if>
		
		
	<!-- 로그인 후, 관리자 -->
		<c:if test="${not empty member and lNo==1}">
		<div id="hIcon">
			<ul id="iconMenu">
				<li><img src="${conPath }/srcimg/myMenuIcon.png" alt="myMenuIcon">
					<ol class="iconSubMenu">
						<li><a href="${conPath }/memberList.do">회원 관리</a></li>
						<li><a href="${conPath }/circleInsertForm.do">서클 등록</a></li>
					</ol>
				</li>
				<li><img src="${conPath }/srcimg/memberIcon.png" alt="memberIcon">
					<ol class="iconSubMenu">
						<li><a href="${conPath }/details.do">나의 정보</a></li>
						<li><a href="${conPath }/logout.do">로그아웃</a></li>
					</ol>
				</li>
				<li>
					<c:if test="${msgChkNum==0 }">
						<div id="msgDiv">
							<img src="${conPath }/srcimg/messageIcon.png" alt="messageIcon">
						</div>
						</c:if>
						<c:if test="${msgChkNum!=0 }">
						<div id="msgDiv">
							<img src="${conPath }/srcimg/messageIcon.png" alt="messageIcon">
							<div id="msgNum"><p>${msgChkNum }</p></div>
						</div>
					</c:if>
					<ol class="iconSubMenu">
						<li><a href="${conPath }/msgMain.do">메세지</a></li>
						<li><a href="${conPath }/actiAdminList.do">결제 요청</a></li>
					</ol>
				</li>
				<li><a href="${conPath }/circleSearch.do"><img src="${conPath }/srcimg/searchIcon.png" alt="searchIcon"></a>
				</li>
			</ul>
		</div>
		</c:if>
	</header>
</body>
</html>