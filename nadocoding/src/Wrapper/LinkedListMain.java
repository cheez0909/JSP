package Wrapper;

import java.util.Collections;
import java.util.LinkedList;

public class LinkedListMain {

	public static void main(String[] args) {
		// 링크드 리스트
		
		LinkedList<String> list = new LinkedList<>();
		
		list.add("강호동");
		list.add("유재석");
		list.add("김종국");
		list.add("조세호");
		list.add("신동엽");
		
		// 데이터 조회
		System.out.println(list.get(2));
		System.out.println(list.get(1));
		System.out.println(list.getFirst());
		System.out.println(list.getLast());
	
		// 추가
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		list.addFirst("이효리");
		for(String num : list) {
			System.out.println(num);
		}
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		list.addLast("장나라");
		for(String num : list) {
			System.out.println(num);
		}
		
		System.out.println("리스트 추가 전 : "+list.get(1));
		list.add(1, "아이유");
		System.out.println("리스트 추가 후 : "+list.get(1));
	
	
		// 삭제
		System.out.println("총 인원 : " + list.size() );
		list.remove(list.size()-1);
		System.out.println("총 인원(후) : " + list.size() );
		
		// 처음 학생과 마지막 학생 삭제
		System.out.println("총 인원 : " + list.size() );
		list.removeFirst();
		list.removeLast();
		System.out.println("총 인원(후) : " + list.size() );
		
		// 변경
		
		list.set(1, "이수근");
		System.out.println(list.get(1));
	
		System.out.println(list.indexOf("아이유"));
		
		if(list.contains("아이유")) {
			System.out.println(list);
		} else {
			System.out.println("불포함");
		}
		
		// 전체 삭제
		list.clear();
		if(list.isEmpty()) {
			System.out.println("리스트가 비었습니다");
		}else {
			System.out.println("리스트가 차있습니다.");
		}
		
		
		list.add("강호동");
		list.add("유재석");
		list.add("김종국");
		list.add("조세호");
		list.add("신동엽");
		
		Collections.sort(list);
		for(String num : list) {
			System.out.println(num);
		}
		
	}

}
