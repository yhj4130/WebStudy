<%@ page contentType="text/html; charset=UTF-8" %>
<%
	// TextSession01_ok.jsp
	
	String userId = request.getParameter("userId");
	String userPwd = request.getParameter("userPwd");
	
	// dao 활용 → 로그인 관련 테이블의 데이터와 비교 → 로그인 액션 처리
	
	String memberId = "superman";
	String memberPwd = "123456";
	
	if (userId.equals(memberId) && userPwd.equals(memberPwd))
	{
		// session 에 키, 값 저장
		session.setAttribute("userId", "superman");
		
		// 클라이언트가 페이지를 다시 요청할 수 있도록 처리
		response.sendRedirect("TestSession01.jsp");
	}
%>

<h2>로그인 실패</h2><br>
<a href="TestSession01.jsp">돌아가기</a>