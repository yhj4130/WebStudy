<%@page import="com.test.EmpDTO"%>
<%@page import="com.test.EmpDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   //EmpUpdate.jsp
   
   request.setCharacterEncoding("UTF-8");
   
   //데이터 수신
   String empnoStr = request.getParameter("empno");
   int empno = Integer.parseInt(empnoStr);
   String ename = request.getParameter("ename");
   String dname = request.getParameter("dname");
   String job = request.getParameter("job");
   String mgrStr = request.getParameter("mgr");
   int mgr = Integer.parseInt(mgrStr);
   String hiredate = request.getParameter("hiredate");
   String grade = request.getParameter("grade");
   String vsal = request.getParameter("sal");
   int sal = Integer.parseInt(vsal);
   String vcomm = request.getParameter("comm");
   int comm = Integer.parseInt(vcomm);
   
   
   EmpDAO dao = new EmpDAO();
   
   try
   {
      dao.connection();
      
      EmpDTO emp = new EmpDTO();
      
      emp.setEmpno(empno);
      emp.setEname(ename);
      emp.setDname(dname);
      emp.setJob(job);
      emp.setMgr(mgr);
      emp.setHiredate(hiredate);
      emp.setSal(sal);
      emp.setComm(comm);
      emp.setGrade(grade);
      
      dao.modify(emp);
      
      
   }
   catch(Exception e)
   {
      System.out.print(e.toString());
   }
   finally
   {
      try
      {
         dao.close();   
         
      }
      catch(Exception e)
      {
         System.out.print(e.toString());
      }
   }
   
   response.sendRedirect("EmpSelect.jsp");

%>