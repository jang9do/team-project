<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>워라밸</title>
<link href="${conPath }/srcimg/headIcon.png" type="image/png" rel="icon">
<link rel="stylesheet" type="text/css" href="css/animate.css" />
<link rel="stylesheet" type="text/css" href="css/tabstyle.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.css">
<link href="${conPath }/css/main.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/jquery.multipurpose_tabcontent.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/rateYo/2.3.2/jquery.rateyo.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {

            $(".first_tab").champ();

            $(".accordion_example").champ({
                plugin_type: "accordion",
                side: "left",
                active_tab: "3",
                controllers: "true"
            });

            $(".second_tab").champ({
                plugin_type: "tab",
                side: "right",
                active_tab: "1",
                controllers: "false"
            });

            $(".third_tab").champ({
                plugin_type: "tab",
                side: "",
                active_tab: "4",
                controllers: "true",
                ajax: "true",
                show_ajax_content_in_tab: "4",
                content_path: "html.txt"
            });
            $(".multipleTab").champ({
                //plugin_type :  "accordion",
                multiple_tabs: "true"
            });

        });
        $(function () {
        	$(".rateYo").each(function(idx){
        		$(this).rateYo({
            	    rating: $('#temp'+idx).text(),
            	    starWidth:"15px",
            	    readOnly: true
            	  });
        	});

        	 
        	});
        $(document).ready(function(){
        	$('.clickHover').hover(function(){
        		$(this).css('cursor', 'pointer').css('background-color', '#e2e2e2').css('font-weight', 'bold');
        	}, function(){
        		$(this).css('cursor', 'pointer').css('background-color', '#ffffff').css('font-weight', 'normal');
        	});
        });
        function trClicked(gNum){
            location.href="${conPath}/gboardView.do?gNum="+gNum+'&pageNum=${paging.currentPage}';
         }
    </script>
</head>
<body>
	<c:if test="${not empty bunWriteFormResult }"><script>alert('${bunWriteFormResult}');</script></c:if>
	<c:if test="${not empty member and not empty loginMsg }">
		<script>
			alert('${loginMsg}');
		</script>
	</c:if>
	<c:if test="${empty member and not empty loginMsg }">
		<script>
			alert('${loginMsg}');
			location.href="${conPath}/loginView.do?loginMsg="+loginMsg;
		</script>
	</c:if>
	<c:if test="${not empty logoutMsg }">
		<script>
			alert('${logoutMsg}');
		</script>
	</c:if>


	<div id="wrap">
	<jsp:include page="../main/header.jsp"/>
	
	
		<div id="content">
			<div id="fakeDiv"></div>
			<div id="mainLeft">
				<h1>이달의 인기 동아리 <span>&#35;1</span></h1>
				<img src="${conPath }/srcimg/line1px.jpg" id="lineImg" alt="line">
				<div id="topCircle">
					<div id="topCircleImg"><!-- ${topCircle } -->
						<img src="${conPath }/circleImg/${topCircle.cPhoto }">
					</div>
					<div id="topCircleText">
						<div id="tct_up">
							<p style="color: white">${topCircle.cName } 동호회</p>
						</div>
						<div id="tct_down">
							<p style="color: white">${topCircle.cContent }</p>
							<p style="color: white">정기활동 : ${topCircle.cTime }</p>
						</div>
					</div>
					<a href="#" id="topCircleGo"></a>
				</div>
			</div>
			
			
			<div id="mainRight">
<!-- ======================== TAB ============================== -->			
			
        <div class="tab_wrapper first_tab" id="tabDiv">
            <ul class="tab_list">
                <li class="active">실시간 번개모임</li>
                <li>공지사항</li>
                <li>베스트 후기</li>

            </ul>

            <div class="content_wrapper">
<!-- ============== tabs-1: 번개모임 ================= -->
                <div class="tab_content active" id="tab1">
                    <!-- <h3>번개모임</h3> -->
                    <div id="lineDiv">
                    <c:if test="${empty bungae3list }">
                    	<p id="noB">"현재 진행중인 번개 모임이 없습니다."</p>
                    </c:if>
                    <c:forEach var="bun" items="${bungae3list }">
					<div class="cDiv">
						<div class="cPhoto">
								<a href="${conPath }/viewBboard.do?bNum=${bun.bNum}"><img src="${conPath }/circleImg/${bun.cPhoto}" alt="${bun.cPhoto}"></a> 
						</div>
						<div class="aContent">
							<div class="aContentUp">
								<a href="${conPath }/viewBboard.do?bNum=${bun.bNum}">
									<p class="fontBold">${bun.bTitle }</p>
									<p class="font10">번개 마감시간: ${bun.bEnd }시</p>
								</a>
								
							</div>
							<div class="aContentDown">
								<a href="${conPath }/viewBboard.do?bNum=${bun.bNum}">
									<p class="font10">번개 생성 인원: ${bun.bPeople } 명</p>
									<p class="font10">현재 신청 인원: ${bun.bCount } 명</p>
									<p>${bun.cName } 동호회</p> 
								</a>
							</div>
						</div>
					</div>
					</c:forEach>
					</div>
                </div>

 <!-- ============== tabs-2: 공지사항 (notice10) ================= -->
                <div class="tab_content" id="tab2">
                    <!-- <h3>공지사항 (notice10)</h3> -->
                    <table class="notice10">
						<tr>
							<th id="nno">No.</th>
							<th id="ntitle">TITLE</th>
							<th id="ndate">DATE</th>
						</tr>
					<c:forEach var="gb" items="${notice10 }">
						<tr onclick="(trClicked('${gb.gNum }'))" class="clickHover">
							<td class="nRight">${gb.gNum }</td>
							<td>${gb.gTitle }</td>
							<td><fmt:formatDate value="${gb.gDate }" pattern="yyyy.MM.dd" /></td>
							
						</tr>
					</c:forEach>
					</table>
                </div>

<!-- ============== tabs-2: Best Review ================= -->
                <div class="tab_content" id="tab3">
                    <!-- <h3>Best Review</h3> -->
                    <c:set var="i" value="0"/>
                    <c:forEach var="br" items="${bestReviews }">
						<div class="cDiv">
							<div class="cPhoto">
								<%-- <a href="#?aNum=+${br.aNum }"> --%>
									<img src="${conPath }/circleImg/${br.cPhoto}">
								<!-- </a> -->
							</div>
								<%-- <a href="#?aNum=+${br.aNum }"> --%>
							<div class="aContent">
									<div class="aContentUp">
										<p class="fontBold">${br.aTitle }</p>
										<p class="font10"><fmt:formatDate value="${br.bDate }" pattern="yyyy.MM.dd" /></p>
										
									</div>
									<div class="aContentDown">
										<p>&nbsp;</p>
										<p class="font10">
											<span class="rateScore"><span id="temp${i }" >${br.aScore }</span>점</span>
											<span class="rateYo" style="display:inline-block"></span>
										</p>
										<p class="font10">${br.cName } 동호회</p>
									</div>
							</div>
								<!-- </a> -->
						</div>
						<c:set var="i" value="${i+1 }"/>
					</c:forEach>
                </div>
            </div>

        </div>
<!-- ======================== TAB 끝 ============================== -->
			</div>
		</div>
	<jsp:include page="../main/footer.jsp"/>
	</div>
</body>
</html>