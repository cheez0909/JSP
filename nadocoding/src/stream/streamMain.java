package stream;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class streamMain {

	public static void main(String[] args) {
		// 스트림 생성
		
		// 배열에서 스트림 만들기
		// 배열 선언
		// Arrays.stream
		int[] intArray = {1, 2, 3, 4, 5};
		IntStream intStream = Arrays.stream(intArray);
		
		
		
		// 문자열 배열선언
		// Arrays.stream
		String[] strArray = {"hi", "hello", "thanks"};
		Stream<String> strStream = Arrays.stream(strArray);
		
		// 리스트 생성 후
		// 스트림 사용하여 요소 한꺼번에 넣기
		// Arrays.asList
		List<String> list = new ArrayList<>();
//		list.add("hi");
//		list.add("hello");
//		list.add("thanks");
		list = Arrays.asList("hi", "hello", "thanks");
//		System.out.println(list.size());
		
		// 컬렉션에서 스트림 만들기
		// .stream()
		Stream<String> listStream = list.stream();
		
		// stream.of 로 만들 수 있음
		Stream<String> listStreamOf = Stream.of("hi", "hello", "thanks");
	
	
	
		
		
		// 스트림 사용
		// 스트림은 재사용이 불가능 하기 때문에 한 번 사용하고
		// 다시 생성해야함
		// 중간 연산(Intermediate Operation) : filter, map, sorted, distinct, skip...
		// 최종 연산(Terminal Operation) : count, min, max, forEach, anyMatch, allMatch....
		
		// 3 이상만 출력하기
		// 중간연산 : filter 최종연산 foreach
		Arrays.stream(intArray).filter(x -> x>=3).forEach(x -> System.out.println(x));
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		// Arrays.stream(intArray).filter(x -> x>=3).forEach(System.out::println);
		
		
		// 3이상이 몇개인지
		System.out.println(Arrays.stream(intArray).filter(x -> x>=3).count());
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		// 90 이상들의 합
		int[] intArray1 = {10, 20, 100, 90, 150};
		IntStream intStream1 = Arrays.stream(intArray1);
		int result = intStream1.filter(x->x>=90).sum();
		System.out.println(result);
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		//90 점 이상인 점수들을 정렬
		Arrays.stream(intArray1).filter(x -> x>=90).sorted().forEach(System.out::println);
		
		// c로 시작하는 프로그래밍 언어
		// .startsWith
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		String[] lang = {"Java", "phython", "c", "c++", "c#", "Javascript", "Jsp", "Spring"};
		Arrays.stream(lang).filter(x -> x.startsWith("c")).forEach(System.out::println);
		
		// java라는 글자를 포함하는 언어
		// .contains
		
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		
		Arrays.stream(lang).filter(x -> x.contains("Java")).forEach(System.out::println);
		
		
		// 리스트를 이용해서 글자길이가 4이하인 언어를 정렬해서 출력
		// .length
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		Stream.of("Java", "phython", "c", "c++", "c#", "Javascript", "Jsp", "Spring")
		.filter(x -> x.length()<=4)
		.sorted()
		.forEach(System.out::println);
		
		// 4글자 이하의 언어 중에서 c를 포함하는 언어
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		Stream.of("Java", "phython", "c", "c++", "c#", "Javascript", "Jsp", "Spring")
		.filter(x -> x.length()<=4)
		.filter(x-> x.contains("c"))
		.forEach(System.out::println);
		
		
		// 4글자 이하의 언어 중에서 c를 포함하는 언어가 하나라도 있는지
		// .anyMatch -> 결과값이 boolean
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		boolean res = Stream.of("Java", "phython", "c", "c++", "c#", "Javascript", "Jsp", "Spring")
		.filter(x -> x.length()<=4)
		.anyMatch(x-> x.contains("c"));
		
		System.out.println(res);
		
		// 4글자 이하의 언어들은 모두 x라는 글자를 포함하는지 여부?
		// .allMatch
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		boolean allres = Stream.of("Java", "phython", "c", "c++", "c#", "Javascript", "Jsp", "Spring")
		.filter(x -> x.length()<=4)
		.allMatch(x-> x.contains("c"));
		
		System.out.println(allres);
		
		// 4글자 이하의 언어들 중에서 c를 포함하는 언어 뒤에 (어려워요) 붙이기
		// .map(x -> x + "어려워요")
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		Stream.of("Java", "phython", "c", "c++", "c#", "Javascript", "Jsp", "Spring").filter(x -> x.length()<=4).filter(x -> x.contains("c")).map(x -> x + "어려워요").forEach(System.out::println);
		
		
		// J라는 글자를 포함하는 언어를 대문자로 출력
		// .map(String::toUpperCase)
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		List<String> lists = new ArrayList<>();
		lists = Arrays.asList("Java", "phython", "c", "c++", "c#", "Javascript", "Jsp", "Spring");
		lists.stream().filter(x -> x.contains("J")).map(String::toUpperCase).forEach(System.out::println);
		
	
		// J라는 글자를 포험하는 언어를 대문자로 변경하여 리스트로 저장 (출력만 하고 끝X)
		// .collect(Collectors.toList())
		List<String> reslist = lists.stream().filter(x -> x.contains("J")).map(String::toLowerCase).collect(Collectors.toList());
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		System.out.println(reslist);
		System.out.println("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		lists.stream().filter(x -> x.contains("J")).map(String::toLowerCase).collect(Collectors.toList()).forEach(System.out::println);
		
		
	}
}
