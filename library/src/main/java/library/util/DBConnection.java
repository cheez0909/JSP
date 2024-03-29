package library.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContext;

public class DBConnection {
	public Connection con;
	public Statement stmtl;
	public PreparedStatement pstmt;
	public ResultSet rs;
	
	public DBConnection(){	
		try {
			// 드라이버 로딩
			Class.forName("oracle.jdbc.OracleDriver");
			
			String url = "jdbc:oracle:thin:@localhost:1521:orcl";
			String id = "dani";
			String pw = "dani";
			
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("DB 연결 성공! (기본 생성자)");
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버로딩 실패");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	// 서버가 실행될때
	// application으로부터 db정보를 불러옴
	public DBConnection(ServletContext application) {
		String driver = application.getInitParameter("driver");
		String url = application.getInitParameter("url");
		String id = application.getInitParameter("id");
		String pw = application.getInitParameter("pw");
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			System.out.println("application 내장 객체를 활용한 Connection 생성");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("드라이버 로딩 실패 - 라이브러리를 확인해주세요");
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Connection 객체 생성 실패");
			e.printStackTrace();
		}
	
	}
	
	public DBConnection(String driver, String url, String id, String pw) {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			stmtl = con.createStatement();
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
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

