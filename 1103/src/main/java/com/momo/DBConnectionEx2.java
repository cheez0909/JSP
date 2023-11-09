package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBConnectionEx2 {

	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "dani";
		String pw = "dani";
		
		Connection drive = null;
		Statement stat = null;
		ResultSet result = null;
		int result1 = 0;
		
		try {
			// 라이브러리 확인
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 커넥션 객체 생성
			drive = DriverManager.getConnection(url, id, pw);
			
			int a = 6;
			
			// 질의문 생성
			String sql = "select e.emp_name, E.SALARY, rownum\r\n"
					+ "from (select * from employee order by salary desc) e\r\n"
					+ "where rownum < " + a;

			// 질의문 실행
			stat = drive.createStatement();
			
			// 결과를 담는
			// result = stat.executeUpdate(sql);
			result = stat.executeQuery(sql);
			while(result.next()) {
				System.out.print(result.getString(1) + " ");
				System.out.print(result.getString(2) + " ");
				System.out.println(result.getString(3));
				
			}
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
		 catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			// 거꾸로 닫기
			try {
				if(result!=null) result.close();
				if(stat!= null) stat.close();
				if(drive!=null) drive.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}		
	}
}	

}
