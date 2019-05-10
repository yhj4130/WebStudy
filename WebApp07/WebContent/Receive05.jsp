<%@ page contentType="text/html; charset=UTF-8" %>

<%
	int dan = Integer.parseInt(request.getParameter("dan"));

	String result = "";

	for (int i=1; i<10; i++)
	{
		result += dan + " * " + i + " = " + (dan*i) + "<br>";
		//result += String.format("%d * %d = %d<br>", dan, i, (dan*i));
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive05.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 05</h1>
	<hr>
</div>

<div>
	<h2>구구단 출력</h2>
	<div>
	<%=result %>
	</div>	
</div>

</body>
</html>