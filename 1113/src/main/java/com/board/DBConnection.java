package com.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * OJDBC를 이용해서 DB 커넥션을 얻어온다.
 */
public class DBConnection {
	
	// 라이브러리가 사용가능한 상태인지 확인
	public static void main(String[] args) {
		// DB 접속 정보
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "dani";
		String pw = "dani";
		
		
		try {
			// 경로를 확인해볼수있다.
			// 1. 드라이버 로딩 - ojdbc6
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이버 로딩 완료!");
			
			// 2. 커넥션 생성
			// DB에 접근 후 인증과정을 거쳐 커넥션을 얻어옵니다.
			// db도 서버라서 ip & port가 필요함 
			Connection con = DriverManager.getConnection(url, id, pw);
			
			// 쿼리를 질의하기 위해 필요한 객체를 생성
			Statement stm = con.createStatement();
			
			
			// 쿼리 실행
			// select - resultSet
			// insert, delete, update - int
			ResultSet rs = stm.executeQuery("select sysdate from dual");
			// 다음 값이 존재하는가?
			rs.next();
			System.out.println("현재 시간 "+rs.getString(1));
			
			rs.close();
			stm.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버를 로딩할 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("드라이버를 연결할 수 없습니다.");
			e.printStackTrace();
		}
	}
}
