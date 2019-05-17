package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class EmpDAO
{
   private Connection conn;
   
   //데이터베이스 연결 담당 메소드
   public Connection connection() throws ClassNotFoundException, SQLException
   {
      conn = DBConn.getConnection();
      return conn;
   }
   
   //데이터베이스 입력 담당 메소드
   public int add(EmpDTO dto) throws SQLException
   {
      int result=0;
      
      String sql = "INSERT INTO EMP(EMPNO,ENAME,DEPTNO,JOB,MGR,HIREDATE,SAL,COMM) VALUES(EMPNOSEQ.NEXTVAL,?,?,?,?, TO_DATE(?, 'YYYY-MM-DD'),?,?)";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dto.getEname());
      pstmt.setInt(2, dto.getDeptno());	
      pstmt.setString(3, dto.getJob());
      pstmt.setInt(4, dto.getMgr());
      pstmt.setString(5, dto.getHiredate());
      pstmt.setInt(6, dto.getSal());
      pstmt.setInt(7, dto.getComm());
      
      result = pstmt.executeUpdate();
      
      pstmt.close();
      
      return result;
   }
   
 //리스트 출력 담당 메소드(전체)
   public ArrayList<EmpDTO> listsAll() throws SQLException
   {
      ArrayList<EmpDTO> result = new ArrayList<EmpDTO>();
      
      String sql ="SELECT EMPNO, ENAME, DNAME, DEPTNO, JOB, MGR, HIREDATE, SAL, COMM, GRADE" 
    		   + " FROM VIEW_EMP";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet rs = pstmt.executeQuery();
      EmpDTO emp = null;
      while (rs.next())
      {
         emp = new EmpDTO();
         emp.setEmpno(rs.getInt("EMPNO"));
         emp.setEname(rs.getString("ENAME"));
         emp.setDname(rs.getString("DNAME"));
         emp.setJob(rs.getString("JOB"));
         emp.setMgr(rs.getInt("MGR"));
         emp.setDeptno((rs.getInt("DEPTNO")));
         emp.setHiredate(rs.getString("HIREDATE"));
         emp.setSal(rs.getInt("SAL"));
         emp.setComm(rs.getInt("COMM"));
         emp.setGrade(rs.getString("GRADE"));
         
         result.add(emp);
      }
      rs.close();
      pstmt.close();
      
      return result;
   }
   
   //리스트 출력 담당 메소드(부서별)
   public ArrayList<EmpDTO> listsAll2(String deptno) throws SQLException
      {
         ArrayList<EmpDTO> result = new ArrayList<EmpDTO>();

         int deptint = Integer.parseInt(deptno);
         
         String sql = String.format("SELECT EMPNO, ENAME, DNAME, JOB, MGR, HIREDATE, SAL, COMM, GRADE FROM VIEW_EMP2 WHERE DEPTNO=%d", deptint);
         
         System.out.println(deptno);
         System.out.println(sql);
         
         
         PreparedStatement pstmt = conn.prepareStatement(sql);
         
         ResultSet rs = pstmt.executeQuery();

         EmpDTO emp = null;
         
         while (rs.next())
         {
            emp = new EmpDTO();
            emp.setEmpno(rs.getInt("EMPNO"));
            emp.setEname(rs.getString("ENAME"));
            emp.setDname(rs.getString("DNAME"));
            emp.setJob(rs.getString("JOB"));
            emp.setMgr(rs.getInt("MGR"));
            emp.setHiredate(rs.getString("HIREDATE"));
            emp.setSal(rs.getInt("SAL"));
            emp.setComm(rs.getInt("COMM"));
            emp.setGrade(rs.getString("GRADE"));
            
            result.add(emp);
         }
         rs.close();
         pstmt.close();
         
         return result;
      }
   
 //인원 수 확인 담당 메소드
   public int countAll() throws SQLException
   {
      int result = 0;
      String sql ="SELECT COUNT(*) AS COUNT FROM EMP";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet rs = pstmt.executeQuery();
      while (rs.next())
      {
         result=rs.getInt("COUNT");
      }
      rs.close();
      pstmt.close();
      
      return result;
   }
   
   
   //인원 수 확인(부서별) 담당 메소드
      public int count(String deptno) throws SQLException
      {
         int result = 0;
         String sql ="SELECT COUNT(*) AS COUNT FROM EMP WHERE DEPTNO=?";
         PreparedStatement pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1,deptno);
   
         ResultSet rs = pstmt.executeQuery();
         
         while (rs.next())
         {
            result=rs.getInt("COUNT");
         }
         rs.close();
         pstmt.close();
         
         return result;
      }
   
   
   
   //데이터베이스 연결 종료 담당
   public void close() throws SQLException
   {
      DBConn.close();
   }
   
   
   //사원번호 검색 메소드
   public EmpDTO searchEmp(int empno) throws SQLException
   {
      EmpDTO result = new EmpDTO();
      
      String sql ="SELECT EMPNO,ENAME,DNAME,JOB,MGR,HIREDATE,SAL,COMM FROM VIEW_EMP WHERE EMPNO=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);

      pstmt.setInt(1, empno);
      
      ResultSet rs = pstmt.executeQuery();
      while (rs.next())
      {
    	  result.setEmpno(rs.getInt("EMPNO"));
    	  result.setEname(rs.getString("ENAME"));
    	  result.setDname(rs.getString("DNAME"));
    	  result.setJob(rs.getString("JOB"));
    	  result.setMgr(rs.getInt("MGR"));
    	  result.setHiredate(rs.getString("HIREDATE"));
    	  result.setSal(rs.getInt("SAL"));
    	  result.setComm(rs.getInt("COMM"));
         
         
         
      }
      rs.close();
      pstmt.close();
      
      return result;
   }
   
   // 사원 데이터 삭제 담당 메소드
   public int remove(String empno) throws SQLException
   {
      int result=0;
      String sql ="DELETE FROM EMP WHERE EMPNO=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, empno);
      
      result= pstmt.executeUpdate();
      
      pstmt.close();
   
      return result;
   }
   
   //사원 수정 담당 메소드
   public int modify(EmpDTO emp) throws SQLException
   {
      int result=0;
      String sql ="UPDATE EMP SET DEPTNO=?, JOB=?, MGR=?, HIREDATE=?,SAL=?,COMM=? WHERE EMPNO=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setInt(1, emp.getDeptno());
      pstmt.setString(2, emp.getJob());
      pstmt.setInt(3, emp.getMgr());
      pstmt.setString(4, emp.getHiredate());
      pstmt.setInt(5, emp.getSal());
      pstmt.setString(6, emp.getGrade());
      pstmt.setInt(7, emp.getEmpno());
      

      result= pstmt.executeUpdate();
      
      pstmt.close();
   
      
      return result;
         
   }
   
   
   
   // 부서번호로 부서에 속한 사원들 검색
   public ArrayList<EmpDTO> searchDept(String deptNo) throws SQLException
   {
      ArrayList<EmpDTO> result = new ArrayList<EmpDTO>();
      
      String sql ="SELECT EMPNO, ENAME, JOB, DEPTNO FROM VIEW_EMP_DEPTNO WHERE DEPTNO=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);

      pstmt.setString(1, deptNo);
      
      ResultSet rs = pstmt.executeQuery();
      EmpDTO emp = null;
      while (rs.next())
      {
         emp = new EmpDTO();
         emp.setEmpno(rs.getInt("EMPNO"));
         emp.setEname(rs.getString("ENAME"));
         emp.setJob(rs.getString("JOB"));
         
      }
      rs.close();
      pstmt.close();
      
      return result;
   }
   
   
   // 관리자 조회 메소드
   public ArrayList<EmpDTO> searchMgr1() throws SQLException
   {
      ArrayList<EmpDTO> result = new ArrayList<EmpDTO>();
      
      
      String sql ="SELECT ENAME FROM EMP WHERE JOB='PRESIDENT'";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      ResultSet rs = pstmt.executeQuery();
      EmpDTO emp = null;
      
      while (rs.next())
      {
         emp = new EmpDTO();
         emp.setEname(rs.getString("ENAME"));
         
         result.add(emp);
      }
      
      rs.close();
      pstmt.close();
      
      return result;
   }
   
   public ArrayList<EmpDTO> searchMgr2(String dept) throws SQLException
   {
      
     
      ArrayList<EmpDTO> result = new ArrayList<EmpDTO>();
      
      
      String sql ="SELECT ENAME FROM VIEW_EMP WHERE JOB='MANAGER' AND DNAME=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dept);
      
      ResultSet rs = pstmt.executeQuery();
      EmpDTO emp = null;
      
      while (rs.next())
      {
         emp = new EmpDTO();
         emp.setEname(rs.getString("ENAME"));
         
         result.add(emp);
      }
      
      rs.close();
      pstmt.close();
      
      return result;
   }

  
   // 직업 사원 번호 조회 메소드
   public ArrayList<EmpDTO> jobNo(String dName) throws SQLException
   {
	   ArrayList<EmpDTO> result = new ArrayList<EmpDTO>();
	   
      String sql ="SELECT EMPNO FROM EMP WHERE JOB='MANAGER' AND ENAME=?";
      
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, dName);
      ResultSet rs = pstmt.executeQuery();
      EmpDTO emp = null;
      
      while (rs.next())
      {
         emp = new EmpDTO();
         emp.setEmpno(rs.getInt("EMPNO"));
         
         result.add(emp);
      }
      
      rs.close();
      pstmt.close();
      
      return result;
   } 
}
   
   
   
   
   
