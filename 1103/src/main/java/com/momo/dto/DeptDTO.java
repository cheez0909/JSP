package com.momo.dto;

public class DeptDTO {
	private String DEPT_ID;
	private String DEPT_TITLE;
	private String local_name;
	private String LOCATION_ID;
	public String getLOCATION_ID() {
		return LOCATION_ID;
	}
	public void setLOCATION_ID(String lOCATION_ID) {
		LOCATION_ID = lOCATION_ID;
	}
	public String getDEPT_ID() {
		return DEPT_ID;
	}
	public void setDEPT_ID(String dEPT_ID) {
		DEPT_ID = dEPT_ID;
	}
	public String getDEPT_TITLE() {
		return DEPT_TITLE;
	}
	public void setDEPT_TITLE(String dEPT_TITLE) {
		DEPT_TITLE = dEPT_TITLE;
	}
	public String getLocal_name() {
		return local_name;
	}
	public void setLocal_name(String lOCATION_ID) {
		local_name = lOCATION_ID;
	}
	
	public String toString() {
		return DEPT_ID + " " + DEPT_TITLE + " " + local_name;
	}
}
