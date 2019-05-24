
<%@page import="com.test.ScoreDAO"%>
<%@page import="com.test.ScoreDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	int kor = Integer.parseInt(request.getParameter("kor"));
	int eng = Integer.parseInt(request.getParameter("eng"));
	int mat = Integer.parseInt(request.getParameter("mat"));
	
	ScoreDTO dto = null;
	ScoreDAO dao = null;
	try{
		dao = new ScoreDAO();
		dto= new ScoreDTO();
		dto.setName(name);
		dto.setKor(kor);
		dto.setMat(mat);
		dto.setEng(eng);
		
		dao.add(dto);		
		
	}catch (Exception e) {
		
		System.out.println(e.toString());
		
	}finally
	{
		try
		{
			dao.close();
		} catch (Exception e)
		{
			System.out.println(e.toString());
		}
	}
	response.sendRedirect("MemberSelect.jsp");

%>