package com.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.naming.spi.DirStateFactory.Result;
import javax.sql.DataSource;


/*
 * 톰캣으로부터 제공받는 기능이므로 서버를 실행 후 테스트 할 수 있다.
 * -> main 메소드를 이용한 실행이 불가능하다.
 * 
 */
public class DBConnectionPool {
	// DB에 접근하기 위해 필요한 객체 선언
	// -> 리소스에 context.xml에 저장되어 있음
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	// 생성자로 해놓으면
	public DBConnectionPool() {
		
		try {
			Context initcontext = new InitialContext();
			Context envContext = (Context) initcontext.lookup("java:/comp/env");
			// context.xml 파일에 설정이름있음
			DataSource ds = (DataSource) envContext.lookup("jdbc/myoracle");
			con = ds.getConnection();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	// 자원의 반납
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(stmt!=null) stmt.close();
			if(con!=null) con.close();
		} catch (Exception e) {
			System.out.println("자원 반납 실패");
			e.printStackTrace();
		}
	}
}
