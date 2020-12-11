<%@page import="och10.Emp"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	tr:HOVER{background-color: red;}
</style>
<title>Insert title here</title>
</head>
<body>
<table width="100%" bgcolor="yellow" border="1">
<tr bgcolor="pink">
<th>사번</th><th>이름</th><th>업무</th><th>급여</th></tr>
<c:forEach var="al" items="${al }">	
<tr>
	<td>${al.empno }</td>
	<td>${al.ename }</td>
	<td>${al.job }</td>
	<td>${al.sal }</td>
</tr>
</c:forEach>
</table>
</body>
</html>