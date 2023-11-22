package library.util;

import java.sql.SQLException;
import java.util.Random;

public class Main extends DBConnection{


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
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
            // Close resources in the finally block to ensure they are released
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
	
	public static void main(String[] args) {
		Main test = new Main();
		for(int i=8; i<=100; i++) {
			Random random = new Random();
			int a = random.nextInt(100);
			int b = random.nextInt(0, 1);
			String[] str = {"Y", "N"};
			test.insert(i, "책"+a, str[b], "작가"+a);
		}
		test.close();
	}

}
