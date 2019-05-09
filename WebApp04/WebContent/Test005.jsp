<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test005.jsp</title>

<link rel="stylesheet" type="text/css" href="css/main.css">

</head>
<body>

<div>
	<h1>JSP 관찰하기</h1>
	<hr>
</div>

<div>
	<h2>HttpServlet 관련 실습</h2>
	
	<!-- ※ form 태크의 action 속성은 데이터 전송 및 페이지 요청을 
			해야하는 대상 페이지를 등록하는 기능 수행
			(생략 시 데이터 전송 및 요청 페이지는 자기 자신) -->
	<!-- ※ form 태그의 method 속성에는 get 또는 post 를 등록
			(생략 시 get 방식으로 처리)
			이는 데이터 전송 및 페이지 요청 방식에 해당한다. -->
	<form action="/WebApp04/login" method="get">
		<table>
			<tr>
				<th>아이디</th>
				<td>
					<input type="text" name="userId" size="10" maxlength="10">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<input type="password" name="userPwd" size="10">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" class="btn" style="width: 90px;">
					<input type="reset" value="다시입력" class="btn" style="width: 90px;">
			</tr>
		</table>
	</form>
</div>

</body>
</html>