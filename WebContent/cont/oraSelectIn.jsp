<%@page import="och10.Emp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="../DBError.jsp"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ArrayList<Integer> al = new ArrayList<Integer>();
	// Context --> PGM과 환경사이에 자료 교환
	Context ctx = new InitialContext();
	// Context에서 jdbc/OracleDB 이름을 찾음, DataSource Getter
	DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
	//ds.getConnection() 이용 DB연결
	Connection conn = ds.getConnection();
	//DML 작업
	String sql = "select empno,ename from emp";
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	while(rs.next()){
		al.add(rs.getInt(1));
	}
		request.setAttribute("al", al);
		rs.close(); stmt.close(); conn.close();

%>
<h2>보고싶은 사원을 선택하세요</h2>
<form action="oraSelect.jsp">
	<select name="empno">
		<c:forEach var="empno" items="${al }">
			<option value="${empno }">${empno }</option>
		</c:forEach>
	</select><p>
	<input type="submit" value="선택완료">
</form>
</body>
</html>