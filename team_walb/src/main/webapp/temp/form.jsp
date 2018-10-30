<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/content.css" rel="stylesheet">
</head>
<body>
	<form action="${conPath }/Insert.do" method="post">
		<table>
			<tr>
				<th>属性</th><td><input type="text" name="corp" required="required"></td>
			</tr>
			<tr>
				<th>機種</th><td><input type="text" name="kind" required="required"></td>
			</tr>
			<tr>
				<th>データ容量</th><td><input type="number" name="data" required="required"></td>
			</tr>
			<tr>
				<th>発売日</th><td><input type="date" name="tTime" required="required"></td>
			</tr>
			<tr>
				<th>OSバージョン</th><td><input type="text" name="osVersion" required="required"></td>
			</tr>
			<tr>
				<th>色</th><td><input type="text" name="color" required="required"></td>
			</tr>
			<tr>
				<th>販売価格</th><td><input type="number" name="price" required="required"></td>
			</tr>
			<tr>
				<td><input type="submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>