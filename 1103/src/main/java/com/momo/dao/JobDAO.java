package com.momo.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import com.momo.DBConnection;
import com.momo.Job;

public class JobDAO extends DBConnection{
	// 생성자를 통해서 db 연결
	public JobDAO(ServletContext application) {
		super(application);
	}
	
	public List<Job> getList() {
		List<Job> list = new ArrayList<>();
		// 질의 실행(크리에이트)
		try {
			stmtl = con.createStatement();
			rs = stmtl.executeQuery("select * from job");
			while(rs.next()) {
				Job job = new Job();
				job.setJob_code(rs.getString("Job_code"));
				job.setJob_name(rs.getString("Job_name"));
				list.add(job);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
}
