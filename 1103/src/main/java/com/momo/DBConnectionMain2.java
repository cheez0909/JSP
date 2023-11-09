package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBConnectionMain2 {

	public static void main(String[] args) {
		
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "dani";
		String pw = "dani";
		
		
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
			
			String sql ="select D.DEPT_TITLE, E.EMP_ID, J.JOB_NAME\r\n"
					+ "FROM EMPLOYEE E INNER JOIN DEPARTMENT D ON (E.DEPT_CODE=D.DEPT_ID)\r\n"
					+ "INNER JOIN JOB J ON (E.JOB_CODE=J.JOB_CODE)";
			
			result = query.executeQuery(sql);
			List<String> lists = new ArrayList<>();
		
			while(result.next()) {
				for(int i=1; i<=result.getMetaData().getColumnCount(); i++) {
					String value = result.getString(i);	
					lists.add(value);
				}
			}
			
			for(String result2 : lists) {
			System.out.println(result2);
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
