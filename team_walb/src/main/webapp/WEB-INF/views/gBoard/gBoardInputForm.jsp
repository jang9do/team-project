<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워라밸</title>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
<link href="${conPath }/css/content.css" rel="stylesheet">
<link href="${conPath }/css/reserveList.css" rel="stylesheet">
<style>
	#content table tr td{
		overflow: hidden; 
  		text-overflow: ellipsis;
  		white-space: nowrap;
  		width: 600px;
  		text-align: left;
	}
	#content table tr th{
		width: 100px;
	}
	#content table tr td a{
		width: 100px;
	}
	#content table tr .con{
		height: 500px;
		vertical-align: top;
	}
	#content table tr #btn{
		text-align: center;
	}
	#content table td input{
		background-color: lightblue;
		width: 100%;
		height: 100%;
	}
	#content table td input[type=submit], #content table td input[type=button]{
		height: 30px;
		width: 90px;
		border: 10x solid black;
		background-color: pink;
		color: black;
		font-weight: bold;
	}
	#content table td textarea{
		background-color: lightblue;
		width: 100%;
		height: 500px;
	}
</style>
</head>
<body>
<div id="wrap">
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<form action="${conPath }/gboardInput.do" method="post" enctype="multipart/form-data">
			<table>
				<tr>
					<th>제목</th><td colspan="3"><input type="text" name="gTitle" required="required"></td>
				</tr>
				<tr>
					<th>작성자</th><td><input type="text" value="${member.mId }" readonly="readonly" name="mId"></td>
				</tr>
				<tr>
					<th>첨부파일</th><td><input type="file" name="gFile"></td>
				</tr>
				<tr>
					<th colspan="4">내용</th>
				</tr>
				<tr>
					<td colspan="4"><textarea name="gContent" required="required"></textarea></td>
				</tr>
				<tr>
					<td colspan="4" id="btn">
						<input type="submit" value="등록">
						<input type="button" onclick="history.back()" value="뒤로가기">
					</td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</div>
</body>
</html>