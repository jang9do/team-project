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
<script>
	$(document).ready(function() {
		$('#mPw1').keyup(function() {
			if ($('#mPw').val() != $('#mPw1').val()) {
				$('#mPwOkMsg').html("비밀번호가 동일하지 않습니다.").css("color", "red");
			}else if($('#mPw').val()==null && $('mPw1').val()==null){
				
			} 
			else {
				$('#mPwOkMsg').html("비밀번호가 일치합니다.").css("color", "green");
			}
		});
	});
	function mPwChk(){
		if($('#dbmPw').val()==$('#sessionPw').val()){
			return true;
		}else{
			alert('입력하신 비밀번호가 틀렸습니다.');
			return false;
		}
	}
	
</script>
</head>
<body>
	<c:if test="${not empty modifyResult && modifyResult==1}"><script>alert('수정 성공');</script></c:if>
	<c:if test="${not empty modifyResult && modifyResult!=1}"><script>alert('수정 실패');</script></c:if>
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<form action="${conPath }/modify.do" onsubmit="return mPwChk();" 
		method="post" enctype="multipart/form-data">
		    <input type="hidden" id="mPhoto" name="dbmPhoto" value="${modifyMember.mPhoto }">
			<input type="hidden" id="sessionPw" value="${mPw }">
			<input type="hidden" name="method" value="modify"> <input
				type="hidden" name="mId" value="${modifyMember.mId }">
			<h1>회원정보수정</h1>

			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="mId" value="${modifyMember.mId }"
						readonly="readonly">
				</tr>
				<tr>
					<th>현재 비밀번호</th>
					<td><input type="password" name="dbmPw" id="dbmPw"></td>
				</tr>
				<tr>
					<th>새 비밀번호</th>
					<td><input type="password" name="mPw" id="mPw"></td>
				</tr>
				<tr>
					<th>새 비밀번호 확인</th>
					<td><input type="password" name="mPw1" id="mPw1"><span
						id="mPwOkMsg">&nbsp;</span></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="mName"
						value="${modifyMember.mName }"></td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="mBirth"
						value="${modifyMember.mBirth }"></td>
				</tr>
				<tr>
					<th>프로필사진</th>
					<td><img
						src="${conPath }/MemberImgFileUpload/${modifyMember.mPhoto }" /><input
						type="file" name="mPhoto" value="${modifyMember.mPhoto }"></td>
				</tr>
				<tr>
					<th>부서번호</th>
					<td><select name="deptNo">
							<c:forEach var="d" items="${deptList }">
								<option value="${d.deptNo }"
									<c:if test="${modifyMember.deptNo==d.deptNo }"> selected="selected"</c:if>>
									${d.deptNo }-${d.dName }-${d.dLoc }</option>
							</c:forEach>
					</select></td>
				</tr>
				<tr>
					<th>입사일</th>
					<td><input type="date" name="mHire"
						value="${modifyMember.mHire }"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="수정"></td>
				</tr>
			</table>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />

</body>
</html>