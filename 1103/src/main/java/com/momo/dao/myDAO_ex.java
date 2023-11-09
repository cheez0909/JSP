package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.DBConnection;
import com.momo.dto.myDTO;
import com.momo.vo.myVO;

public class myDAO_ex extends DBConnection{

	public myDAO_ex(ServletContext application) {
		super(application);
	}
	public myDAO_ex() {}
	public List<myVO> getList(){
		List<myVO> list = new ArrayList<>();
		
		try {
			String sql = "SELECT E.EMP_NAME, D.DEPT_TITLE, J.JOB_NAME\r\n"
					+ "FROM EMPLOYEE E, JOB J, DEPARTMENT D\r\n"
					+ "WHERE E.DEPT_CODE = D.DEPT_ID(+)\r\n"
					+ "AND E.JOB_CODE=J.JOB_CODE";
			stmtl = con.createStatement();
			rs = stmtl.executeQuery(sql);
			while(rs.next()) {
				myVO vo = new myVO();
				vo.setEMP_NAME(rs.getString("EMP_NAME"));
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return list;
	}
	

}
