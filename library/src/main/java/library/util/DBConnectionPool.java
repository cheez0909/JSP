package library.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DBConnectionPool {
	public Connection con;
	public Statement stmtl;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	
	public DBConnectionPool(){
		try {
			// JNDI를 통해 커넥션풀 얻어오기
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");

			// 커넥션풀을 통해 연결 객체 얻기
			con = ds.getConnection();
			
		} catch (NamingException e) {
			System.out.println("==================DBConnectionPool NamingException");
			e.printStackTrace();
		}	catch (SQLException e) {
			System.out.println("==================DBConnectionPool SQLException");
			e.printStackTrace();
		}
	}
	
	// 자원 반납
	public void close() {
		try {
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(stmtl!=null) stmtl.close();
		if(con!=null) con.close();
		} catch(Exception e) {
			System.out.println("자원반납 중 예외가 발생하였습니다.");
			e.printStackTrace();
		}
		
	}
	
}