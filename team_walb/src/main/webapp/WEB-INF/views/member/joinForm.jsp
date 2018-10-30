<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../main/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워라밸</title>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
<link href="${conPath}/css/joinForm.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	$(document).ready(function() {
		$('.idconfirm').click(function() {
			/* alert('들어옴'); */
			if ($('#mId').val() == "" || $('#mId').val() == null) {
				$('#idConfirmMsg').html('아이디를 입력하세요');
			} else {
				$.ajax({
					url : '${conPath}/member.do',
					datatype : 'html',
					data : "method=idConfirm&mId=" + $('#mId').val(),
					success : function(data, status) {
						$('#idConfirmMsg').html(data);
					}
				});
			}
		});
		$('#mPw1').keyup(function() {
			if ($('#mPw').val() != $('#mPw1').val()) {
				$('#mPwOkMsg').html("비밀번호가 동일하지 않습니다.").css("color", "red");
			} else {
				$('#mPwOkMsg').html("비밀번호가 일치합니다.").css("color", "green");
			}
		});
	});
</script>
</head>
<body>
	
	<div id="content">
		<form action="${conPath }/joinMember.do" method="post"
			enctype="multipart/form-data">
<br>
<h1>회원가입</h1>
<br>
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="mId" id="mId"> 
						<input type="button" class="idconfirm" value="중복확인"><br>
						 <span id="idConfirmMsg"></span></td>
				</tr>  
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="mPw" id="mPw"></td>
				</tr>
				<tr>
					<th>비밀번호확인</th>
					<td><input type="password" name="mPw1" id="mPw1"><span
						id="mPwOkMsg">&nbsp;</span></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="mName"></td>
				</tr>
				<tr>
					<th>생년월일</th>
				<td><input type="date" name="mBirth"></td>
				</tr>
				<tr>
					<th>프로필사진</th>
					<td><input type="file" id="mPhoto" name="mPhoto"
						value="no-image.jpg"></td>
				</tr>
				<tr>
					<th>부서번호</th>
					<td><select name="deptNo">
						<c:forEach var="d" items="${deptList }">
							<option value="${d.deptNo }">${d.deptNo }- ${d.dName } -
								${d.dLoc }</option>
						</c:forEach>
				</select></td>
				</tr>
				<tr>
					<th>입사일</th>
					<td><input type="date" name="mHire"></td>
				</tr>
				<tr>
					<td colspan="2" id="tdSm"><input type="submit" value="가입" id="submit"></td>
				</tr>
			</table>
		</form>
       <br>
	</div>
</body>

</html>
<jsp:include page="../main/footer.jsp" />