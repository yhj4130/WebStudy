package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConn
{
	private static Connection dbConn;
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		
		if (dbConn==null)
		{
			String url ="jdbc:oracle:thin:@localhost:1521:xe";
			String user="scott";
			String pw="tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			dbConn=DriverManager.getConnection(url, user, pw);
			
		}
		
		return dbConn;
	}
	
	public static void close() throws SQLException {
		if (dbConn!=null){
			if(!dbConn.isClosed()) {
				
				dbConn.close();
				
			}
		}
		
		dbConn=null;
		
	}

}
