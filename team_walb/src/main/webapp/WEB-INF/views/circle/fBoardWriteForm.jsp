<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<jsp:include page="../main/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워라밸</title>
	<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans" rel="stylesheet">
	<link href="${conPath }/css/fboard.css" rel="stylesheet">
	<script type="text/javascript" src="<c:url value="/js/jquery-2.1.4.min.js"/>"></script>
	<script src="${conPath }/resources/ckeditor/ckeditor.js"></script>
	<script type = "text/javascript">
	    window.onload = function(){
	        CKEDITOR.replace("ckedi",{
	        	filebrowserUploadUrl : 'fBoardFileUpload.do'
	        });
	    };
	</script>
</head>
<body>
<c:if test="${not empty writeResult }">
	<script>alert('${writeResult}');</script>
</c:if>
	<div id="wrap">
		<div id="content">
			<section>
				<form action="${conPath }/fBoardWrite.do" method="post" id="frm" enctype="multipart/form-data">
					<input type="hidden" name="cNum" value="${param.cNum }">
					<input type="hidden" name="mId">
					<div id="fakeDiv"></div>
					<div id="bbstitle">
						<h1>WRITE ACTIVITY REPORT</h1>
						<img src="${conPath }/srcimg/line1px.jpg" id="lineImgf" alt="line">
						<p>
							<input type="submit" value="SUBMIT" class="buttons">
							<span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
							<input type="reset" value="CANCLE" class="buttons">
							<span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;</span>
							<input type="button" value="LIST" onclick="location='${conPath}/fBoardList.do?cNum=${param.cNum }'" class="buttons">
						</p>
					</div>
					<div class="gap"></div>
					<div id="writewrap">
						<div id="writeform">
							<span id="title">제목 : </span>
							<input type="text" name="fTitle" id="ftitle" required="required">
							<div class="gap"></div>
							<textarea name="fContent" id="ckedi" required="required"></textarea>
						</div>
						<div class="gap"></div>
					</div>
				</form>
			</section>
		</div>
	</div>
</body>
</html>
<jsp:include page="../main/footer.jsp"/>