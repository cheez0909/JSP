package com.momo.el;

public class MyELClass {
	/*
	 * 
	 * 주민등록번호를 입력 받아서 성별을 반환
	 * jumin:000000-0000000
	 * @param jumin
	 * @return 성별(남,여)
	 * 
	 */


	public String getGender(String jumin) {
		return Integer.parseInt(jumin.substring(jumin.indexOf("-")+1, jumin.indexOf("-")+2)) % 2 == 1 ? "남자" : "여자";
	}
	
//	public static void main(String[] args) {
//		MyELClass my = new MyELClass();
//		
//		System.out.println(my.getGender("123456-7891111"));
//		
//	}
}
