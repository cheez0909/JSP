package com.deptInfo;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DeptDAO extends DBConnectionPool{

	// 지역 검색
	public List<DeptNationalDTO> getDeptNational() {
		List<DeptNationalDTO> list = new ArrayList<>();
		String sql = "select d.dept_id, d.dept_title, n.national_name\r\n"
				+ "from department d \r\n"
				+ "left join location l on (d.location_id=l.local_code) \r\n"
				+ "left join national n on (n.national_code=l.national_code)";
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				DeptNationalDTO dto = new DeptNationalDTO();
				//System.out.println(rs.getString(1));
				//System.out.println(rs.getString(2));
				//System.out.println(rs.getString(3));
				dto.setDept_id(rs.getString(1));
				dto.setDept_title(rs.getString(2));
				dto.setNational_name(rs.getString(3));
				list.add(dto);
			}
			
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// 부서 직원정보 조회하기
	public List<EmployeeDTO> getDeptDetail(String num) {
		List<EmployeeDTO> list = new ArrayList<>();
		String sql = "select *\r\n"
				+ "from employee e\r\n"
				+ "where dept_code = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				EmployeeDTO dto = new EmployeeDTO();
				dto.setEmp_name(rs.getString("EMP_NAME"));
				dto.setEmp_no(rs.getString("EMP_NO"));
				dto.setEmail(rs.getString("EMAIL"));
				dto.setPhone(rs.getString("PHONE"));
				dto.setSalary(rs.getString("SALARY"));
				list.add(dto);
			}
			close();
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return list;
	}
	
	// 직원 정보 추가하기
	public int addEmployee(String id, String name, String no, String email, String phone, String dept_code, String job_code, String sal){
		List<EmployeeDTO> list = new ArrayList<>();
		String sql ="insert into employee columns(EMP_ID, EMP_NAME, EMP_NO, EMAIL, PHONE, DEPT_CODE, JOB_CODE, SALARY)\r\n"
				+ "values (?, ?, ?, ?, ?, ?, ?, ?)";
		int res = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, no);
			pstmt.setString(4, email);
			pstmt.setString(5, phone);
			pstmt.setString(6, dept_code);
			pstmt.setString(7, job_code);
			pstmt.setString(8, sal);
			res = pstmt.executeUpdate();
			
			System.out.println(res + "건 실행되었습니다.");
			close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return res;
	}
}
