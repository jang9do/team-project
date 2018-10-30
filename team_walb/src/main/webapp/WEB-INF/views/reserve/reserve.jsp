<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워라밸</title>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="${conPath }/css/content.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
	var nextday = new Date();
	nextday.setDate(nextday.getDate() + 1);
	var actiDate;
	if(nextday.getMonth()>9){
		actiDate = nextday.getFullYear()+'-'+(nextday.getMonth()+1)+'-'+nextday.getDate();
	} else{
		actiDate = nextday.getFullYear()+'-0'+(nextday.getMonth()+1)+'-'+nextday.getDate();
	}
	$('#1').css('background-color', 'black');
	$('#1').css('color', 'white');
	$("#datepicker" ).datepicker(
    		{	dateFormat : 'yy-mm-dd',
    			monthNames : ['1월','2월','3월','4월','5월','6월','7월','8월',
    				'9월','10월','11월','12월'],
    			showMonthAfterYear : true,
    			yearSuffix : '년',
    			showOtherMonths : true,
    			minDate : +1,
    			maxDate : +30,
    			dayNamesMin : ['일','월','화','수','목','금','토'],
    			onSelect: function(dateText, inst){
    				actiDate = dateText;
    				$('#1').css('background-color', 'black');
    				$('#1').css('color', 'white');
    				$.ajax({
    					url : '${conPath }/reserveTime.do',
    					type : 'get',
    					data : 'pNum=1'+'&actiDate='+actiDate+'&cNum=${param.cNum }',
    					datatype : 'html',
    					success : function(data, status){
    						$('.pClick').css('background-color', 'white');
    						$('.pClick').css('color', 'black');
    						$('#1').css('background-color', 'black');
    						$('#1').css('color', 'white');
    						$('#rTime').html(data);
    					}
    				});
    			}
    		}
		);// datePicker
	$.ajax({
		url : '${conPath }/reserveTime.do',
		type : 'get',
		data : 'pNum=1'+'&actiDate='+actiDate+'&cNum=${param.cNum }',
		datatype : 'html',
		success : function(data, status){
			$('#rTime').html(data);
		}
	});
	$('.pClick').click(function(){
		$('.pClick').css('background-color', 'white');
		$('.pClick').css('color', 'black');
		$(this).css('background-color', 'black');
		$(this).css('color', 'white');
		$.ajax({
			url : '${conPath }/reserveTime.do',
			type : 'get',
			data : 'pNum='+$(this).attr('id')+'&actiDate='+actiDate+'&cNum=${param.cNum }',
			datatype : 'html',
			success : function(data, status){
				$('#rTime').html(data);
			}
		});
	});
});
</script>
<style>
	#content p{
		margin: 20px 10px 10px 10px;
		font-size: 1.5em;
		font-weight: bold;
	}
	
	#content #datepicker{
		width: 300px;
		height: 270px;
		margin: 10px;
		float: left;
		border: 2px solid lightgray;
		padding: 12px;
	}
	#content #tdiv{
		float: left;
		border: 2px solid lightgray;
		width: 870px;
		height: 270px;
		margin-top: 10px;
	}
	#content #tdiv table{
		margin: 10px auto;
	}
	#content #rTime{
		width: 1200px;
		font-size: 0.8em;
	}
	#content #rTime form{
		margin: 10px;
		margin-top: 310px;
		border : 2px solid lightgray;
	}
	#content #rTime textarea{
		border: 1px solid lightgray;
		width: 100%;
	}
	#content #rTime input[type=text]{
		height: 35px;
		border: 1px solid lightgray;
		width: 1050px;
	}
	#content #rTime select{
		border: 2px solid lightgray;
		height: 30px;
	}
	#content #rTime input[type=button]{
		border : 2px solid lightgray;
		border-radius: 20px;
		line-height: 30px;
		text-align: center;
		width: 140px;
		margin: 0 0 0 10px;
	}
	#content #rTime p:last-child{
		text-align: center;
	}
	#content #rTime input[type=submit], #content #rTime p:last-child input[type=button]{
		text-align: center;
		width: 100px;
		line-height: 35px;
		background-color : #35CAD7; 
		border-radius: 0;
		border: none;
	}
</style>
</head>
<body>
<div id="wrap">
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<p>동호회 활동 신청서</p>
		<div id="datepicker"></div>
		<div id="tdiv">
			<table>
				<tr>
				<c:set var="count" value="0" />
				<c:forEach items="${pList }" var="p">
					<td class="pClick" id="${p.pNum }"><img src="${conPath }/srcimg/${p.pPhoto}"><br>${p.pName }<br>${p.pLoc }</td>
					<c:if test="${count%5==4 && count!=0}"></tr><tr></c:if>
				</c:forEach>
				</tr>
			</table>
		</div>
		<div id="rTime"></div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</div>
</body>
</html>