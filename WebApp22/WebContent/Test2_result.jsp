<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String str = (String)request.getAttribute("result");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test2_result.jsp</title>
</head>
<body>

<div>
	<h1>최종 결과값 수신</h1>
	<hr>
</div>

<div>
	<h2><%=str %></h2>
</div>

</body>
</html>