<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userBirth = request.getParameter("userBirth");
	
	session.setAttribute("userName", userName);
	session.setAttribute("userBirth", userBirth);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestSession02.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<script type="text/javascript">

	function sendIt()
	{
		var f = document.forms[0];
		
		if(!f.userId.value)
		{
			alert("아이디를 입력하세요.");
			f.userId.focus();
			return;
		}
		
		if(!f.userPwd.value)
		{
			alert("패스워드를 입력하세요.");
			f.userPwd.focus();
			return;
		}
		
		f.submit();
	}

</script>

</head>
<body>

<div>
	<h1>아이디와 패스워드(TestSession02.jsp)</h1>
	<hr>
</div>

<div>
	<form action="TestSession03.jsp" method="post">
		<!--  
			<input type="hidden" name="userName" value="<%=userName %>">
			<input type="hidden" name="userBirth" value="<%=userBirth %>">
		-->
		<table class="table">
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userId" size="10">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="text" name="userPwd" size="10">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="button" onclick="sendIt()" class="btn" style="width: 400px; height: 40px; font-size: 17pt;">다음페이지로 전송</button>
				</td>
			</tr>
		</table>
	</form>
</div>

</body>
</html>