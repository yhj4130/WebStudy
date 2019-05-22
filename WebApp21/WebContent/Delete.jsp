<%@page import="com.test.BoardDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.util.DBConn"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	// Delete.jsp
	
	int num = Integer.parseInt(request.getParameter("num"));
	
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	dao.deleteData(num);
	
	response.sendRedirect("List.jsp");
%>