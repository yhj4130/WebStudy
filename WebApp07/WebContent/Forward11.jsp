<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String su1Str = request.getParameter("num1");
	String su2Str = request.getParameter("num2");
	String calResult = request.getParameter("calResult");
	
	int num1 = Integer.parseInt(su1Str);
	int num2 = Integer.parseInt(su2Str);
		
	String result="";
	
	if(calResult.equals("1"))
		result = String.format("%d + %d = %d", num1, num2, num1+num2);
	else if(calResult.equals("2"))
		result = String.format("%d - %d = %d", num1, num2, num1-num2);
	else if(calResult.equals("3"))
		result = String.format("%d * %d = %d", num1, num2, num1*num2);
	else if(calResult.equals("4"))
		result = String.format("%d / %d = %.1f", num1, num2, (num1/(double)num2));

	request.setAttribute("result", result);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Forward11_T.jsp</title>
</head>
<body>
<jsp:forward page="Receive11.jsp"></jsp:forward>

</body>
</html>