package com.momo;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnectionDynamicQuery2 {

	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "dani";
		String pw = "dani";
		
		// 드라이버 연결
		Connection conn = null;
		// 동적 쿼리 작성
		PreparedStatement prepared = null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, pw);
			
			String sql = "UPDATE EMPLOYEE SET SALARY= ?, EMP_NAME= ? WHERE HIRE_DATE= ?";
			
			prepared = conn.prepareStatement(sql);
			
			prepared.setInt(1, 9000);
			prepared.setString(2, "홍길동");
			Date hireDate = Date.valueOf("1990-02-06");
            prepared.setDate(3, hireDate);
			
			// select는 executeQuery()
			// insert, update, delete는 executeUpdate()
			int res = prepared.executeUpdate();
			System.out.println(res + "건 생성되었습니다.");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
