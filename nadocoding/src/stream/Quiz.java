package stream;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Quiz {

	public static void main(String[] args) {

		// 스트림을 이용하여 미술관 방문 손님에게 적절한 입장료를 안내하는 프로그램을 작성하시오
		
		// 조건
		// 손님 이름 및 나이 정보를 위한 customer 클래스 생성
		// 입장료는 1인당 5000원
		// 20세 이상의 손님들에게만 부과
		
		// 챈들러50, 레이첼42, 모니카21, 벤자민18, 제임스5
		
		List<Customer> cus = new ArrayList<>();
		cus = Arrays.asList(new Customer("챈들러", 50), new Customer("레이첼", 42), new Customer("모니카", 21), new Customer("벤자민", 18), new Customer("제임스", 5));
		cus.stream().map(x -> x.age >= 20 ? x.name + " 5000원 입니다" : x.name + "무료입니다.").forEach(System.out::println);
		
		
		
	}

}


class Customer{
	String name;
	int age;
	public Customer(String name, int age) {
		this.name = name;
		this.age = age;
	}
}
