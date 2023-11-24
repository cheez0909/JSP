package library.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import library.util.DBConnectionPool;

public class MemberDAO extends DBConnectionPool{
	
	
	// 회원조회
	public List<String> getListId(){
		String sql = "select id\r\n"
				+ "from member";
		List<String> list = new ArrayList<>();
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(rs.getString(1));
				System.out.println(rs.getString(1));
			}
			return list;
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
		return list;
	}
	
	
	// 회원가입
	public int join(String id, String pw, String name, String email) {
		String sql = "insert into member values (?, ?, ?, sysdate, ?)";
		int res = 0;
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
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


}
