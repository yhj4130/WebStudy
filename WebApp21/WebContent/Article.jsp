<%@page import="java.net.URLDecoder"%>
<%@page import="com.test.BoardDTO"%>
<%@page import="com.test.BoardDAO"%>
<%@page import="com.util.DBConn"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<%
	Connection conn = DBConn.getConnection();
	BoardDAO dao = new BoardDAO(conn);
	
	// 이전 체이지(목록 페이지, List.jsp)로 부터 수신한 데이터
	String pageNum = request.getParameter("pageNum");		//-- 페이지 번호
	int num = Integer.parseInt(request.getParameter("num"));//-- 게시물 번호
	
	// 검색 관련 기능 추가 -----------------------------------
	String searchKey = request.getParameter("searchKey");
	String searchValue = request.getParameter("searchValue");
	
	if(searchKey != null)
		searchValue = URLDecoder.decode(searchValue, "UTF-8");
	else
	{
		searchKey = "subject";
		searchValue = "";
	}
	// ----------------------------------- 검색 관련 기능 추가
	
	// 조회수 증가
	dao.updateHitCount(num);
	
	// 게시물 상세 내용 가져오기
	BoardDTO dto = dao.getReadData(num);
	
	// 게시물 본문의 라인 수 확인
	int lineSu = dto.getContent().split("\n").length;
	
	// 게시물의 내용
	dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
	
	// 검색 관련 기능 추가 -------------------------------------
	String param = "";
	
	// 검색이 가능하다면
	if(searchValue != null && !searchValue.equals(""))
	{
		param = "&searchKey=" + searchKey;
		param += "&searchValue=" + searchValue;
	}
	// ------------------------------------- 검색 관련 기능 추가
	
	DBConn.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Article.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/style.css">
<link rel="stylesheet" href="<%=cp %>/css/article.css">
</head>
<body>

<div id="bbs">
	
	<div id="bbs_title">
		게 시 판 (JDBC 연동 버전)
	</div>
	
	<div id="bbsArticle">
		
		<div id="bbsArticle_header">
			[　<%=dto.getSubject() %>　]
	  	</div>
	  	
	  	<div class="bbsArticle_bottomLine">
	  		<dl>
	  			<dt>작성자</dt>
	  			<dd><%=dto.getName() %></dd>
	  			<dt>라인수</dt>
	  			<dd><%=lineSu %></dd>
	  		</dl>
	  	</div>
	  	
	  	<div class="bbsArticle_bottomLine">
	  		<dl>
	  			<dt>등록일</dt>
	  			<dd><%=dto.getCreated() %></dd>
	  			<dt>조회수</dt>
	  			<dd><%=dto.getHitCount() %></dd>
	  		</dl>
	  	</div>
	  	
	  	<div id="bbsArticle_content">
			<table style="width: 600;">
				<tr>
					<td style="padding: 10px 40px 10px 10px; vertical-align: top; height: 150;">
						<%=dto.getContent() %>
					</td>
				</tr>
			</table>
		</div>
	
		<div class="bbsArticle_bottomLine">
			이전글 : 
		</div>
		
		<div class="bbsArticle_noLine">
			다음글 : 
		</div>
	
	</div><!-- close bbsArticle -->
	
	<div class="bbsArticle_noLine" style="text-align: right">
		From : <%=dto.getIpAddr() %>
	</div>
	
	<div id="bbsArticle_footer">
	
		<div id="leftFooter">
			<input type="button" value="수정" class="btn2" onclick="javascript:location.href='<%=cp%>/Updated.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
			<input type="button" value="삭제" class="btn2" onclick="javascript:location.href='<%=cp%>/Delete.jsp?num=<%=dto.getNum()%>'">
		</div>
		<div id="rightFooter">
			<input type="button" value="리스트" class="btn2" onclick="javascript:location.href='<%=cp%>/List.jsp?pageNum=<%=pageNum%><%=param%>'">
		</div>
		
	</div><!-- close bbsArticle_footer -->
	
</div><!-- close bbs -->

</body>
</html>