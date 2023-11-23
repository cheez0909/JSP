package library.dao;

import java.sql.SQLException;

import library.util.DBConnectionPool;

public class MemberDAO extends DBConnectionPool{
	
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
