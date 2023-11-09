package com.momo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class DBConnectionEx {

	public static void main(String[] args) {
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id = "dani";
		String pw = "dani";
		
		Connection drive = null;
		Statement stat = null;
		ResultSet result = null;
		
		try {
			// 라이브러리 확인
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			// 커넥션 객체 생성
			drive = DriverManager.getConnection(url, id, pw);
			
			
			// 질의문 생성
			String sql = "update set job_name = ''";

			// 질의문 실행
			stat = drive.createStatement();
			
			// 결과를 담는
			result = stat.executeQuery(sql);
			
			List<String> exeu = new ArrayList<>();
			// job 객체 생성
			//  jobcode, jobname
			// 셋터 겟터 생성 후 삽입
			
			List<Job> jobs = new ArrayList<>();
			while(result.next()) {
				Job job1 = new Job();
				job1.setJob_code(result.getString("JOB_CODE"));
				job1.setJob_name(result.getString("JOB_NAME"));
				
				jobs.add(job1);
			}
			System.out.println(jobs);
			
			//System.out.println(Job.getJob_code());
			//System.out.println(Job.getJob_name());
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} 
		 catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			// 거꾸로 닫기
			try {
				if(result!=null) result.close();
				if(stat!= null) stat.close();
				if(drive!=null) drive.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}		
	}
}	

}
