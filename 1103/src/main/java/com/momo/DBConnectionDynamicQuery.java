package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DBConnectionDynamicQuery {

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
			
			String sql = "insert into job values (?, ?)";
			
			prepared = conn.prepareStatement(sql);
			
			// 첫번째, 밸류
			prepared.setString(1, "99");
			// 두번째, 밸류
			prepared.setString(2, "값99");
			
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
