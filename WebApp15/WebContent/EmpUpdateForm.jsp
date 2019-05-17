<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.test.DeptDAO"%>
<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.EmpDAO"%>
<%@page import="com.test.EmpDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	EmpDAO dao = new EmpDAO();
	DeptDAO deptdao = new DeptDAO();
	
	dao.connection();
	deptdao.connection();
	
	StringBuffer dateStr = new StringBuffer();
	StringBuffer testStr = new StringBuffer();
	StringBuffer jStr = new StringBuffer();
    StringBuffer mStr = new StringBuffer();
	
	
	request.setCharacterEncoding("UTF-8");
	
	System.out.println(request.getParameter("Empno"));
	
	int empNo = 0;
	String Ename = "";
	String Ejob = "";
	String Edept = "";
	String Ehiredate = "";
	int Esal = 0;
	int Ecomm = 0;
	
	String deptStr = "";
	
	String jobStr = "";
	String testdept = "";
	String name = "";
	String sal = "";
	String sudang = "";
	
	String Edept2 = request.getParameter("Edept");
	try
	{
		   empNo = Integer.parseInt(request.getParameter("Empno"));
		   EmpDTO emp = dao.searchEmp(empNo);
		   Ename = emp.getEname();
		   Ejob = emp.getJob();
		   Edept = emp.getDname();
		   Ehiredate = emp.getHiredate();
		   Esal = emp.getSal();
		   Ecomm = emp.getComm();
		   
		   deptStr = request.getParameter("deptStr");
		   jobStr = request.getParameter("job");
		   testdept = request.getParameter("dept");
		   name = request.getParameter("name");
		   sal = request.getParameter("sal");
		   sudang = request.getParameter("sudang");	   
		   
		   if(name == null)
		   {
			   name = "";	   
		   }
		   if(sal == null)
		   {
			   sal = "";
		   }
		   if(sudang == null)
		   {
			   sudang = "";
		   }
		   


		// 조현우 입사일 부분
			
			Calendar cal = Calendar.getInstance();
			
			String sYear = request.getParameter("selectY");
			String sMonth = request.getParameter("selectM");
			String sDay = request.getParameter("selectD");
			
			
			
			int nowYear = cal.get(Calendar.YEAR);			//--2019	
			int nowMonth = cal.get(Calendar.MONTH)+1;		//--5
			int nowDay = cal.get(Calendar.DAY_OF_MONTH);	//--13
			
			
			
			if(sYear != null || sMonth != null || sDay != null)
			{
				nowYear = Integer.parseInt(sYear);
				nowMonth = Integer.parseInt(sMonth);
				nowDay = Integer.parseInt(sDay); 

				/* 
				int selectYear = Integer.parseInt(sYear);
				int selectMonth = Integer.parseInt(sMonth);
				int selectDay = Integer.parseInt(sDay); */
			}
			
			dateStr.append("<select id = 'selectY' name = 'selectY' onchange = 'formChange(this.form)'>");
			for(int i = nowYear-10; i<nowYear+10; i++)
			{
				if (sYear==null && i==nowYear)
				{
					dateStr.append("<option selected = 'selected' value = '"+i+"'>");		
					dateStr.append(i);
					dateStr.append("</option>");
				}
				else if (sYear!=null && Integer.parseInt(sYear) == i)
				{
					dateStr.append("<option selected = 'selected' value = '"+i+"'>");		
					dateStr.append(i);
					dateStr.append("</option>");
				}
				else
				{
					dateStr.append("<option value = '"+i+"'>");		
					dateStr.append(i);
					dateStr.append("</option>");
				}
			}
			dateStr.append("</select> 년");


			dateStr.append("<select id = 'selectM'  name = 'selectM' onchange = 'formChange(this.form)'>");
			for(int j=1; j<13; j++)
			{
				if (sMonth==null && j == nowMonth)
				{
					dateStr.append("<option selected = 'selected' value = '"+j+"'>");		
					dateStr.append(j);
					dateStr.append("</option>");
				}
				else if (sMonth!=null && Integer.parseInt(sMonth) == j)
				{
					dateStr.append("<option selected = 'selected' value = '"+j+"'>");		
					dateStr.append(j);
					dateStr.append("</option>");
				}
				else
				{
					dateStr.append("<option value = '"+j+"'>");		
					dateStr.append(j);
					dateStr.append("</option>");
				}
			}
			dateStr.append("</select> 월");
			
			
			int[] months = {31,28,31,30,31,30,31,31,30,31,30,31};
			
			if (nowYear%4==0 && nowYear%100!=0 || nowYear%400==0)
			{
				months[1] = 29;
			}
			else
			{
				months[1] = 28;
			}
			
			int monthDate = months[nowMonth-1];
			dateStr.append("<select id = 'selectD'  name = 'selectD' onchange = 'formChange(this.form)'>");
			for(int k=1; k<=months[nowMonth-1]; k++)
			{
				if (sDay==null && nowDay == k)
				{
					dateStr.append("<option selected = 'selected' value = '"+k+"'>");		
					dateStr.append(k);
					dateStr.append("</option>");
				}
				else if(sDay!=null && Integer.parseInt(sDay) == k)
				{
					dateStr.append("<option selected = 'selected' value = '"+k+"'>");		
					dateStr.append(k);
					dateStr.append("</option>");			
				}
				else
				{
					dateStr.append("<option value = '"+k+"'>");		
					dateStr.append(k);
					dateStr.append("</option>");
				}
			}
			
			dateStr.append("</select> 일");
		   	/* System.out.println(testdept);
		    System.out.println(jobStr); */
		    
		   	
		    /* for (DeptDTO deptD : deptdao.lists())   
		    {
		    	if (testdept==null || testdept.equals(deptD.getdName()))
		    	{
		    		testStr.append("<option value = '"+ deptD.getdName() +"' selected = 'selected'>" + deptD.getdName() + "</option>");
		    	}
		    	else if (testdept!=null && testdept.equals(deptD.getdName()))
		    	{
		    		testStr.append("<option value = '"+ deptD.getdName() +"' selected = 'selected'>" + deptD.getdName() + "</option>");
		    	}
		    	else
		    	{
		    		testStr.append("<option value = '"+ deptD.getdName() +"'>" + deptD.getdName() + "</option>");
		    	}
		    } */
		   
		    
		    
		    
		    
		    String[] jobs = {"CLERK", "SALESMAN", "ANALYST", "MANAGER"};
		    
		    for (int i=0; i<4; i++)
		    {
		    	if (jobStr!=null && jobStr.equals(jobs[i]))
		        {
		           
		           jStr.append("<option value = '"+ jobs[i] +"' selected = 'selected'>"+ jobs[i] +"</option>");
		        }
		        else
		        {
		           jStr.append("<option value = '"+ jobs[i] +"'>"+ jobs[i] +"</option>");
		        }
		    }
		    
		    if (jobStr!=null && jobStr.equals("MANAGER"))
		    {
		    	
		    	for (EmpDTO manager : dao.searchMgr1())
		        {
		    		mStr.append("<option value = '"+ manager.getEname()+"'>"+ manager.getEname()+"</option>");
		        }
		    }
		    else
		    {
		    	for (EmpDTO manager : dao.searchMgr2(testdept))
		        {
		    		mStr.append("<option value = '"+ manager.getEname()+"'>"+ manager.getEname()+"</option>");
		        }
		    }
		   
	} catch(Exception e)
	{
		   System.out.println(e.toString());
	}
	finally
	{
		   try
		   {
			   dao.close();
		
		   } catch(Exception e)
		   {
			   System.out.println(e.toString());
		   }
	}
%>
<%
   // 부서 정보 수신하여 부서에 속한 사원들을 매니저 후보로 발신
   
   

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EmpInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<style>
   .errMsg
   {
      font-size: small;
      color: red;
      display: none;
   }

</style>

<script type="text/javascript">

   
   

	function formChange(obj)
	{
		obj.submit();
	}
	
	
	
	function empSubmit()
	   {
	      var empForm = document.getElementById("empForm");
	      
	      var name = document.getElementById("name");
	      var nameMsg = document.getElementById("nameMsg");  
	      var sal = document.getElementById("sal");
	      var salMsg = document.getElementById("salMsg");
	      var dept = document.getElementById("dept").value;
	      var selectY = document.getElementById("selectY").value;
	      var selectM = document.getElementById("selectM").value;
	      var selectD = document.getElementById("selectD").value;
	      var nameV = name.value;
	      var job = document.getElementById("job").value;
	      var manager = document.getElementById("manager").value;
	      var sal = document.getElementById("sal").value;
	      var sudang = document.getElementById("sudang").value;
	      
	      
	      nameMsg.style.display = "none";
	      salMsg.style.display = "none";
	      
	      if (name.value == "")
	      {
	         nameMsg.style.display = "inline";
	         name.focus();
	         return;
	      }
	      
	      if (sal.value == "")
	      {
	         salMsg.style.display = "inline";
	         sal.focus();
	         return;
	      }
	      /* 
	      */
	      location.href="EmpInsert.jsp?dept="+dept+"&selectY="+selectY+"&selectM="+selectM+"&selectD="
	    		  +selectD+"&name="+nameV+"&job="+job+"&manager="+manager+"&sal="+sal+"&sudang="+sudang;
	   }
	   
	   function empReset()
	   {
	      var empForm = document.getElementById("empForm");

	      var name = document.getElementById("name");
	      var nameMsg = document.getElementById("nameMsg");
	      
	      var sal = document.getElementById("sal");
	      var salMsg = document.getElementById("salMsg");
	      
	      nameMsg.style.display = "none";
	      salMsg.style.display = "none";
	      
	      empForm.reset();
	      
	      name.focus();
	   }
	   
	   function deptCheck()
	{
		
	}
   
</script>
</head>
<body>
<!-- http://localhost:8090/WebApp13/EmpInsertForm.jsp -->
<div  class="container">
   <h1>회원 수정 페이지</h1>
   <hr>
</div>

<br>
<div  class="container">
   <!-- 회원 정보 입력 폼 구성 -->
   <form action = "" method="post" id="empForm" >
      <table class="table">
         <tr>
            <th>이름(*)</th>
            <td>
               <input type="text" id="name" name="name" value = "<%=Ename %>">
            </td>
            <td>
            	<span class="errMsg" id="nameMsg">이름을 입력해야 합니다.</span>
            </td>
               
         </tr>
         <tr>
            <th>입사일(*)</th>
            <td><%=dateStr %></td>
            <td>
            </td>
         </tr>
         <tr>
            <th>부서(*)</th>
            <!-- <td><input type="text" id="deptStr" name="deptStr" readonly="readonly"></td> -->
            <td>
               <select id="dept" name="dept" onchange="deptCheck(this)">
                  <%for (DeptDTO deptD : deptdao.lists())   
      		    	{%>
      		    	<option value = '<%=deptD.getdName() %>'><%=deptD.getdName() %></option>
                <%	
      		    } %>
               </select>
            </td>
         </tr>
         <tr>
            <th>직업(*)</th>
            <td>
               <select id="job" name="job"  onchange="formChange(this.form)">
                  <%=jStr %>
               </select>
            </td>
         </tr>
         <%-- <%=mStr %> --%>
         <tr>
            <th>매니저(*)</th>

            <td>
            <select id="manager" name="manager"  onchange="formChange(this.form)">
            <%=mStr %>
            </select>
            </td>
         </tr>
         
         <tr>
   <th>급여(*)</th>
            <td>
               <input type="text" id="sal" name="sal" value=<%=Esal %>>　만원 (700 이상)
            </td>
            <td>
            	<span class="errMsg" id="salMsg">급여를 입력해야 합니다.</span>
            </td>

         </tr>
         <tr>
            <th>수당</th>
            <td>
               <input type="text" id="sudang" name="sudang" value=<%=Ecomm %>>　만원
            </td>
            <td>
            </td>
         </tr>
      </table>
      <br>
      <a href="javascript:empSubmit()"><button type="button" class="btn btn-primary btn-sm active">입력하기</button></a>   
      <a href="javascript:empReset()"><button type="button" class="btn btn-default btn-sm active">취소하기</button></a>
      <a href="EmpSelect.jsp"><button type="button" class="btn btn-primary btn-sm active">목록으로</button></a>
   </form>
<!-- javascript:empSubmit() -->
</div>


</body>
</html>