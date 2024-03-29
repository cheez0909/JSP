package com.momo.dao;

import java.sql.Date;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.DBConnection;
import com.momo.dto.DeptDTO;
import com.momo.vo.myVO;

/*
 * 데이터베이스에 접근 해서
 * 데이터 입력, 출력, 삭제, 조회 작업을 처리하는 객체
 * 
 * Dao
 * -> mapper
 * 
 */

// list로 반환하기 
public class DeptDAO2 extends DBConnection{
	// 부모 생성자 호출
	public DeptDAO2(ServletContext application) {
		super(application);
	}
	

	public List<DeptDTO> getList() {
		List<DeptDTO> empdto = new ArrayList<>();
		
		DeptDTO res = new DeptDTO();
		try {
			stmtl = con.createStatement();
			rs = stmtl.executeQuery("select d.dept_id, d.dept_title, l.local_name from location l, department d where l.local_code=d.location_id");
			while(rs.next()) {
				DeptDTO emp = new DeptDTO();
				emp.setDEPT_ID(rs.getString(1));
				emp.setDEPT_TITLE(rs.getString(2));
				emp.setLocal_name(rs.getString(3));
				empdto.add(emp);
				}
			//for (DeptDTO num : empdto) {
			//	System.out.println(num);
			//}
			
		} catch (SQLException e) {
			System.out.println("SQL예외 발생");
			e.printStackTrace();
		} finally {
			close();
		}
		return empdto;
	}
	
	public String myVO(){
		
		List<myVO> myvo = new ArrayList<>();
		try {
			stmtl = con.createStatement();
			String sql = "SELECT DEPT_TITLE\r\n"
					+ "FROM DEPARTMENT";
			rs = stmtl.executeQuery(sql);
			
			while(rs.next()) {
				myVO vo = new myVO();
				vo.setDEPT_TITLE(rs.getString(1));
				myvo.add(vo);
			}
		
			close();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			
		}
		return myvo.get(1).toString();
	}
		
		
		
	
	public void getEmployee() {
		try {
			
			String sql = "SELECT E.EMP_NAME, E.EMP_NO, E.EMAIL, E.PHONE, E.HIRE_DATE, E.ENT_YN\r\n"
					+ "		FROM EMPLOYEE E, DEPARTMENT D\r\n"
					+ "		WHERE E.DEPT_CODE=D.DEPT_ID\r\n"
					+ "		AND D.DEPT_TITLE = ?";
			
			pstmt = con.prepareStatement(sql);
			
			
			pstmt.setString(1, myVO());
					
			// select는 executeQuery()
			// insert, update, delete는 executeUpdate()
			rs = pstmt.executeQuery();

			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	//public static void main(String[] args) {
		//EmpDAO empdao = new EmpDAO();
		//empdao.getList();
		//empdao.close();
	//}
}
