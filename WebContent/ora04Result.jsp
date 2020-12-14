<%@page import="och10.Dept"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="DBError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Expression 부서정보</h1>
<%
	request.setCharacterEncoding("UTF-8");
	Dept dept = (Dept)request.getAttribute("dept");
%>
부서코드 : <%=dept.getDeptno() %><p>
부서명 : <%=dept.getDname() %><p>
근무지 : <%=dept.getLoc() %><p>
<h1>EL 표기법 부서정보</h1>
부서코드 : ${dept.getDeptno() }<p> <!-- dept.deptno도 가능 -->
부서명 : ${dept.getDname() }<p>
근무지 : ${dept.getLoc() }<p>
</body>
</html>