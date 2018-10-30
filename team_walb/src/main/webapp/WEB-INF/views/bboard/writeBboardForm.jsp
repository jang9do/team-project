<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워라밸</title>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
<style>
</style>
<link href="css/writeFormB.css" rel="stylesheet">
<link href="css/foundation-datepicker.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="${conPath }/js/foundation-datepicker.js"></script>
<script src="${conPath }/js/locales/foundation-datepicker.kr.js"></script>
<script type="text/javascript" src="${conPath }/resources/ckeditor/ckeditor.js"></script>



<script>
$(function(){
	  $('#dpt').fdatepicker({
			format: 'yyyy-mm-dd hh:ii',
			disableDblClickSelection: true,
			language: 'kr',
			pickTime: true
		});
	});
function submitChk(){
	/* Tue Aug 28 2018 10:53:05 GMT+0900 */
 	var dateCurrent = new Date();
	/* 2018-08-16 02:00 */
	var timeVal = $('#dpt').val();
	var y = timeVal.substr(0, 4);
	var m = timeVal.substr(5, 2);
	var d = timeVal.substr(8,2);
	var h = timeVal.substr(11,2);
	var i = timeVal.substr(14,2);
	//alert(y+'년'+m+'월'+d+'일');
	var dateSet = new Date(y,m-1,d,h,i)
	//alert(timeVal+" / "+dateSet+"비교할 현재 :"+dateCurrent);
	if(dateSet<=dateCurrent){
		alert('설정 불가능한 모임시간입니다. 이후의 시간으로 설정해주세요.');
		$('#dpt').focus();
		return false;
	}else if(dateSet>=dateCurrent){
		/* alert(dateSet+"으로 번개모임 시간이 설정되었습니다."); */
		return true;
	}else{
		alert('알수 없는 에러 코드');
	}
}


</script>
</head>

<body>
<c:if test="${not empty writeBboardMsg }">
	<script>
		alert('${writeBboardMsg}');
	</script>
</c:if>


	<div id="wrap">
		<jsp:include page="../main/header.jsp" />
		<div id="content">
			<div id="fakeDiv"></div>
			<div id="writeForm">
				<h1>번개모임 신청서 작성</h1>
				<img src="${conPath }/srcimg/line1px.jpg" alt="line" id="lineImg">
				<div class="gap"></div>
				<form action="${conPath }/writeBboard.do" method="post" onsubmit="return submitChk()">
				<div id="bFormParam">
					<div id="paramTitle">
						<h3>모임 제목 : </h3><input type="text" name="bTitle" value="${param.bTitle}">
					</div>
					<div id="paramWrap">
						<div id="paramBend">
							<h3 class="title3">모임 시간 : </h3><input type="text" name="bEnd" id="dpt" class="timeSet" required="required"> <!-- placeholder="예: 2018-08-27 19:00"  -->
						</div>
						<div id="paramBpeople">
							<h3 class="title3">모임 생성 인원 : </h3><input type="number" name="bPeople" min="1" required="required" value="${param.bPeople }">
						</div>
						<div id="paramCircle">
							<h3 class="title3">활동 동호회 : </h3><select name="cNum" id="cNumSelect" >
												<c:if test="${empty param.cNum && !mIdCircleList.cName1.equals('미가입') }">
													<option value="${mIdCircleList.cNum1 }">${mIdCircleList.cName1 }</option>
												</c:if>
												<c:if test="${empty param.cNum && !mIdCircleList.cName2.equals('미가입') }">
													<option value="${mIdCircleList.cNum2 }">${mIdCircleList.cName2 }</option>
												</c:if>
												<c:if test="${empty param.cNum && !mIdCircleList.cName3.equals('미가입') }">
													<option value="${mIdCircleList.cNum3 }">${mIdCircleList.cName3 }</option>
												</c:if>
												
												<c:if test="${not empty param.cNum && param.cNum==mIdCircleList.cNum1 }">
													<option value="${mIdCircleList.cNum1 }" selected="selected">${mIdCircleList.cName1 }</option>
												</c:if>
												<c:if test="${not empty param.cNum && param.cNum==mIdCircleList.cNum2 }">
													<option value="${mIdCircleList.cNum2 }" selected="selected">${mIdCircleList.cName2 }</option>
												</c:if>
												<c:if test="${not empty param.cNum && param.cNum==mIdCircleList.cNum3 }">
													<option value="${mIdCircleList.cNum3 }" selected="selected">${mIdCircleList.cName3 }</option>
												</c:if>
												</select>
						</div>
					</div><!-- paramWrap -->
					<div id="subTitle">
						<h3>활동 내용</h3>
					</div>
					<div id="bFormContent">
						<textarea rows="30" cols="122" name="bContent" required="required" id="textareaDiv">${param.bContent }</textarea>
					</div>
					<div id="bFormBtns">
						<input type="submit" value="신청">
						<input type="button" value="취소" onclick="history.back()">
					</div>
				</div><!-- bFormParam -->
				</form>
			</div> <!-- writeForm -->
		</div> <!-- content -->
		<jsp:include page="../main/footer.jsp" />
	</div> <!-- wrap -->				
</body>	
</html>