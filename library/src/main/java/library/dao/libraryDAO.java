package library.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import library.dto.libraryDTO;
import library.util.DBConnectionPool;

public class libraryDAO extends DBConnectionPool{


	
	// 조회하는 메서드 만들기
	public List<libraryDTO> getList() {
		
		List<libraryDTO> list = new ArrayList<>();
		String sql ="select *\r\n"
				+ "from book";
		try {
			stmtl = con.createStatement();
			rs = stmtl.executeQuery(sql);
			while(rs.next()) {
				libraryDTO dto = new libraryDTO();
				dto.setNo(rs.getString("NO"));
				dto.setTitle(rs.getString("TITLE"));
				dto.setRentyn(rs.getString("RENTYN"));
				dto.setAuthor(rs.getString("AUTHOR"));
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
