<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	StringBuffer str = new StringBuffer();
	ScoreDAO dao = null;

	String memberCount = "<span id='memberCount'>전체 인원 수 : ";

	try {
		dao = new ScoreDAO();
		memberCount += dao.count() + "명</span>";
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>국어</th><th>영어</th><th>수학</th><th>총점</th><th>평균</th></tr>");

		for (ScoreDTO member : dao.lists()) {
			str.append("<tr>");
			str.append("<td>" + member.getSID() + "</td>");
			str.append("<td>" + member.getName() + "</td>");
			str.append("<td>" + member.getKor() + "</td>");
			str.append("<td>" + member.getEng() + "</td>");
			str.append("<td>" + member.getMat() + "</td>");
			str.append("<td>" + member.getTot() + "</td>");
			str.append("<td>" + member.getAvg() + "</td>");
			str.append("</tr>");

		}

		str.append("</table>");
	} catch (Exception e) {
		System.out.println(e.toString());
	} finally {
		try {
			dao.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/class" href="css/main.css">
<title>ScoreList</title>
<style type="text/css">
.error {
	color: red;
	display: none;
}
</style>

<script type="text/javascript">
	function check()
	{
		var name = document.getElementById("name");
		var kor = document.getElementById("kor");
		var eng = document.getElementById("eng");
		var mat = document.getElementById("mat");
		var msg1 = document.getElementById("msg1");
		var msg2 = document.getElementById("msg2");
		var msg3 = document.getElementById("msg3");
		var msg4 = document.getElementById("msg4");
		
		msg1.style.display="none";
		msg2.style.display="none";
		msg3.style.display="none";
		msg4.style.display="none";
		

		if (name.value == "")
		{
			msg1.style.display = "inline";
			return false;
		}
		if (kor.value == "")
		{
			msg2.style.display = "inline";
			return false;
		}
		if (eng.value == "")
		{
			msg3.style.display = "inline";
			return false;
		}
		if (mat.value == "")
		{
			msg4.style.display = "inline";
			return false;
		}

		return true;
	}
</script>
</head>
<body>
	<div>
		<h1>학생 성적 조회 프로그램</h1>
		<hr>
	</div>
	<div>
		<p></p>
		<form action="ScoreInsert.jsp " method="post"
			onsubmit="return check()">
			이름 : <input type="text" id="name" name="name"> <span
				class="error" id="msg1" id="msg1">필수로 입력해야 합니다.</span><br>
			국어점수 : <input type="text" id="kor" name="kor"> <span
				class="error" id="msg2" id="msg1">필수로 입력해야 합니다.</span><br>
			영어점수 : <input type="text" id="eng" name="eng"> <span
				class="error" id="msg3" id="msg1">필수로 입력해야 합니다.</span><br>
			수학점수 : <input type="text" id="mat" name="mat"> <span
				class="error" id="msg4" id="msg1">필수로 입력해야 합니다.</span><br>
			<button type="submit" class="btn">입력</button>
		</form>
	</div>
	<div>
	<!-- 인원수 -->
			<%=memberCount%>
			<!-- 번호 이름 전화번호 -->
			<%=str%>
	
	</div>

</body>
</html>