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
<link href="${conPath }/css/aBoardInput.css" rel="stylesheet">
<script src="${conPath }/resources/ckeditor/ckeditor.js"></script>
	<script type = "text/javascript">
	    window.onload = function(){
	        CKEDITOR.replace("ckedi",{
	        	height: 500,
	        	filebrowserUploadUrl : 'aBoardFileUpload.do'
	        });
	    };
	</script>
</head>
<body>
<div id="wrap">
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<form action="${conPath }/aBoardInput.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="cNum" value="${param.cNum }" />
			<input type="hidden" name="actiNum" value="${param.actiNum }" />
			<table>
				<tr>
					<th>제목</th><td colspan="3"><input type="text" name="aTitle" required="required"></td>
				</tr>
				<tr id="tWidth">
					<th>작성 동아리</th><td>${param.cName }</td><th>활동일</th><td><input type="date" name="temp_bDate" required="required"></td>
				</tr>
				<tr>
					<th colspan="4">내용</th>
				</tr>
				<tr>
					<td colspan="4"><textarea name="aContent" cols="20" id="ckedi" required="required"></textarea></td>
				</tr>
				<tr>
					<td colspan="4"><input type="submit" value="등록">&nbsp;&nbsp;<input type="button" value="뒤로가기" onclick="history.back()"></td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</div>
</body>
</html>