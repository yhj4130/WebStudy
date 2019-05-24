package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.util.DBConn;

public class ScoreDAO
{
	private Connection dbConn;
	
	// db연결	
	public ScoreDAO() throws ClassNotFoundException, SQLException{
		dbConn= DBConn.getConnection();
	}
	
	//1. 리스트 조회
	
	public ArrayList<ScoreDTO> lists() throws SQLException{
		
		ArrayList<ScoreDTO> result = new ArrayList<ScoreDTO>();
		
		String sql ="select sid,name,kor,eng,mat,kor+eng+mat tot, trunc((kor+eng+mat)/3.0,2) avg from tbl_score order by sid";
		
		Statement stmt = dbConn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()) {
			ScoreDTO dto =  new ScoreDTO();
			dto.setSID(rs.getString("SID"));
			dto.setName(rs.getString("NAME"));
			dto.setKor(rs.getInt("KOR"));
			dto.setEng(rs.getInt("ENG"));
			dto.setMat(rs.getInt("MAT"));
			dto.setTot(rs.getInt("TOT"));
			dto.setAvg(rs.getDouble("AVG"));
			
			result.add(dto);			
		}
		
		rs.close();
		stmt.close();	
		
		return result;
		
	}
	
	//2. 전체 인원수 조회
	
	public int count() throws SQLException {
		
		int result =0;
		
		String sql ="select count(*) from tbl_score";
		
		Statement stmt = dbConn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		
		while (rs.next())
		{
			result= rs.getInt("COUNT(*)");
			
		}
		
		rs.close();
		stmt.close();
		
		return result ;
	}
	
	
	
	
	
	//3. 입력 메소드
	
	public int add(ScoreDTO dto) throws SQLException {
		
		int result = 0;
		String sql ="INSERT INTO TBL_SCORE(SID,NAME,KOR,ENG,MAT) VALUES (SCORESEQ.NEXTVAL,?,?,?,?)";
		PreparedStatement pstmt = dbConn.prepareStatement(sql);
		pstmt.setString(1, dto.getName());
		pstmt.setInt(2, dto.getKor());
		pstmt.setInt(3, dto.getEng());
		pstmt.setInt(4, dto.getMat());
		
		result= pstmt.executeUpdate();
		
		pstmt.close();		
		
		return result;
	}
	
	
	public void close() throws SQLException {
		DBConn.close();
	}

}
