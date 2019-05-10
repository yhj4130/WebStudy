<%@ page contentType="text/html; charset=UTF-8" %>

<%
	request.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");				//-- 텍스트박스 단일값 수신
	String gender = request.getParameter("gender");			//-- 라디오버튼 단일값 수신
	String major = request.getParameter("major");			//-- 선택상자 단일값 수신
	String[] hobby = request.getParameterValues("hobby");	
	//-- 다중 선택이 가능한 선택상자 일 경우 배열 형태로 수신
	
	String genderStr = "";
	if(gender.equals("M"))
		genderStr = "남자";
	else if(gender.equals("W"))
		genderStr = "여자";
	else
		genderStr = "확인불가";
	
	String hobbyStr = "";
	if (hobby != null)
	{
		for (String item : hobby)
			hobbyStr += " [" + item + "]";
	}
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
		<p>성별 : <%=gender %>(<%=genderStr %>)</p>
		<p>전공 : <%=major %></p>
		<p>취미 : <%=hobbyStr %></p>
	</div>
</div>

</body>
</html>