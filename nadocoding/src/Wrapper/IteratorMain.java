package Wrapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map.Entry;

public class IteratorMain {

	public static void main(String[] args) {

		// 이터레이터 : 순회하며 삭제 가능
		List<String> member = new ArrayList<>();
		
		member.add("사람1");
		member.add("알 수 없음");
		member.add("사람2");
		member.add("알 수 없음");
		member.add("사람3");
		member.add("알 수 없음");
		member.add("사람4");
		member.add("알 수 없음");
		member.add("사람5");
		member.add("알 수 없음");
		member.add("사람6");
		member.add("알 수 없음");
		
		// 커서를 제일 처음으로
		Iterator<String> it = member.iterator();
		System.out.println(it.next());
		System.out.println(it.next());
		System.out.println(it.next());
		System.out.println(it.next());
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		// 커서를 제일 처음으로
		it = member.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
		
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		// "알 수 없음" 삭제해보기
		it = member.iterator();
		while(it.hasNext()) {
			String s = it.next();
			if(s.contains("알 수 없음")) {
				it.remove();
			}
		}
		// 알 수 없음 삭제 후 
		// 커서를 제일위로 이동
		it = member.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		// HashSet 도 가능하다 순서X
		HashSet<String> hashset = new HashSet<>();
		hashset.add("유재석");
		hashset.add("박명수");
		hashset.add("정준하");
		Iterator<String> hasit = hashset.iterator();
		while(hasit.hasNext()) {
			System.out.println(hasit.next());
		}
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		// hashmap도 가능
		HashMap<String, Integer> hashmap = new HashMap<>();
		hashmap.put("유재석", 20);
		hashmap.put("강호동", 430);
		hashmap.put("홍길동", 5620);

		// hashmap.iterator() 불가능, key와 value값으로 나누어야함
		
		Iterator<String> hasmapkey = hashmap.keySet().iterator();
		while(hasmapkey.hasNext()) {
			System.out.println(hasmapkey.next());
		}
		
		
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		Iterator<Integer> hasmapvalue = hashmap.values().iterator();
		while(hasmapvalue.hasNext()) {
			System.out.println(hasmapvalue.next());
		}
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		// 키와 밸류값 한꺼번에 가져오기
		Iterator<Entry<String, Integer>> has = hashmap.entrySet().iterator();
		while(has.hasNext()) {
			System.out.println(has.next());
		}
	}

}
