<%@ page contentType="text/html; charset=UTF-8" %>

<%
	//request.setCharacterEncoding("UTF-8");

	String danStr = request.getParameter("dan");
	
	int dan = Integer.parseInt(danStr);
	
	/* 
	String result = "";
	
	for (int i=1; i<10; i++)
	{
		result += dan + " * " + i + " = " + dan*i + "\n";
	}
	
	result = result.replaceAll("\n", "<br>");
	 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan_ok.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>Gugudan.jsp → Gugudan_ok.jsp ●</p>
</div>

<div>
	<h2>구구단 출력</h2>
	<%-- <%=result %> --%>
</div>

<%-- 
<% 
	for (int i=1; i<=9; i++)
	{%>
		<%=dan %> * <%=i %> = <%=(dan*i) %><br>	
	<%}
%>
--%>
 
<!-- html 주석문 -->
<%-- jsp 주석문 --%>	<!-- 페이지 소스에는 출력되지 않음 -->

<%
	for (int i=1; i<9; i++)
	{
		out.print(dan + " * " + i + " = " + (dan*i) + "<br>");
	}
%>

</body>
</html>