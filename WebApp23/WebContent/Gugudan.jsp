<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Gugudan.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/main.css">
</head>
<body>
<!-- 실습 문제 
     구구단 출력
     조건 : JSTL Core 이용
     ----------------------
     원하는 단 입력 [ 3 ]
     
     <결과 확인>
     
     3 * 1 = 3
     	:
-->

<div>
	<h1>실습 문제(구구단)</h1>
	<hr>
</div>
</head>
<body>

<div>
	<form method="post">
		원하는 단 입력　:　<input type="text" name="dan"><br><br>
		<input type="submit" class="btn" value="결과 확인" style="width: 200px; font-size: 16pt;">
	</form>
</div>

<div>
	<c:if test="${!empty param.dan }">
		<ul>
			<c:forEach var="num" begin="1" end="9" step="1" >
				<li>${param.dan } * ${num } = ${param.dan*num }</li>
			</c:forEach>
		</ul>
	</c:if>
</div>



</body>
</html>