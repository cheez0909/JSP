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
		
		try {
			String where ="";
			if(!"".equals(criteria.getSearchField()) &&
					!"".equals(criteria.getSearchWord())) {
				
				where = "where " + criteria.getSearchField() + " like '%"
						+ criteria.getSearchWord() + "%'";
				
			}
			String sql ="select *\r\n"
					+ "from (select rownum rowno, b.*\r\n"
					+ "from (select *\r\n"
					+ "from book\r\n"
					+ where
					+ "order by no desc) b)\r\n"
					+ "where rowno between ? and ?";
			
			/*
			 * 서브쿼리를 나눠서 before, sql, after로 나눠서 할 수도 있다.
			 * */
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, criteria.getStartNo());
			pstmt.setInt(2, criteria.getEndNo());
			
			rs =  pstmt.executeQuery();
			
			while(rs.next()) {
				libraryDTO dto = new libraryDTO();
				dto.setRowno(rs.getString("ROWNO"));
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
	public int insert(String title, String yn, String Author) {
		String sql = "insert into book values (seq_book_no.NEXTVAL, ?, ?, ?)";
		int res = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, yn);
			pstmt.setString(3, Author);
			
			
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
	public int getTotalCnt(Criteria criteria) {
		int res = 0;
		
		try {
			
			String where ="";
			if(!"".equals(criteria.getSearchField()) &&
					!"".equals(criteria.getSearchWord())) {
				
				where = " where " + criteria.getSearchField() + " like '%"
						+ criteria.getSearchWord() + "%'";
				
			}
			
			String sql = "select count(*)\r\n"
					+ "from book" 
					+ where;
			
			System.out.println("Sql" + sql);
			
			pstmt = con.prepareStatement(sql);
			//rs = stmtl.executeQuery(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				res = rs.getInt(1);
				System.out.println("게시물수 " + res);
			}
			
			System.out.println(res);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	/*
	 * 
	 * 쿼리를 붙여 만드는 메서드 만들기
	 * 
	 */
	/*
	String pageingQuery(String sql) {
		String before = "select * from";
		String sql = "select * from";
		String after = "select * from";
		return before + sql + after;
	}
	*/
	
	// 수정하기 메서드 만들기
	public int modify(String title, String rentyn, String author, String no) {
		String sql = "update book set \r\n"
				+ "title=?\r\n"
				+ ", rentyn=?\r\n"
				+ ", author=?\r\n"
				+ "where no = ?";
		int res = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, rentyn);
			pstmt.setString(3, author);
			pstmt.setString(4, no);
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
	
	// No 카운트 하기
	public String noMax() {
		String res = "";
		try {
		String sql = "select max(no)\r\n"
				+ "from book";
				
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			res = rs.getString(1);
		}		
		return res;
	} catch (SQLException e) {
		e.printStackTrace();
	}
		return res;	
	}
}
