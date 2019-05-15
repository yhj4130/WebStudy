<%@page import="com.test.MemberDTO"%>
<%@page import="com.test.MemberDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	// MemberInsert,jsp
	//-- 데이터 입력 처리 페이지
	request.setCharacterEncoding("UTF-8");

	String userName = request.getParameter("userName");
	String userTel = request.getParameter("userTel");
	
	MemberDAO dao = new MemberDAO();
	MemberDTO dto = new MemberDTO();
	
	dto.setName(userName);
	dto.setTel(userTel);
	
	dao.add(dto);
	
	dao.close();
	
	response.sendRedirect("MemberList.jsp");
	
	/* 
	MemberDAO dao = null;
	
	try {
		dao = new MemberDAO();
		
		// MemberDTO 구성
		MemberDTO dto = new MemberDTO();
		dto.setName(userName);
		dto.setTel(userTel);
		
		// dao 의 add() 메소드 호출 → insert 쿼리문 수행
		dao.add(dto);
		
	} catch(Exception e)
	{
		System.out.println(e.toString());
	}
	finally
	{
		try{
			dao.close();
			
		} catch(Exception e)
		{
			System.out.println(e.toString());
		}
	}
	 */
%>