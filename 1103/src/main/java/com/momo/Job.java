package com.momo;

public class Job {
	private String job_name;
	private String job_code;
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	public String getJob_code() {
		return job_code;
	}
	public void setJob_code(String job_code) {
		this.job_code = job_code;
	}
	
	@Override
	public String toString() {
		return job_name + "/" + job_code;
	}

}
