package com.momo.dao;

import java.sql.SQLException;

import com.momo.DBConnectionPool;
import com.momo.dto.memberDTO;

public class memberDAO extends DBConnectionPool{

	//public memberDTO login(memberDTO member)
	public memberDTO login(String id, String pw) {
		try {
			memberDTO members = new memberDTO();
			
			
			String sql = "select *\r\n"
					+ "from member\r\n"
					+ "where id= ? and pass= ? ";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			
			rs = pstmt.executeQuery();
			
			//while(rs.next()) {
			//	for(int i=1; i<=rs.getMetaData().getColumnCount(); i++) {
			//		rs.getString(i);					
			//	}
			//}
			
			if(rs.next()) {
				members.setId(rs.getString("ID"));
				members.setPass(rs.getString("PASS"));
				members.setName(rs.getString("NAME"));
				members.setRegidate(rs.getString("REGIDATE"));
				return members;
			} else {
				return null;
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
}
