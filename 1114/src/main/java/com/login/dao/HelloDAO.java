package com.login.dao;

import java.sql.SQLException;

import com.login.common.DBConnectionPool;

public class HelloDAO extends DBConnectionPool{

	
	/*
	 * DB로부터 현재 시간을 조회 후 반환
	 */
	public String getTime() {
		String time = "";
		String sql = "select TO_CHAR(SYSDATE, 'HH:MI:SS') from dual";
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				time = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return time;
	}
	
	
}
