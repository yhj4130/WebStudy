package com.test;

public class EmpDTO
{
   
public int getDeptno()
	{
		return deptno;
	}
	public void setDeptno(int deptno)
	{
		this.deptno = deptno;
	}
private String ename,job,hiredate,dname;
   private int sal,comm, deptno,mgr, empno;
   private String grade;
   
   
   public String getGrade()
   {
      return grade;
   }
   public void setGrade(String grade)
   {
      this.grade = grade;
   }
   public int getEmpno()
   {
      return empno;
   }
   
   public void setEmpno(int empno)
   {
      this.empno = empno;
   }
   public String getEname()
   {
      return ename;
   }
   public void setEname(String ename)
   {
      this.ename = ename;
   }
   public String getJob()
   {
      return job;
   }
   public void setJob(String job)
   {
      this.job = job;
   }
   public int getMgr()
   {
      return mgr;
   }
   public void setMgr(int mgr)
   {
      this.mgr = mgr;
   }
   public String getHiredate()
   {
      return hiredate;
   }
   public void setHiredate(String hiredate)
   {
      this.hiredate = hiredate;
   }
   
   public int getSal()
   {
      return sal;
   }
   public void setSal(int sal)
   {
      this.sal = sal;
   }
   public String getDname()
   {
      return dname;
   }
   public void setDname(String dname)
   {
      this.dname = dname;
   }
   public int getComm()
   {
      return comm;
   }
   public void setComm(int comm)
   {
      this.comm = comm;
   }

   
   
   
}