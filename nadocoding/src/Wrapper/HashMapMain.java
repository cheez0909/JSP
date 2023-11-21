package Wrapper;

import java.util.HashMap;
import java.util.Map;

public class HashMapMain {

	public static void main(String[] args) {

		// 맵(key, value)
		HashMap<String, Integer> hashmap = new HashMap<>();
		
		// 데이터 추가
		hashmap.put("사람1", 20);
		hashmap.put("사람2", 30);
		hashmap.put("사람3", 40);

		System.out.println("총 인원 : " + hashmap.size());
		
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		// 조회
		System.out.println(hashmap.get("사람1"));
		System.out.println(hashmap.get("사람2"));
		System.out.println(hashmap.get("사람3"));
		
		// 확인
		if(hashmap.get("서장훈")!=null) {
			int age = hashmap.get("서장훈");
			hashmap.put("서장훈", ++age);
		}else {
			hashmap.put("서장훈", 1);
			System.out.println("신규등록하였습니다.");
		}
		
		// 삭제
		System.out.println("총 인원 : " + hashmap.size());
		hashmap.remove("사람1");
		System.out.println("총 인원 : " + hashmap.size());
		
		// 전체 삭제
		hashmap.clear();
		if(hashmap.isEmpty()) {
			System.out.println("클리어");
		}else {
			System.out.println(hashmap);
		}
		
		hashmap.put("사람1", 20);
		hashmap.put("사람2", 30);
		hashmap.put("사람3", 40);

		// 키값 구하기
		for(String key : hashmap.keySet()) {
			System.out.println(key);
		}
	
		// value 확인
		for(Integer value : hashmap.values()) {
			System.out.println(value);
		}
		
		// 키, 밸류 한거번에 확인
		for(String key : hashmap.keySet()) {
			System.out.println("key : " + key + " value : " + hashmap.get(key));
		}
		
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		hashmap.put("사람3", 40);
		hashmap.put("사람3", 50);
		hashmap.put("사람3", 60);
		// 순서를 보장하지 않음, 중복도 허용하지 않음
		// 순서를 보장받고 싶을 때 LinkedHashMap 사용
		for(String key : hashmap.keySet()) {
			System.out.println("key : " + key + " value : " + hashmap.get(key));
		}
		
	}
}
