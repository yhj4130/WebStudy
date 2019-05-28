<%@ page contentType="text/html; charset=UTF-8" %>

<%
	// 데이터 수신
	
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	/* int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	int total = kor + eng + mat;
	
	double avg = total/3.0; */
	
	int kor = 0;
	int eng = 0;
	int mat = 0;
	int tot = 0;
	double avg = 0.0;
	
	try
	{
		kor = Integer.parseInt(request.getParameter("kor"));
		eng = Integer.parseInt(request.getParameter("eng"));
		mat = Integer.parseInt(request.getParameter("mat"));
		
		tot = kor + eng + mat;
		
		avg = tot/3.0;
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	span {color: blue; font-weight: bold; font-size: 15pt;}
	/* .red {color: red;}
	.blue {color: blue;} */
</style>
<meta charset="UTF-8">
<title>Receive02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 02</h1>
</div>

<div>
	<h2>전송 확인</h2>
	<span><%=userName %></span>님, 
	성적 처리가 완료되었습니다.<br>
	회원님의 점수는 국어:<span><%=kor %></span>점,
	영어:<span><%=eng %></span>점, 
	수학:<span><%=mat %></span>점 입니다.<br>
	총점은 <span><%=tot %></span>점, 평균은 <span><%=String.format("%.1f", avg) %></span>점 입니다.
</div>

</body>
</html>