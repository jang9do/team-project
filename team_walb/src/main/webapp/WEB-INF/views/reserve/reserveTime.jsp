<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	var chk = 0;
	$(function(){
		var time=$('#selectTime').val();
		$('#selectTime').click(function(){
			time=$('#selectTime').val();
		});
		$('.bTime').css('font-weight', 'bold');
		$('.bTime').css('background-color', 'gray');
		$('.bTime').css('color', 'white');
		for(var i=18; i<24; i++){
			if($('#'+i).attr('disabled')!='disabled'){
				$('#'+i).css('background-color', 'white');
				$('#'+i).css('color', 'black');
			}
		}
		$('.bTime').hover(function(){
			var num = Number($(this).attr('id'));
			var move = 0;
			var imsi = num;
			for(var i=num; i<num+Number(time); i++){
				if(i>23 || $('#'+i).attr('disabled')=='disabled' || move==1){
					move=1;
					if($('#'+imsi).attr('disabled')!='disabled'){
						imsi = imsi-1;
						if($('#'+imsi).attr('disabled')=='disabled'){
							break;
						}
						$('#'+imsi).css('color', '#35CAD7');
					}
				} else {
					$('#'+i).css('color', '#35CAD7');
				}
			}
		});
		$('.bTime').mouseout(function(){
			for(var i=18; i<24; i++){
				if($('#'+i).attr('disabled')!='disabled'){
					$('#'+i).css('color', 'black');
				}
			}
		});
		$('.bTime').click(function(){
			for(var i=18; i<24; i++){
				if($('#'+i).attr('disabled')!='disabled'){
					$('#'+i).css('background-color', 'white');
				}
			}
			var num = Number($(this).attr('id'));
			var move = 0;
			var imsi = num;
			for(var i=num; i<num+Number(time); i++){
				if(i>23 || $('#'+i).attr('disabled')=='disabled' || move==1){
					move=1;
					if($('#'+imsi).attr('disabled')!='disabled'){
						imsi = imsi-1;
						if($('#'+imsi).attr('disabled')=='disabled' || imsi<18){
							alert('예약이 불가능합니다');
							chk=0;
							for(var i=18; i<24; i++){
								if($('#'+i).attr('disabled')!='disabled'){
									$('#'+i).css('background-color', 'white');
									$('#'+i).css('color', 'black');
								}
							}
							break;
						}
						$('#'+imsi).css('background-color', 'pink');
						$('#actiDate').val('${param.actiDate} '+imsi+':00:00');
						chk=1;
					}
				} else {
					$('#'+i).css('background-color', 'pink');
					$('#actiDate').val('${param.actiDate} '+num+':00:00');
					chk=1;
				}
			}
		});
	});
	function chkon(){
		if(chk==0){
			alert('시간을 선택해주세요');
			return false;
		}
	}
</script>
<style></style>
</head>
<body>
	<form action="${conPath }/reserveResult.do" onsubmit="return chkon()" method="post">
		<input type="hidden" name="actiDate" id="actiDate">
		<input type="hidden" name="pNum" value="${param.pNum }">
		<input type="hidden" name="cNum" value="${param.cNum }">
		<p>
		이용 시간 : <select id="selectTime" name="actiTime">
			<option value="1" selected="selected">1시간</option>
			<option value="2">2시간</option>
			<option value="3">3시간</option>
			<option value="4">4시간</option>
			<option value="5">5시간</option>
			<option value="6">6시간</option>
		</select>
		
		<c:set var="count" value="0" />
		<c:forEach begin="18" end="23" var="i">
			<c:forEach items="${actiList }" var="t">
				<fmt:formatDate value="${t.actiDate }" pattern="HH" var="time"/>
				<c:if test="${i==time }"><c:set var="count" value="${t.actiTime }" /></c:if>
			</c:forEach>
				<c:if test="${count==0 }">
					<input type="button" id="${i }" class="bTime" value="${i }:00~${i+1 }:00">
				</c:if>
				<c:if test="${count!=0 }">
					<input type="button" id="${i }" class="bTime" value="${i }:00~${i+1 }:00" disabled="disabled">
					<c:set var="count" value="${count-1 }" />
				</c:if>
		</c:forEach>
		</p>
		<p>
			신청 제목 : <input type="text" required="required" name="actiTitle">
		</p>
		<p>
			<textarea rows="30" cols="50" required="required" name="actiCon"></textarea>
		</p>
		<p>
			<input type="submit" value="신청">
			<input type="button" value="뒤로가기" onclick="history.back()">
		</p>
	</form>
</body>
</html>