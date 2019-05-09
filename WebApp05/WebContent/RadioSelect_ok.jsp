<%@ page contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String major = request.getParameter("major");
	String hobby = request.getParameter("hobby");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>RadioSelect_ok.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>RadioSelect.jsp → RadioSelect_ok.jsp ●</p>
</div>

<div>
	<h2>radio, select 데이터 전송</h2>
	
	<div>
		<h3>수신한 데이터</h3>
		<p>이름 : <%=name %></p>
		<p>성별 : <%=gender %></p>
		<p>전공 : <%=major %></p>
		<p>취미 : <%=hobby %></p>
	</div>
</div>

</body>
</html>