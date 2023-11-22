package library.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import library.dto.Criteria;
import library.dto.libraryDTO;
import library.util.DBConnectionPool;

public class libraryDAO extends DBConnectionPool{


	
	// 조회하는 메서드 만들기
	public List<libraryDTO> getList(Criteria criteria) {
		
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
	
	// 추가하는 메서드 만들기
	public int insert(int i, String title, String yn, String Author) {
		String sql = "insert into book values (?, ?, ?, ?)";
		int res = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, i);
			pstmt.setString(2, title);
			pstmt.setString(3, yn);
			pstmt.setString(4, Author);
			res = pstmt.executeUpdate();
			return res;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
		return res;
	}
	
	// 1건을 조회화는 메서드 만들기
	public libraryDTO getList(int no) {
		
		libraryDTO dto = new libraryDTO();
		String sql ="select *\r\n"
				+ "from book\r\n"
				+ "where no=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto.setNo(rs.getString("NO"));
				dto.setTitle(rs.getString("TITLE"));
				dto.setRentyn(rs.getString("RENTYN"));
				dto.setAuthor(rs.getString("AUTHOR"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	// 총 게시물 수
	public int getTotalCnt() {
		int res = 0;
		String sql = "select count(*)\r\n"
				+ "from book";
		
		try {
			pstmt = con.prepareStatement(sql);
			//rs = stmtl.executeQuery(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = rs.getInt(1);
				//System.out.println(res);
			}
			
			System.out.println(res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
}
