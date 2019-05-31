/*=====================
   Test03_hj.java 
=====================*/

package com.test.ajax;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test03_hj extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		doGetPost(request, response);
	}
	
	// 사용자 정의 메소드
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		// 서블릿 관련 코딩
		
		String id = request.getParameter("id");
		
		String[] idCheck = {"superman", "batman", "admin"};
		
		String result = "";
		
		int num = 0;
		
		for (int i = 0; i < idCheck.length; i++)
		{
			if(id.equals(idCheck[i]))
				num = 1;
		}
		
		if(num>0)
			result = "아이디가 중복되었습니다.";
		else
			result = "아이디가 중복되지 않았습니다.";
		
		request.setAttribute("result", result);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test03OK.jsp");
		dispatcher.forward(request, response);
	}
	
}
