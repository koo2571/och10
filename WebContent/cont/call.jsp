<%@page import="java.sql.Types"%>
<%@page import="java.sql.CallableStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/OracleDB");
		Connection conn = ds.getConnection();
		String sql = "{call Emp_Info3(?,?)}";
		//DB Procedure 호출 객체
		CallableStatement cs = conn.prepareCall(sql);
		//cs.registerOutParameter(2, Types.DOUBLE);
		cs.registerOutParameter(2, Types.INTEGER);
		cs.setInt(1, 7369);
		//Procedure 실행
		cs.execute();
		//out.println("급여 : "+cs.getDouble(2));
		out.println("급여 : "+cs.getInt(2));
		cs.close(); conn.close();
	%>
</body>
</html>