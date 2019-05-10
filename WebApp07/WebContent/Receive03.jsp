<%@ page contentType="text/html; charset=UTF-8" %>
<%
	// 데이터 수신
	request.setCharacterEncoding("UTF-8");

	int s1 = Integer.parseInt(request.getParameter("s1"));
	int s2 = Integer.parseInt(request.getParameter("s2"));
	String calc = request.getParameter("calc");
	
	/* int res = 0;
	
	if(calc.equals("더하기"))
		res = s1 + s2;
	else if(calc.equals("빼기"))
		res = s1 - s2;
	else if(calc.equals("곱하기"))
		res = s1 * s2;
	else if(calc.equals("나누기"))
		res = s1 / s2; */
		
	String result = "";
	if (calc.equals("+"))
		result = String.valueOf(s1+s2);
	else if (calc.equals("-"))
		result = String.valueOf(s1-s2);
	else if (calc.equals("*"))
		result = String.valueOf(s1*s2);
	else if (calc.equals("/"))
	{
		//result = String.valueOf(s1/s2);
		//result = String.valueOf(s1/(double)s2);
		result = String.format("%.1f", s1/(double)s2);
	}
%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	span {color: blue; font-weight: bold; font-size: 15pt;}
</style>
<meta charset="UTF-8">
<title>Receive03.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 03</h1>
	<hr>
</div>

<div>
	<h2>결과 확인</h2>
	<%-- 입력하신 <%=s1 %>과 <%=s2 %>의 연산 결과는 <%=res %> 입니다. --%>
	
	입력하신 <span><%=s1 %></span>과 <span><%=s2 %></span>의 연산 결과는 <span><%=result %></span> 입니다.
</div>

</body>
</html>