<%@ page contentType="text/html; charset=UTF-8" %>

<%
	// 데이터 수신
	String su1Str = request.getParameter("su1");
	String su2Str = request.getParameter("su2");
	
	int su1 = Integer.parseInt(su1Str);
	int su2 = Integer.parseInt(su2Str);
	
	int num = 1;
	String result ="";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Table_ok.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>JSP 데이터 송수신 실습</h1>
	<hr>
	<p>Table.jsp → Table_ok.jsp ●</p>
</div>

<div>
	<table border="1" style="width: 400px; height: 400px;">
	<% 
		for (int i=0; i<su2; i++)
		{
			result += "<tr>";
			
			for (int j=0; j<su1; j++)
			{
				result += "<td>" + num + "</td>";
				num++;
			}
			
			result += "</tr>";
		}
	%>
	
	<%=result %>
	
	<%-- <%
	for (int i=0; i<su2; i++)
	{
	%>
		<tr>
			<%
				for (int j=0; j<su1; j++)
				{
			%>
				<td><%=++num %></td>
			<%
				}
			%>
		</tr>
	<%
	}
	%> --%>
	</table>
</div>

</body>
</html>