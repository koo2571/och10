<%@page import="java.sql.PreparedStatement"%>
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
	request.setCharacterEncoding("utf-8");
	int deptno = Integer.parseInt(request.getParameter("deptno"));
	String dname = request.getParameter("dname");
	String loc = request.getParameter("loc");
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	//PreparedStatement 를 쓸때는 물음표!!
	String sql = "insert into dept values(?,?,?)";
	Connection conn = DriverManager.getConnection(url, "scott", "tiger");
	PreparedStatement pstmt = conn.prepareStatement(sql);
	//PreparedStatement 를 쓸때는 세팅을 해야한다!!(더 보안을 강조하기 위해서)
	pstmt.setInt(1, deptno);
	pstmt.setString(2, dname);
	pstmt.setString(3, loc);
	int result = pstmt.executeUpdate();
	if(result >0) out.println("입력 성공");
	else 		  out.println("입력 실패");
	pstmt.close();
	conn.close();
	%>
</body>
</html>