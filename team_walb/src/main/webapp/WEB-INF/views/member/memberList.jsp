<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워라밸</title>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
<%-- <link href="${conPath }/css/bunList.css" rel="stylesheet"> --%>
<style>
* {
	margin: 0;
	padding: 0;
	border: 0;
}

a {
	color: black;
}


#wrap #content {
	text-align: center;
	min-height: 680px;
	width: 1200px;
	margin: 0 auto;
}

#wrap #content #miniContent h1 {
	font-family: 'Noto Sans', sans-serif;
	font-size: 18pt;
	font-weight: bold;
	color: #696969;
	height: 25px;
	letter-spacing: 1px;
	margin: 30px;
}
#wrap #content #fakeDiv{
  margin-top:50px; 
}

/*--------------------- table ------------------------*/
table {
	/* height: 300px; */
	width: 1200px; border : 1px solid #c5c5c5;
	margin: 0 auto;
	text-align: center;
	color: #323233;
	overflow: hidden;
	border: 1px solid #c5c5c5;
}

tr {
	border-bottom: 1px solid black;
	height: 30px;
	line-height: 30px;
}

tr:nth-child(1) {
	background-color: #a8fff1;
}

td {
	color: black;
}

#asc {
	text-align: right;
}

#sc { 
	margin-top: 10px;
} 

#sc input[type=submit]{
	width: 50px;
	height: 25px;
} 

#word {
	border: 1px solid black;
}

#item {
	height: 25px;
}

/*---------------------paging button------------------------*/
#wrap #content #paging {
	text-align: center;
	height: 70px;
	line-height: 70px;
	margin-right: 5px;
}

#wrap #content #paging #pagingWrap {
	margin: 0 auto;
}

#wrap #content #paging a, #wrap #content #paging b {
	display: inline-block;
	width: 50px;
	height: 50px;
	line-height: 50px;
	border: 2px solid white;
	color: black;
}

#wrap #content #paging a:hover, #wrap #content #paging b:hover {
	border: 2px solid #ff00b6;
	font-weight: bold;
}
</style>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>

<body>
	<div id="wrap">
		<jsp:include page="../main/header.jsp" />	
		<div id="content">
			<div id="fakeDiv"></div>
			<div id="miniContent">
				<h1>회원 목록</h1>
				<img src="${conPath }/srcimg/line1px.jpg" alt="line" id="lineImg">
				
				<div class="gap"></div>

				<div id="bunList">
				<form action="${conPath }/detailsList.do" method="post">
					<table>
					<c:set var="num" value="${paging.total - paging.startRow+1 }" />
						<tr>
							<th>아이디</th>
							<th>이름</th>
							<th>생년월일</th>
							<th>프로필 사진</th>
							<th>계급번호</th>
							<th>부서</th>
							<th>가입일</th>
							<th>입사일</th>
							<th>탈퇴여부</th>
							<th>동아리 번호1</th>
							<th>동아리 번호2</th>
							<th>동아리 번호3</th>
						</tr>
						<c:forEach var="m" items="${memberList}">
							<tr>
								<td><a href="detailsList.do?mId=${m.mId }">${m.mId }</a></td>
								<td>${m.mName }</td>
								<td>${m.mBirth }</td>
								<td>${m.mPhoto }</td>
								<td>${m.lNo }</td>
								<td>${m.deptNo }</td>
								<td><fmt:formatDate value="${m.mJoin }" pattern="yy년MM월dd일" />
								</td>
								<td><fmt:formatDate value="${m.mHire }" pattern="yy년MM월dd일" />
								</td>
								<td>${m.mOut }</td>
								<td>${m.mCircle1 }</td>
								<td>${m.mCircle2 }</td>
								<td>${m.mCircle3 }</td>
							</tr>
							<c:set var="num" value="${num-1 }" />
						</c:forEach>
					</table>
				</form>
	<div id="asc">
	<form action="${conPath }/memberList.do" id="sc">
		<select name="schItem" id="item">
			<option value="mId" 
				<c:if test="${param.schItem=='mId' }">selected="selected"</c:if>
			>아이디</option>
			<option value="mName" 
				<c:if test="${param.schItem=='mName' }">selected="selected"</c:if>
			>이름</option>
		</select> 
		<input type="text" name="schWord" value="${param.schWord }" id="word">&nbsp;
		<input type="submit" value="검색">
	</form>
	</div>				
			</div><!-- bunList -->
			</div>	<!-- miniContent -->

	<div id="paging">
	<div id="pagingWrap">
		<c:if test="${paging.startPage>paging.blockSize }">
		   <a href="${conPath }/memberList.do?pageNum=${paging.startPage-1}&schItem=${param.schItem}&schWord=${param.schWord}">이전</a>
	    </c:if>
		<c:forEach var="i" begin="${paging.startPage }"
			end="${paging.endPage }">
			<c:if test="${i==paging.currentPage }">
	       <b>${i}</b>
	   </c:if>
			<c:if test="${i!=paging.currentPage}">
	       <a href="${conPath }/memberList.do?pageNum=${i}&schItem=${param.schItem}&schWord=${param.schWord}">${i}</a>
	    </c:if>
		</c:forEach>
		<c:if test="${paging.endPage<paging.pageCnt }">
	       <a href="${conPath }/memberList.do?pageNum=${paging.endPage+1}&schItem=${param.schItem}&schWord=${param.schWord}">다음</a>
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