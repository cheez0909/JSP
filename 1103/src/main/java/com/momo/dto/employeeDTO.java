package com.momo.dto;

import javax.servlet.ServletContext;

import com.momo.DBConnection;

public class employeeDTO{
	private String EMP_ID;
	private String EMP_NAME;
	private String EMP_NO;
	private String EMAIL;
	private String PHONE;
	private String DEPT_CODE;
	private String JOB_CODE;
	private String SALARY;
	private String BONUS;
	private String MANAGER_ID;
	private String HIRE_DATE;
	public String getEMP_ID() {
		return EMP_ID;
	}


	public String toString() {
		return EMP_ID + " " + SALARY;
	}


	public void setEMP_ID(String eMP_ID) {
		EMP_ID = eMP_ID;
	}





	public String getEMP_NAME() {
		return EMP_NAME;
	}





	public void setEMP_NAME(String eMP_NAME) {
		EMP_NAME = eMP_NAME;
	}





	public String getEMP_NO() {
		return EMP_NO;
	}





	public void setEMP_NO(String eMP_NO) {
		EMP_NO = eMP_NO;
	}





	public String getEMAIL() {
		return EMAIL;
	}





	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}





	public String getPHONE() {
		return PHONE;
	}





	public void setPHONE(String pHONE) {
		PHONE = pHONE;
	}





	public String getDEPT_CODE() {
		return DEPT_CODE;
	}





	public void setDEPT_CODE(String dEPT_CODE) {
		DEPT_CODE = dEPT_CODE;
	}





	public String getJOB_CODE() {
		return JOB_CODE;
	}





	public void setJOB_CODE(String jOB_CODE) {
		JOB_CODE = jOB_CODE;
	}





	public String getSALARY() {
		return SALARY;
	}





	public void setSALARY(String sALARY) {
		SALARY = sALARY;
	}





	public String getBONUS() {
		return BONUS;
	}





	public void setBONUS(String bONUS) {
		BONUS = bONUS;
	}





	public String getMANAGER_ID() {
		return MANAGER_ID;
	}





	public void setMANAGER_ID(String mANAGER_ID) {
		MANAGER_ID = mANAGER_ID;
	}





	public String getHIRE_DATE() {
		return HIRE_DATE;
	}





	public void setHIRE_DATE(String hIRE_DATE) {
		HIRE_DATE = hIRE_DATE;
	}





	public String getENT_DATE() {
		return ENT_DATE;
	}





	public void setENT_DATE(String eNT_DATE) {
		ENT_DATE = eNT_DATE;
	}





	public String getENT_YN() {
		return ENT_YN;
	}





	public void setENT_YN(String eNT_YN) {
		ENT_YN = eNT_YN;
	}





	private String ENT_DATE;
	private String ENT_YN;

	
	
	
	
	

}
