package generics;

import generics.coffee.CoffeByGenerics;
import generics.coffee.CoffeeById;
import generics.coffee.CoffeeByName;
import generics.coffee.CoffeeByReady;
import generics.coffee.CoffeeByUsersGenerics;
import generics.coffee.CoffeeUser;
import generics.coffee.CoffeeVipUser;

public class CoffeeMain {
	public static void main(String[] args) {
		
		CoffeeById c1 = new CoffeeById("23");
		CoffeeByName c2 = new CoffeeByName("dani");
		
		c1.ready();
		c2.ready();
		
		System.out.println("======================");
		CoffeeByReady c3 = new CoffeeByReady(34);
		CoffeeByReady c4 = new CoffeeByReady("반가워");
		c3.ready();
		c4.ready();
		
		// 변수를 가져오고 싶을 때 형변환이 필요하다.
		System.out.println("\n======================");
		int c3Num = (int) c3.obj;
		String c4Str = (String) c4.obj;
		System.out.println(c3Num);
		System.out.println(c4Str);
		
		// c3Num = (int) c4.obj;
		
		// 제네릭을 사용하면 객체를 생성할 때 타입을 지정해주기 때문에 형변환이 별도로 필요하지 않다.
		System.out.println("\n======================");
		CoffeByGenerics<Integer> c5 = new CoffeByGenerics<Integer>(25);
		c5.ready();
		
		int c5Num = c5.name;
		System.out.println(c5Num);
		
		CoffeByGenerics<String> c6 = new CoffeByGenerics<String>("나는 나비");
		c6.ready();
		System.out.println("\n======================");
		String c6Num = c6.name;
		System.out.println(c6Num);
		
		CoffeeUser user1 = new CoffeeUser("홍길동");
		user1.point();
		CoffeeUser user2 = new CoffeeVipUser("강호동");
		user2.point();
				
		// 상속받은 것만 사용할 수 있음
		CoffeeByUsersGenerics<CoffeeUser> user3 = new CoffeeByUsersGenerics<>(new CoffeeUser("홍길동"));
		user3.ready();
		CoffeeByUsersGenerics<CoffeeUser> user4 = new CoffeeByUsersGenerics<>(new CoffeeVipUser("홍길동2"));
		user4.ready();		
	
		System.out.println("\n======================");
		orderCoffee("홍길동", "아이스아메리카노");
		orderCoffee(45, "라떼");
	}
	
	// 여러 값을 넣고 싶을 때
	public static <T, V> void orderCoffee(T name, V coffee){
		System.out.println(name+"님 " + coffee + "준비되었습니다.");
		
	}
}
