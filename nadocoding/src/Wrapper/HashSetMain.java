package Wrapper;

import java.util.HashSet;
import java.util.LinkedHashSet;

public class HashSetMain {

	public static void main(String[] args) {
		// set은 중복을 허용하지 않음
		HashSet<String> set = new HashSet<>();
		set.add("김");
		set.add("밥");
		set.add("계란");
		set.add("오이");
		set.add("참치");
		set.add("우엉");
		set.add("햄");
		set.add("햄");
		
		System.out.println("총 개수 : "+set.size());

		// 순회 :  순서 마음대로 순서x, 중복x
		for (String num : set) {
			System.out.println(num);
		}
		
		// 확인
		if(set.contains("김")) {
			System.out.println("포람");
		}else {
			System.out.println("불포함");
		}
		
		// 삭제
		System.out.println("총 개수 : "+set.size());
		set.remove("햄");
		System.out.println("총 개수 : "+set.size());
		
		
		// 전체삭제
		set.clear();
		if(set.isEmpty()) {
			System.out.println(set.size());
		} else {
			System.out.println(set.size());
		}
		
		HashSet<Integer> num = new HashSet<>();
			num.add(20);
			num.add(2);
			num.add(3);
			num.add(45);
			num.add(5);
			
			System.out.println(num);
			
			// LinkedHashSet는 순서를 보장함 
			HashSet<Integer> num1 = new LinkedHashSet<>();
			num1.add(20);
			num1.add(2);
			num1.add(3);
			num1.add(45);
			num1.add(5);
			System.out.println(num1);
			
			
	}

}
