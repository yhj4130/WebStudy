<%@ page contentType="text/html; charset=UTF-8" %>
<%-- 
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String tel = request.getParameter("tel");
	String gender = request.getParameter("gender");
	String city = request.getParameter("city");
	String[] subject = request.getParameterValues("subject");
	
	String sub = "";
	
	for(int i=0; i<subject.length; i++)
	{
		sub += " [" + subject[i] + "] ";
	}
%>
 --%>
 
<%
	// 데이터 수신 (Send04.html → Receive04.jsp)
	request.setCharacterEncoding("UTF-8");

	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	String userGender = request.getParameter("userGender");
	String userCity = request.getParameter("userCity");
	
	// check !!
	String[] userSubject = request.getParameterValues("userSubject");
	
	String subjectStr = "";
	
	if(userSubject != null)
	{
		for (int i=0; i<userSubject.length; i++)
		{
			subjectStr += " [" + userSubject[i].toString() + "]";
		}
	}
	
	// ※ 추후에는 수신된 데이터를 쿼리문을 통해 DB에 입력하는
	//    과정 등이 포함될 것임을 염두하며 작업을 진행할 수 있도록 하자.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Receive04.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>데이터 송수신 실습 04</h1>
	<hr>
</div>

<%-- 
<div>
	<h2>가입 승인 내역</h2>
	<p>아이디 : <%=id %></p>
	<p>패스워드 : <%=pwd %></p>
	<p>이름 : <%=name %></p>
	<p>전화번호 : <%=tel %></p>
	
	<p>성별 : <%=gender %></p>
	<p>지역 : <%=city %></p>
	<p>수강 과목 : <%=sub %></p>
</div>
 --%>
 
<div>
	<h2>가입 승인 내역</h2>
	<p>아이디 : <%=userId %></p>
	<p>패스워드 : <%=userPwd %></p>
	<p>이름 : <%=userName %></p>
	<p>전화번호 : <%=userTel %></p>
	
	<p>성별 : <%=userGender %></p>
	<p>지역 : <%=userCity %></p>
	<p>수강 과목 : <%=subjectStr %></p>
</div>

</body>
</html>