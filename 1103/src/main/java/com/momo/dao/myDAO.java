package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.DBConnection;
import com.momo.DBConnectionPool;
import com.momo.dto.myDTO;

public class myDAO extends DBConnectionPool{

	// 커넥션풀을 이용하면 어플리케이션을 이용하지 않아도됨
	//public myDAO(ServletContext application) {
	//	super(application);
	//}
	
	public List<myDTO> getList(){
		List<myDTO> list = new ArrayList<>();
		
		try {
			stmtl = con.createStatement();
			
			String sql = "SELECT E.EMP_NAME, D.DEPT_TITLE, J.JOB_NAME\r\n"
					+ "FROM EMPLOYEE E, JOB J, DEPARTMENT D\r\n"
					+ "WHERE E.DEPT_CODE = D.DEPT_ID(+)\r\n"
					+ "AND E.JOB_CODE=J.JOB_CODE";
			
			rs = stmtl.executeQuery(sql);
			
			while(rs.next()) {
				myDTO dto = new myDTO();
				dto.setDEPT_TITLE(rs.getString("DEPT_TITLE"));
				dto.setEMP_NAME(rs.getString("EMP_NAME"));
				dto.setJOB_NAME(rs.getString("JOB_NAME"));
				list.add(dto);
			}
			
			// 자원반납
			close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return list;
	}
	

}
