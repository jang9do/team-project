<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	 
		  function msgmPwOk(){
			    window.open('${conPath}/mPwOkForm.do','','width=350,height=300, left=650, top=300, fullscreen=no,resizable=no,location=no,toolbar=no,status=no,menubar=no')
			 }

	
	
</script>
<c:if test="${updateresult!=null }">
	<script>
		alert('${updateresult}');
	</script>
</c:if>
</head>
<body>
	<table>
		<tr>
			<th>회원 탈퇴</th>
			<td>회원을 탈퇴할 시 본 아이디는 사용이 불가능 합니다 정말 탈퇴하시겠습니까?</td>
			<td colspan="2"><input type="button" value="탈퇴취소"
				onclick="location='main.do'">
				 <input type="button"
				id="secession" class="secession" value="탈퇴하기"
				onclick="msgmPwOk()">
				</td>
				
		</tr>
	</table>

</body>
</html>