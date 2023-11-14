package com.login.common;

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
	
	// 반납을 쉽게하기 위해서 전역변수로 지정
	public Connection con;
	public Statement stmt;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	
	public DBConnectionPool(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			con = ds.getConnection();
		
//			stmt = con.createStatement();
//			rs = stmt.executeQuery("select sysdate from dual");
//		
//			if(rs.next()) {
//				System.out.println(rs.getString(1));
//			}
		
		} catch(NamingException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(pstmt!=null) pstmt.close();
			if(con!=null) con.close();
		} catch (SQLException e) {
			System.out.println(this.getClass().getName());
			System.out.println("DBConnectionPool 자원 반납 중 오류가 발생하였습니다.");
			e.printStackTrace();
		}
	}
}
