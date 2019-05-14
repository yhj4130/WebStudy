<%@ page contentType="text/html; charset=UTF-8"%>
<%
	// Redirect12.jsp
	
	// 데이터 수신
	int num1 = Integer.parseInt(request.getParameter("num1"));
	int num2 = Integer.parseInt(request.getParameter("num2"));
	
	String op = request.getParameter("calResult");
	
	// 연산 처리
	String str = "";
	
	if(op.equals("1"))
		str += String.format("%d", (num1+num2));
	else if(op.equals("2"))
		str = String.format("%d", (num1-num2));
	else if(op.equals("3"))
		str = String.format("%d", (num1*num2));
	else if(op.equals("4"))
		str = String.format("%.1f", (num1/(double)num2));
	
	// check !!
	// 결과 데이터 재전송 → sendRedirect() 메소드 사용
	// ※ response 객체의 주요 메소드 중 하나인
	//    『sendRedirect(String location)』
	//	  : 지정된 URL(location)로 요청을 재전송한다. 
	response.sendRedirect("Receive12.jsp?num1="+num1+"&num2="+num2+"&op="+op+"&str="+str);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
	<h1>데이터 송수신 실습 12</h1>
	<hr>
</div>

</body>
</html>