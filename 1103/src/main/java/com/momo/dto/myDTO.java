package com.momo.dto;

public class myDTO {
	
	private String EMP_NAME;
	private String DEPT_TITLE; 
	private String JOB_NAME;
	public String getEMP_NAME() {
		return EMP_NAME;
	}
	public void setEMP_NAME(String eMP_NAME) {
		EMP_NAME = eMP_NAME;
	}
	public String getDEPT_TITLE() {
		return DEPT_TITLE;
	}
	public void setDEPT_TITLE(String dEPT_TITLE) {
		DEPT_TITLE = dEPT_TITLE;
	}
	public String getJOB_NAME() {
		return JOB_NAME;
	}
	public void setJOB_NAME(String jOB_NAME) {
		JOB_NAME = jOB_NAME;
	}
	
	public String toString() {
		return EMP_NAME + " " + DEPT_TITLE + " " + JOB_NAME;
	}
}
