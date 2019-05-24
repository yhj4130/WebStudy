<%@page import="java.util.ArrayList"%>
<%@page import="com.test.core.MemberDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String name[] = request.getParameterValues("name");
	String tel[] = request.getParameterValues("tel");
	String addr[] = request.getParameterValues("addr");
	
	List<MemberDTO> lists = new ArrayList<MemberDTO>();
	
	MemberDTO dto;
	
	for(int i=0; i<name.length; i++)
	{
		dto = new MemberDTO(name[i], tel[i], addr[i]);
		lists.add(dto);
	}
	
	/* 
	for (int i=0; i<5; i++)
	{
		MemberDTO ob = new MemberDTO(request.getParameter("name"+i), request.getParameter("tel"+i), request.getParameter("addr"+i));
		lists.add(ob);
	}
    */
    
	request.setAttribute("lists", lists);
%>

<jsp:forward page="MemberList.jsp"></jsp:forward>