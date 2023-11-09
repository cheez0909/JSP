package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.DBConnection;
import com.momo.dto.DeptDTO;

/*
 * 데이터베이스에 접근 해서
 * 데이터 입력, 출력, 삭제, 조회 작업을 처리하는 객체
 * 
 * Dao
 * -> mapper
 * 
 */

// list로 반환하기 
public class DeptDAO3 extends DBConnection{
	// 부모 생성자 호출
	public DeptDAO3(ServletContext application) {
		super(application);
	}
	

	public void getList() {
		List<DeptDTO> empdto = new ArrayList<>();
		
		DeptDTO res = new DeptDTO();
		try {
			stmtl = con.createStatement();
			rs = stmtl.executeQuery("select * from department");
			while(rs.next()) {
				DeptDTO emp = new DeptDTO();
				emp.setDEPT_ID(rs.getString("DEPT_ID"));
				emp.setDEPT_TITLE(rs.getString("DEPT_TITLE"));
				emp.setLOCATION_ID(rs.getString("LOCATION_ID"));
				empdto.add(emp);
				}
			for (DeptDTO num : empdto) {
				System.out.println(num);
			}
			
		} catch (SQLException e) {
			System.out.println("SQL예외 발생");
			e.printStackTrace();
		} finally {
			close();
		}

	}
	
	//public static void main(String[] args) {
		//EmpDAO empdao = new EmpDAO();
		//empdao.getList();
		//empdao.close();
	//}
}
