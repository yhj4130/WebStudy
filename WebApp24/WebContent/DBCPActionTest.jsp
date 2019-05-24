<%@page import="java.sql.Connection"%>
<%@page import="com.util.svt.DBCPConn"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	Connection conn = DBCPConn.getConnection();

	String result = "";
	
	if(conn != null)
		result = "데이터베이스 연결 성공";
	else
		result = "데이터베이스 연결 실패";
	
	DBCPConn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DBCPActionTest.jsp</title>
</head>	
<body>

<div>
	<h1>DBCP를 통한 데이터베이스 접속 실습</h1>
	<hr>
</div>

<div>	
	<h2><%=result %></h2>
</div>

</body>
</html>