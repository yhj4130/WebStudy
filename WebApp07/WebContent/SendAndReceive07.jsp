<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SendAndReceive07.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<!--
	○ 데이터 송수신 실습 07
	   - 달력을 출력하는 JSP 페이지를 구성한다.
	   - 년도와 월을 입력받아 화면에 출력해주는 형태의 페이지로 구성한다.
	   - 단, submit 버튼 없이 이벤트 처리를 한다.
	   - 전송한 내용을 수신해서 출력해주는 형태의 페이지로 구성한다.
	   - 년도 구성은 현재 년도 기준 이전 10년, 이후 10년으로 구성한다.
	   - 월은 1월 부터 12월 까지로 구성한다.
	   
	   [  2019 ▼ ]년 [  5 ▼ ]월
	   
	   -------------------------
	   -------------------------
	   
	   - 년도 select box 나 월 select box 의 내용 변화시
	     해당 년 월의 달력을 출력해주는 형태의 페이지로 구성한다.
	     
	   - 사용자 최초 요청 주소는
	     『http://localhost:8090/WebApp07/SendAndReceive07.jsp』로 한다.
	     
	 ○ SendAndReceive07.jsp
-->

<div>
	<h1>데이터 송수신 실습 07</h1>
	<hr>
</div>

<div>
	<form method="post">
		<table id="tableNode">
			<tr>
				<td>
					<select name="year" id="year">
						<%-- <%
							for(int i=0; i<20; i++)
							{
								yearStr += "<option>" + (year-10)+i +"</option>";
							}
						%>
						<%=yearStr %> --%>
					</select> 년
				</td>
			</tr>
		</table>
	</form>	
</div>

</body>
</html>