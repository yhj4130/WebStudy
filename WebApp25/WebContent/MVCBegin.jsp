<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVCBegin.jsp</title>
</head>
<body>

<div>
	<h1>MVC 실습</h1>
	<hr>
</div>

<div>
	<h2>${message}</h2>
</div>

</body>
</html>