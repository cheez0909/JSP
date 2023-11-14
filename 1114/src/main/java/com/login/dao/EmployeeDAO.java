package com.login.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.login.common.DBConnectionPool;
import com.login.dto.EmployeeDTO;

public class EmployeeDAO extends DBConnectionPool{

	public EmployeeDTO Login(String id, String pw) {
		String sql = "select *\r\n"
				+ "from employee\r\n"
				+ "where emp_id=? and substr(emp_no, 1, 6)=?";
		// List<EmployeeDTO> list = new ArrayList<>();
		// 얘를 널로 설정하지 않으면 메소드가 실행될때 객체가 생성되기 때문에
		// 컨트롤러에서 id와 pw != null로 해놓으면 id와 pw가 틀렸을 때도
		// else로 넘어가지 않는다.
		EmployeeDTO dto = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new EmployeeDTO();
				dto.setEmp_id(rs.getString(1));
				dto.setEmp_name(rs.getString(2));
				dto.setEmp_no(rs.getString(3));
				dto.setEmail(rs.getString(4));
				dto.setEmp_pw(rs.getString(3).substring(0, 6));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dto;
	}
}
