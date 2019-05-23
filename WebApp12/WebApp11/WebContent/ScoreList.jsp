<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	StringBuffer str = new StringBuffer();
	
	ScoreDAO dao = null;
	
	String scoreCount = "<span id='memberCount'>전체 학생 수 : ";
	
	try
	{
		dao = new ScoreDAO();
		
		scoreCount += dao.count() + "명</span><br>";
		
		str.append("<table class='table'>");
		str.append("<tr><th>번호</th><th>이름</th><th>국어점수</th><th>영어점수</th>"
					+"<th>수학점수</th><th>총점</th><th>평균</th></tr>");
		
		for (ScoreDTO score : dao.lists())
		{
			str.append("<tr>");
			str.append("<td class='record'>" + score.getSid() + "</td>");
			str.append("<td class='record'>" + score.getName() + "</td>");
			str.append("<td class='record'>" + score.getKor() + "</td>");
			str.append("<td class='record'>" + score.getEng() + "</td>");
			str.append("<td class='record'>" + score.getMat() + "</td>");
			str.append("<td class='record'>" + score.getTot() + "</td>");
			str.append("<td class='record'>" + score.getAvg() + "</td>");
			str.append("</tr>");
		}
		
		str.append("</table>");
		
	} catch (Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try {
			dao.close();
		} catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style type="text/css">
	th { background-color: gray;}
	#numTitle { width: 50px; }
	#nameTitle { width: 100px; }
	#telTitle { width: 160px; }
	.record { text-align: center; }
	input { width: 200px; border-radius: 6px; }
	button { width: 200px; height: 50px; font-family: 맑은고딕; font-weight: bold; }
	.errMsg { font-size: small; color: red; display: none; }	
</style>

<script type="text/javascript">
	function formCheck()
	{
		var uName = document.getElementById("userName");
		var korStr = document.getElementById("kor");
		var engStr = document.getElementById("eng");
		var matStr = document.getElementById("mat");
		var nMsg = document.getElementById("nameMsg");
		var kMsg = document.getElementById("korMsg");
		var eMsg = document.getElementById("engMsg");
		var mMsg = document.getElementById("matMsg");
		
		nMsg.style.display = "none";
		kMsg.style.display = "none";
		eMsg.style.display = "none";
		mMsg.style.display = "none";
		
		if (uName.value == "")
		{
			nMsg.style.display = "inline";
			uName.focus();
			return false;
		}
		
		if (korStr.value == "" || isNaN(korStr.value) || Number(korStr.value)<0 || Number(korStr.value)>100)
		{
			kMsg.style.display = "inline";
			korStr.focus();
			return false;
		}
		
		if (engStr.value == "" || isNaN(engStr.value) || Number(engStr.value)<0 || Number(engStr.value)>100)
		{
			eMsg.style.display = "inline";
			engStr.focus();
			return false;
		}
		
		if (matStr.value == "" || isNaN(matStr.value) || Number(matStr.value)<0 || Number(matStr.value)>100)
		{
			mMsg.style.display = "inline";
			matStr.focus();
			return false;
		}
		
		return true;
	}
</script>
</head>
<body>

<div>
	<h1>데이터베이스 연동 회원 관리 실습</h1>
	<hr>
</div>

<div>
	<p>DAO, DTO 개념 적용</p>
	<form action="ScoreInsert.jsp" method="post" onsubmit="return formCheck()">
		<table>
			<tr>
				<th>이름(*)</th>
				<td>
					<input type="text" id="userName" name="userName">
					<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
				</td>
			</tr>
			<tr>
				<th>국어점수</th>
				<td>
					<input type="text" id="kor" name="kor">
					<span class="errMsg" id="korMsg">0 ~ 100 사이의 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>영어점수</th>
				<td>
					<input type="text" id="eng" name="eng">
					<span class="errMsg" id="engMsg">0 ~ 100 사이의 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<th>수학점수</th>
				<td>
					<input type="text" id="mat" name="mat">
					<span class="errMsg" id="matMsg">0 ~ 100 사이의 점수를 입력하세요.</span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit" id="btnAdd" class="btn">성적 추가</button>
				</td>
			</tr>
		</table>
	</form>
	
	<br><br>
	
	<div>
		<%=scoreCount %>
		<%=str %>
	</div>
</div>

</body>
</html>