package library.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import library.dto.fileDTO;
import library.util.DBConnectionPool;

public class fileDAO extends DBConnectionPool {

	public int regFile(fileDTO filedto) {
		
		String sql = "insert into tbl_file values(SEQ_TBL_FILE.NEXTVAL, ?, ?, ?, ?, ?, sysdate)";
		int res=0;
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, filedto.getName());
			pstmt.setString(2, filedto.getTitle());
			pstmt.setString(3, filedto.getCate());
			pstmt.setString(4, filedto.getOfile());
			pstmt.setString(5, filedto.getSfile());
			res = pstmt.executeUpdate();
			System.out.println(res + "건이 실행되었습니다.");
		} catch (SQLException e) {
			
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return res;
	}

	public List<fileDTO> getList() {
		List<fileDTO> list = new ArrayList<>();
		String sql = "select * from tbl_file order by file_no desc";
		
		 try {
			pstmt =  con.prepareStatement(sql);
			rs =  pstmt.executeQuery();
			while(rs.next()){
				
				fileDTO dto = new fileDTO();
				
				dto.setFile_no(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				dto.setPostdate(rs.getString(7));
				list.add(dto);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}	
}
