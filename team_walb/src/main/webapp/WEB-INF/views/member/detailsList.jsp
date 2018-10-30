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
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="mId" value="${detailsList.mId }"
						readonly="readonly">
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="mName"
						value="${detailsList.mName }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="mBirth"
						value="${detailsList.mBirth }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>프로필사진</th>
					<td><img
						src="${conPath }/MemberImgFileUpload/${detailsList.mPhoto }"/></td>
				</tr>
				<tr>
				<th>계급번호</th>
					<td><input type="text" name="lNo"
						value="${detailsList.lNo }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>부서번호</th>
					<td><c:forEach var="d" items="${deptList }">
							<c:if test="${detailsList.deptNo==d.deptNo }">
								<input type="text"
									value="${detailsList.deptNo }-${d.dName }-${d.dLoc }"
									readonly="readonly">
							</c:if>
						</c:forEach> <input type="text" name="deptNo" readonly="readonly"></td>
				</tr>
				<tr>
					<th>가입일</th>
					<td><input type="date" name="mJoin"
						value="${detailsList.mJoin }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>입사일</th>
					<td><input type="date" name="mHire"
						value="${detailsList.mHire }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>탈퇴여부</th>
					<td><input type="text" name="mOut"
						value="${detailsList.mOut }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>동아리 번호1</th>
					<td><input type="text" name="mCircle1"
						value="${detailsList.mCircle1 }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>동아리 번호2</th>
					<td><input type="text" name="mCircle1"
						value="${detailsList.mCircle1 }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>동아리 번호3</th>
					<td><input type="text" name="mCircle1"
						value="${detailsList.mCircle1 }" readonly="readonly"></td>
				</tr>
			</table>
		<!-- </form> -->
	</div>
	<jsp:include page="../main/footer.jsp" />


</body>
</html>