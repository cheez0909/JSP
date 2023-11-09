package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBConnectionMain {

	public static void main(String[] args) {
		
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "dani";
		String pw = "dani";
		/*
		 * 1. 드라이버 로딩
		 * 		DB에 접근하기 위해 필요한 라이브러리가 있는지 확인
		 * 
		 * 2. 커넥션 객체를 생성
		 * 
		 * 
		 * */ 
		Connection driver = null;
		Statement query = null;
		ResultSet result = null;
		ResultSet result1 = null;
		
		try {
			// 1. 드라이버 로딩
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 2. 커넥션 객체생성
			driver = DriverManager.getConnection(url, id, pw);
			
			query = driver.createStatement();
			String sql ="select * from employee";
			
			
			// query1 = driver.cre
			// executeQuery(sql)
			// select 문장을 실행 할 경우 resultSet을 반환한다.
			// executeUpdate(sql)
			// update, insert, delets의 경우 int 타입을 반환한다
			// 실행결과 몇건이 처리되었는지
			result = query.executeQuery(sql);
			result.next();
			// 숫자를 입력 시 1 부터
			// 숫자 또는 결과집합의 컬럼명
			while(result.next()) {
			System.out.print(result.getString("emp_id") + " ");
			System.out.print(result.getString("emp_name") + " " + result.getString("emp_no") +"\n");
			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("드라이버 로딩실패 - 라이브러리가 등록 되었는 지 확인해주세요.");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			// 거꾸로 닫기
			try {
				if(result!=null) result.close();
				if(query!= null) query.close();
				if(driver!=null) driver.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}		
		}
	}
}
