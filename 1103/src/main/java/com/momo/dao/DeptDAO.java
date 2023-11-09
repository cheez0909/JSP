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
 * -> mapper / DB로부터 데이터의 CRUD를 처리하는 객체
 * 
 */

// jsp connectionempdao.jsp와 연결됨 
public class DeptDAO extends DBConnection{
	// 부모 생성자 호출
	public DeptDAO(ServletContext application) {
		super(application);
	}
	
	
	public void getList() {
		try {
			
			stmtl = con.createStatement();
			rs = stmtl.executeQuery("select * from department");
			
			while(rs.next()) {
				for(int i=1; i<=rs.getMetaData().getColumnCount(); i++) {
				System.out.println(rs.getString(i));
				}
				System.out.println();
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
