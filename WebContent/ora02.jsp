<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="DBError.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String deptno = request.getParameter("deptno");
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String sql = "select * from dept where deptno ="+deptno;
	Class.forName(driver);
	Connection conn = DriverManager.getConnection(url,"scott","tiger");
	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(sql); //select 일때
	// int askf = stmt.executeUpdate(sql); //insert,upadte,delete 일때
	// 존재하냐 
	if(rs.next()){
		String dname = rs.getString("dname"); //rs.getString(2);
		String loc   = rs.getString(3);
		out.println("부서코드 : "+deptno+"<p>");
		out.println("부서명 : "+dname+"<p>");
		out.println("근무지 : "+loc+"<p>");
	}else{
		out.println("없는 부서입니다.");
	}
	rs.close();
	stmt.close();
	conn.close();
%>
</body>
</html>