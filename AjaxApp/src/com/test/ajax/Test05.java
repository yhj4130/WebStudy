/*=====================
   Test05.java 
=====================*/

package com.test.ajax;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test05 extends HttpServlet
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
		
		request.setCharacterEncoding("UTF-8");
		
		// 사용자가 타이핑중인 단어 수신
		String search = request.getParameter("search");
		
		//System.out.println(search);
		
		// db 연결 및 액션 처리
		// ------- where column like 'search%'; 와 같은 쿼리문 수행
		// 그에 따른 결과 수신
		
		// 위와 같이 조회한 결과를 가지고 ArrayList 활용
		ArrayList<WordDTO> list = new ArrayList<WordDTO>();
		
		if(search.equals("가"))
		{
			list.add(new WordDTO("가사"));
			list.add(new WordDTO("가위"));
			list.add(new WordDTO("가지"));
			list.add(new WordDTO("가방"));
			list.add(new WordDTO("가방끈"));
			list.add(new WordDTO("가방끈 매듭")); 
			list.add(new WordDTO("가방끈 매듭 풀기"));
			list.add(new WordDTO("가방끈 매듭 만드는 법"));
			list.add(new WordDTO("가장자리 다듬기"));
			list.add(new WordDTO("가차없이"));
		}
		else if(search.equals("가위"))
		{
			list.add(new WordDTO("가위"));
			list.add(new WordDTO("가위 손질하기"));
			list.add(new WordDTO("가위 추천"));
		}
		else if(search.equals("가방"))
		{
			list.add(new WordDTO("가방"));
			list.add(new WordDTO("가방끈"));
			list.add(new WordDTO("가방끈 매듭"));
			list.add(new WordDTO("가방끈 매듭 풀기"));
			list.add(new WordDTO("가방끈 매듭 만드는 법"));
		}
		else if(search.equals("가방끈"))
		{
			list.add(new WordDTO("가방끈"));
			list.add(new WordDTO("가방끈 매듭"));
			list.add(new WordDTO("가방끈 매듭 풀기"));
			list.add(new WordDTO("가방끈 매듭 만드는 법"));
		}
		
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("Test05OK.jsp");
		dispatcher.forward(request, response);
	}
	
}
