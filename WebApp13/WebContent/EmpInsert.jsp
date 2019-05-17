<%@page import="com.test.EmpDTO"%>
<%@page import="com.test.DeptDTO"%>
<%@page import="com.test.DeptDAO"%>
<%@page import="com.test.EmpDAO"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String name = request.getParameter("name");
	String dept = request.getParameter("dept");
	
	int year = Integer.parseInt(request.getParameter("selectY"));
	int month = Integer.parseInt(request.getParameter("selectM"));
	int day = Integer.parseInt(request.getParameter("selectD"));
	
	String jobStr = request.getParameter("job");
	String mgrStr = request.getParameter("manager");
	
	int sal = Integer.parseInt(request.getParameter("sal"));
	int sudang = Integer.parseInt(request.getParameter("sudang"));
	
	//System.out.println(name+dept+year+month+day+jobStr+"*"+mgrStr+sal+sudang);
	
	EmpDAO Edao = new EmpDAO();
	DeptDAO Ddao = new DeptDAO();
	
	Edao.connection();
	Ddao.connection();
	
	// 입사일
	String hiredate = year+"-"+month+"-"+day;
	
	// 부서 번호
	StringBuffer deptNoCheck = new StringBuffer();
	for(DeptDTO deptDTO : Ddao.deptNo(dept))
	{
		deptNoCheck.append(deptDTO.getDeptNo());
	}
	
	// 해당 관리자 번호
	StringBuffer mgrNoCheck = new StringBuffer();
	for(EmpDTO empDTO : Edao.jobNo(mgrStr))
	{
		mgrNoCheck.append(empDTO.getEmpno());
	}
	
	String deptNo ="";
	deptNo += deptNoCheck;
	String mgrNo ="";
	mgrNo += mgrNoCheck;
	//System.out.println(hiredate+deptNoCheck+"*"+mgrNoCheck);
	
	DeptDTO dto = new DeptDTO();
	EmpDTO Edto = new EmpDTO();
		
	Edto.setEname(name);
	Edto.setDeptno(Integer.parseInt(deptNo));
	Edto.setJob(jobStr);
	Edto.setMgr(Integer.parseInt(mgrNo));
	Edto.setHiredate(hiredate);
	Edto.setSal(sal);
	Edto.setComm(sudang);
	
	Edao.add(Edto);
	
	response.sendRedirect("EmpSelect.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>