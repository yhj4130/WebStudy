<%@page import="com.test.EmpDTO"%>
<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@page import="com.test.EmpDAO"%>
<%@page import="com.test.SalDTO"%>
<%@page import="com.test.SalDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   StringBuffer str = new StringBuffer();
   SalDAO dao = new SalDAO();
   
   try
   {
      
      // 데이터베이스 연결
      dao.connection();
      
      str.append("<table class='table table-bordered'>");
      str.append("<tr>");
      str.append("<th style='width: 10%; text-align: center;'>분류</th>");
      str.append("<th style='width: 10%; text-align: center;'>최저급여</th>");
      str.append("<th style='width: 10%; text-align: center;'>최고급여</th>");
      str.append("<th style='width: 10%; text-align: center;'>등급조회</th>");
      str.append("<th style='width: 10%; text-align: center;'>등급관리</th>");
      str.append("</tr>");
      
      for(SalDTO sal : dao.lists())
      {
         str.append("<tr>");
         str.append("<td style='margin: auto; text-align: center;'>" + sal.getGrade() + "</td>");
         str.append("<td style='margin: auto; text-align: center;'>" + sal.getLosal() + "</td>");
         str.append("<td style='margin: auto; text-align: center;'>" + sal.getHisal() + "</td>");
         str.append("<td>");
         
         str.append("<a href='javascript:salCheck(" + sal.getGrade() + ", " + sal.getLosal() + ", " + sal.getHisal() + ")'>");      
         str.append("<button type='button' class='btn btn-primary btn-sm active'>");
         str.append("조회");
         str.append("</button>");
         str.append("</a>");
         
         str.append("</td>");
         str.append("<td>");
         
         str.append("<p style='text-align: center;'>");
         str.append("<a href='SalUpdateForm.jsp?grade=" + sal.getGrade() + "'>");
         str.append("<button type='button'  class='btn btn-primary btn-sm active'>");
         str.append("수정");
         str.append("</button>");
         str.append("</a>");
         
         str.append("<a href='javascript:salDelete(" + sal.getGrade() + ")'>");      
         str.append("<button type='button' class='btn btn-default btn-sm active'>");
         str.append("삭제");
         str.append("</button>");
         str.append("</a>");
         
         str.append("</p>");
         
         str.append("</td>");
         
         str.append("</tr>");
      }
      str.append("</table>");
   }
   catch(Exception e)
   {
      System.out.println(e.toString());
   }
   finally
   {
      try
      {
         // 데이터베이스 연결 종료
         dao.close();
      }
      catch(Exception e)
      {
         System.out.println(e.toString());
      }
   }
   
   
	//---------------------------------------------------------------등급 리스트

	// 조회 리스트 출력-----------------------------------------------------------

   StringBuffer result = new StringBuffer();
   String grade = request.getParameter("grade");
   String losalStr = request.getParameter("losal");
   String hisalStr = request.getParameter("hisal");
   int losal = 0;
   int hisal = 0;
   
   dao.connection();
   SalDTO salDto = new SalDTO();   


   try
   {
	   
	   
	   if(grade != null && losalStr!=null && hisalStr!=null)
	   {
		   
		   salDto = dao.search(grade);	
	 	   losal = salDto.getLosal();
	  	   hisal = salDto.getHisal();
	  	   
	   	   String salCount= "";
	   
	       // 분류별 인원수
	       salCount ="<span id='salCount'>분류 인원 수 : ";
	       salCount += dao.count(losal, hisal)+ "명</span>";  
	      
	       result.append(salCount + "<br>");
	    
	       // 분류별 사원 정보 메뉴 출력
	       result.append("<table  class='table table-bordered'>");
	       result.append("<tr>");
	       result.append("<th style = 'width: 50px;'>번호</th>");
	       result.append("<th style = 'width: 100px;'>이름</th>");
	       result.append("<th style = 'width: 150px;'>직업</th>");
	       result.append("<th style = 'width: 100px;'>매니저</th>");
	       result.append("<th style = 'width: 200px;'>입사일</th>");
	       result.append("<th style = 'width: 150px;'>급여</th>");
	       result.append("<th style = 'width: 150px;'>부서</th>");
	       result.append("<th style = 'width: 130px;'>급여등급</th>");
	       result.append("<th style = 'width: 100px;'>보너스</th>");
	       
	       result.append("</tr>");
	      
	       // 분류에 해당하는 사원 리스트 출력
	       EmpDAO dao2 = new EmpDAO();
	       dao2.connection();
		   for (EmpDTO emp : dao2.gradeList(losal, hisal))
		   {
		      	 result.append("<tr>");
		      	 result.append("<td>" + emp.getEmpno() + "</td>");
		      	 result.append("<td>" + emp.getEname() + "</td>");
		      	 result.append("<td>" + emp.getJob() + "</td>");
		      	 result.append("<td>" + emp.getMgr() + "</td>");
		      	 result.append("<td>" + emp.getHiredate() + "</td>");
		      	 result.append("<td>" + emp.getSal() + "</td>");
		      	 result.append("<td>" + emp.getDname() + "</td>");
		      	 result.append("<td>" + emp.getComm() + "</td>");
		      	 result.append("<td>");
		      	 result.append("</tr>");
		   }
	  }
      result.append("</table>");
      
      
      
   }
   catch(Exception e)
   {
      System.out.println(e.toString());
   }
   finally
   {
      try
      {
         
      }
      catch(Exception e)
      {
         System.out.println(e.toString());
      }
      
   }
   
   
   
   
   
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SalSelect.jsp</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">

<script type="text/javascript">

   function salDelete(grade)
   {
      var res = confirm("분류 : " + grade + "\n이 급여 등급 정보를 삭제하시겠습니까?");
      
      alert(res);
      
      
      
      if (res)
         window.location.href="SalDelete.jsp?grade=" + grade;
   }
   
   function salCheck(grade, losal, hisal)
   {
     
     var res = confirm("분류 : " + grade + "\n 급여 범위는\n" + losal + " ~ " + hisal + "입니다.");
     
     window.location.href="SalSelect.jsp?grade="+grade+"&losal="+losal+"&hisal="+hisal;
     
     
     
   }

</script>

</head>
<body>

<!-- http://211.238.142.153:8090/WebApp13/Salselect.jsp -->
<div class="container">
   <h1>급여 분류 관리 및 출력 페이지</h1>
   <hr>
</div>

<div class="container">
   <a href="SalInsertForm.jsp?"><button type="button" class="btn btn-primary btn-lg active">급여 분류 추가</button></a>
   <a href="EmpSelect.jsp"><button type="button" class="btn btn-primary btn-lg active">처음으로</button></a>
</div>

<br>

<div class="container">
   <!-- 리스트 출력 -->
   <%=str %>
</div>

<div class="container">
	<!-- 조회 리스트 출력 -->
	<%=result %>	
</div>


</body>
</html>