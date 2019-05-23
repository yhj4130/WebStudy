<%@page import="com.test.ScoreDTO"%>
<%@page import="com.test.ScoreDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String userName = request.getParameter("userName");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	int tot = kor+eng+mat;
	
	double avg = tot/3.0;
	
	ScoreDAO dao = null;
	
	try {
		dao = new ScoreDAO();
		
		ScoreDTO dto = new ScoreDTO();
		
		dto.setName(userName);
		dto.setKor(kor);
		dto.setEng(eng);
		dto.setMat(mat);
		dto.setTot(tot);
		dto.setAvg(avg);
		
		dao.add(dto);
		
	} catch (Exception e) {
		System.out.println(e.toString());
	}
	finally
	{
		try {
			dao.close();
		} catch (Exception e) {
			System.out.println(e.toString());
		}
	}
	
	response.sendRedirect("ScoreList.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ScoreInsert.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>

<div>
	<h1>큰주제</h1>
	<hr>
</div>

<div>
	<p>작은주제</p>
	<form></form>
</div>

</body>
</html>