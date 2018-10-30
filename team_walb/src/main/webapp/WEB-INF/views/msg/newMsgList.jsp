<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워라밸</title>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
<link href="${conPath }/css/msgMain.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
	//쪽지작성 팝업창 띄우기
	function msgWritePopup(){
		window.open('${conPath}/msgSendForm.do','','width=350,height=400, left=650, top=300, fullscreen=no,resizable=no,location=no,toolbar=no,status=no,menubar=no')
	}
	
	//쪽지 상세보기 팝업창 띄우기
	$(function(){
		$('.mes_detail').click(function(mesNum){
			window.open('${conPath}/readMsg.do?mesNum='+$(this).attr('id'),'','width=350,height=400, left=650, top=300, fullscreen=no,resizable=no,location=no,toolbar=no,status=no,menubar=no');
		});
	});
	
	//체크박스 모두 선택
	function allChk(obj){
	      var chkObj = document.getElementsByName("msgChkbox");
	      var rowCnt = chkObj.length - 1;
	      var check = obj.checked;
	      if (check) {﻿
	          for (var i=0; i<=rowCnt; i++){
	           if(chkObj[i].type == "checkbox")
	               chkObj[i].checked = true; 
	          }
	      } else {
	          for (var i=0; i<=rowCnt; i++) {
	        	  if(chkObj[i].type == "checkbox"){
	        		  chkObj[i].checked = false; 
	           }
	          }
	      }
	  }
	
	  function chk_msgDel(){
		  var mesNum = "";
		  //var msgChk = document.getElementsByName("msgChkbox");
		  $('input[name=msgChkbox]').each(function(idx, data){
			  if($(this).is(':checked'))
				mesNum += $(this).val() + '-';   
		  });
		  alert(mesNum);
		  location.href="${conPath}/deleteMsg.do?mesNums="+mesNum;
	  }
</script>
</head>
<body>
	<div id="wrap">
		<jsp:include page="../main/header.jsp" />
		<div id="content">
		<div id="fakeDiv"></div>
			<div class="msg_divide">
				<div id="menu_back">
					<div class="title">
						<h1>MESSAGES</h1>
						<img src="${conPath }/srcimg/line1px.jpg" alt="line" id="lineImg">
					</div>
					<div class="msg_leftsidemenu">
						<ul>
							<li class="hoverColor"><a href="${conPath}/msgMain.do">받은 쪽지함</a></li>
							<li class="hoverColor"><a href="${conPath}/msgSendList.do">보낸 쪽지함</a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="msg_divide">
			<div class="fakeDiv"></div>
				<ul class="msg_rightside">
					<li><input type="checkbox" id="allCheck" onclick="allChk(this)">&nbsp;전체 선택</li>
					<li class="hoverColor"><a onclick="chk_msgDel()">삭제</a></li>
					<li class="hoverColor"><a href="${conPath}/newMsgList.do">안읽은 쪽지</a></li>
					<li class="hoverColor"><a href="#" onclick="msgWritePopup()">쪽지쓰기</a></li>
				</ul>
				<div class="msglist">
						<c:forEach var="mes" items="${newMsgList }">
							<!-- 쪽지 1개 둘러싸는 div -->
							<div class="mes_area">
								<div class="mes_colspan">
									<c:if test="${mes.mesChk eq 0 }">
										<img src="${conPath}/msgImg/mes_new.png" alt="newMessage" class="float">
									</c:if>
									<c:if test="${mes.mesChk eq 1 }">
										<img src="${conPath}/msgImg/mes_read.png" alt="readMessage" class="float">
									</c:if>
									<input type="checkbox" class="float" name="msgChkbox" value="${mes.mesNum }">
								</div>
									<div class="pink">
									<c:if test="${mes.mesChk eq 0 }">
										<div class="mes_detail" id="${mes.mesNum }">
											<p>${mes.mesTitle }</p>
											<p>${mes.mesContent }</p>
										</div>
										<div class="mes_colspan">
											<p class="float">${fn:substring(mes.mesDate, 0, 16)}</p>
											<p class="float"><a href="${conPath}/msgSpList.do?mesFrom=${mes.mesFrom}">${mes.mesFrom }</a></p>
										</div>
									</c:if>
								</div>
								<div class="gray">
									<c:if test="${mes.mesChk eq 1 }">
										<div class="mes_detail" id="${mes.mesNum }">
											<p>${mes.mesTitle }</p>
											<p>${mes.mesContent }</p>
										</div>
										<div class="mes_colspan">
											<p class="float">${fn:substring(mes.mesDate, 0, 16)}</p>
											<p class="float"><a href="${conPath}/msgSpList.do?mesFrom=${mes.mesFrom}">${mes.mesFrom }</a></p>
										</div>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>

			<!-- 페이징 -->
			<div id="paging">
				<c:if test="${paging.startPage>paging.blockSize }">
					<a href="${conPath }/newMsgList.do?pageNum=${paging.startPage-1 }">&lt;</a>
				</c:if>
				<c:forEach var="i" begin="${paging.startPage }"
					end="${paging.endPage }">
					<c:if test="${i==paging.currentPage }">
						<b>${i}</b>
					</c:if>
					<c:if test="${i!=paging.currentPage }">
						<a href="${conPath }/newMsgList.do?pageNum=${i}">${i}</a>
					</c:if>
				</c:forEach>
				<c:if test="${paging.endPage<paging.pageCnt }">
					<a href="${conPath }/newMsgList.do?pageNum=${paging.endPage+1}">></a>
				</c:if>
			</div>
			</div>
		</div>
		<jsp:include page="../main/footer.jsp" />
	</div>
</body>
</html>