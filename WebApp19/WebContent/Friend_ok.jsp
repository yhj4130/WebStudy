<%@ page contentType="text/html; charset=UTF-8" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="ob" class="com.test.FriendDTO"></jsp:useBean>
<jsp:setProperty property="*" name="ob" />

<!-- 반복문 필요(다중 선택으로 넘어온 결과값 출력) -->

<%
	String type = "";

	/* me
	if(ob.getIdelType()==null)
	{
		type = "(선택안함)";
	}
	else
	{
		for(int i=0; i<ob.getIdelType().length; i++)
		{
		  type += ob.getIdelType()[i] + "\n";
		}
		
		type.replaceAll("\n", "<br>");
	} 
	*/
	
	if(ob.getIdelType() != null)
	{
		for(String temp : ob.getIdelType())
			type += temp + " ";
	} 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Friend_ok.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>등록 수신 결과 확인</h1>
	<hr>
</div>

<div>
	<h2>이름 : <%=ob.getName() %></h2>
	<h2>나이 : <%=ob.getAge() %></h2>
	<h2>성별 : <%=ob.getGender() %></h2>
	<h2>이상형 : <%=type %></h2>
</div>

</body>
</html>