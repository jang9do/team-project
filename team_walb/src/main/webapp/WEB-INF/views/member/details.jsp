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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<form action="${conPath }/modifyForm.do" method="post"
			enctype="multipart/form-data">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="mId" value="${modifyMember.mId }"
						readonly="readonly">
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="mName"
						value="${modifyMember.mName }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="mBirth"
						value="${modifyMember.mBirth }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>프로필사진</th>
					<td><img
						src="${conPath }/MemberImgFileUpload/${modifyMember.mPhoto }"/></td>
				</tr>
				<tr>
					<th>부서번호</th>
					<td><c:forEach var="d" items="${deptList }">
							<c:if test="${modifyMember.deptNo==d.deptNo }">
								<input type="text"
									value="${modifyMember.deptNo }-${d.dName }-${d.dLoc }"
									readonly="readonly">
							</c:if>
						</c:forEach> <input type="text" name="deptNo" readonly="readonly"></td>
				</tr>
				<tr>
					<th>입사일</th>
					<td><input type="date" name="mHire"
						value="${modifyMember.mHire }" readonly="readonly"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="정보수정하기">
					<input type="button" value="탈퇴하기" onclick="location='secessionForm.do'"></td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>