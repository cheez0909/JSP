package com.momo.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class CookieManager {

	public CookieManager() {
	}
	
	/** 
	 * 	쿠키를 생성 후 응답 객체에 저장
	 *	
	 *	응답객체에 저장 후 요청객체에 겟
	 *	쿠키 이름, 쿠키 값, 시간
	 *	
	 *	사용자에게 응답하기 위해서
	 *	응답객체를 매개변수로 전달 받는다.
	 *
	**/
	
	public static void makeCookie(
		HttpServletResponse response
		, String name
		, String value
		, int time) {
		// 쿠키 생성
		Cookie cookies = new Cookie(name, value);
		
		// 유지기간 설정
		cookies.setMaxAge(time);
		
		// 응답객체에 저장
		response.addCookie(cookies);
		}
	

	
	/**
	 * 
	 * 쿠키 값 가져오기
	 * 
	 * 요청 객체
	 * 쿠키 아이디
	 * 쿠키 밸류
	 * 
	 * 
	 */
	
	
	
	public static String getCookieValue(HttpServletRequest request, String name) {
		
		Cookie[] cookies = request.getCookies();
		
		// 쿠키가 하나도 저장되어 있지 않은 경우 getCookies 메서드를 호출하면 null을 반환
		
		if(cookies!=null) {
			for(Cookie num : cookies) {
				if(num.getName().equals(name)) {
					return num.getValue();
				}
			}
		}
		return "";
	}
	
	/*
	 * 쿠키 삭제
	 * 똑같은 이름의 쿠키를 저장하고
	 * 시간을 0으로 준다
	 */
	
//	public static void deleteCookie(HttpServletResponse response, HttpServletRequest request, String name) {
//			Cookie[] cookies = request.getCookies();
//		
//			if(cookies!=null) {
//				for(Cookie num : cookies) {
//					if(num.getName().equals(name)) {
//						num.setMaxAge(0);
//						response.addCookie(num);
//					}
//				}
//			}
//	}
	
	
	public static void deleteCookies(HttpServletResponse response, String name) {
		makeCookie(response, name, null, 0);
	}
	
}

