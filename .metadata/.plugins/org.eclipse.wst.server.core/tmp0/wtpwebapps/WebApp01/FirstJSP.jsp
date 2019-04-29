<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	String str = String.format("%tF", Calendar.getInstance());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FirstJSP.jsp</title>
</head>
<body>
윤희진
<%=str %>
</body>
</html>