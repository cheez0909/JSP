package Wrapper;

import java.util.ArrayList;
import java.util.Collections;

public class ArrayListMain {

	public static void main(String[] args) {
		// 컬렉션 프레임워크
		// 배열은 크기가 고정이 됨
		// 컬렉션 프레임워크는 원하는 만큼 추가 및 삭제가 가능하고 정렬이 가능하다
		// List, Set, Map
		// List - ArraryList, LinkedList
		
		ArrayList<String> list = new ArrayList<>();
		
		// 데이터 추가
		list.add("유재석");
		list.add("강호동");
		list.add("조세호");
		
		
		// 데이터 조회
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		System.out.println(list.get(2));
		
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		// 데이터 삭제
		System.out.println("총 인원 : "+list.size());
		list.remove("강호동");
		
		System.out.println("총 인원 : " + list.size());
		// 삭제하면 한 칸씩 앞으로 당겨짐
		System.out.println(list.get(1));
		
		System.out.println("총 인원 : " + list.size()); // 2 
		list.remove(list.size()-1); // 마지막 데이터를 삭제한다.
		System.out.println("총 인원 : " + list.size()); // 1 
		
		// 데이터 변경
		list.set(0, "신동엽");
		for(String num : list) {
			System.out.println(num);
		}
		
		// 확인 : 인덱스 값
		System.out.println(list.indexOf("신동엽"));
		
		// 리스트 내에 포함되었는가??
		if(list.contains("김종국")) {
			System.out.println("포힘");
		}else {
			System.out.println("불포함");
		}
	
		
		// 전체 삭제
		list.clear();
		if(list.isEmpty()) {
			System.out.println("클리어되었습니다.");
		}else {
			System.out.println("학생 수 : " +list.size());
		}
		
		list.add("유재석");
		list.add("강호동");
		list.add("조세호");
		
		// 정렬
		Collections.sort(list);
		for(String num : list) {
			System.out.println(num);
		}
		
	}
	

}
