package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.DBConnection;
import com.momo.dto.employeeDTO;
import com.momo.dto.myDTO;
import com.momo.vo.myVO;

public class employeeDAO extends DBConnection{

	public employeeDAO(ServletContext application) {
		super(application);
	}
	
	public employeeDAO() {}
	public void getList(){
		List<employeeDTO> list = new ArrayList<>();
		
		try {
			for(int i=1; i<=22; i++) {
			String sql = "SELECT *\r\n"
					+ "FROM EMPLOYEE\r\n"
					+ "WHERE EMP_NAME=?";
			
			pstmt = con.prepareStatement(sql);
			
			myDAO_ex ex = new myDAO_ex();
			List<myVO> vo = ex.getList();
			
			
			pstmt.setString(1, vo.get(i).getEMP_NAME());
			
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				employeeDTO dto = new employeeDTO();
				dto.setEMP_ID(rs.getString("EMP_ID"));
				dto.setSALARY(rs.getString("SALARY"));
				list.add(dto);
			}}
			System.out.println(list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		// return list;
	}

	public static void main(String[] args) {
		employeeDAO dao = new employeeDAO();
		dao.getList();
	}
}
