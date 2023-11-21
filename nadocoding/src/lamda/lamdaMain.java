package lamda;

public class lamdaMain {

	public static void main(String[] args) {
		
		kwexchange kw = new kwexchange();
		
		// 없애고 스태틱 메서드 이용해보기
		// kw.curr(5);
		
		// kw에 있는 curr가 호출된것
		convertUSD(kw, 4);
		
		convertUSD((USD) -> System.out.println(USD + "달러는 한국 돈으로 " + USD * 1400 + "원 입니다."), 2);
		
		// 인터페이스를 함수형으로 만들 수 있다.
		// 함수형 인터페이스
		// 이렇게 사용하려면 인터페이스 내의 딱 하나의 추상메소드만 있어야 한다.
		// 두개이상일 경우 사용할 수 없음
		// @FunctionalInterface라고 어노테잇ㄴ 달아주기!
		exchange ex = (USD) -> System.out.println(USD + "달러는 한국 돈으로 " + USD * 1400 + "원 입니다.");
		
		convertUSD(ex, 5);
		
		// 전달값이 하나도 없다면?
		exchangenull ex1 = () -> System.out.println("1달러는 1400원 입니다.");
		ex1.curr();
		
		// 두줄 이상의 코드가 있다면?
		exchangenull ex2 = () -> {
			int USD = 1;
			int kws = 1400;
			System.out.println(USD * kws + "원 입니다");
		};
		ex2.curr();
		
		// 전달값이 두개인 경우?
		exchangetwo ex3 = (x, y) -> System.out.println(x*y+"원 입니다");
		ex3.curr(4, 1400);
		
		// 반환값이 있는 경우
		exchangereturn ex4 = (x, y) -> x*y;
		int result = ex4.curr(4, 1400);
		System.out.println(result);
	}
	
	public static void convertUSD(exchange ex, int USD) {
		ex.curr(USD);
		
	}
	
	// 람다식
	// (전달값1, 전달값2,... ) -> {코드}
	
//	public void print() {
//		String s = "test";
//		System.out.println(s);
//	}
	
	// 람다식은 
	// 접근제어자 필요x
	// 메소드이름 필요x
	// 리턴 형태 필요x
	
//	() -> {
//	String s = "test";
//	System.out.println(s);
//	}

//	public void print(String s) {
//		System.out.println(s);
//	}
	
	// 접근제어자, 리턴형태, 메소드이름 x
	// 내용이 한줄일 경우 중괄호, 세미콜론 필요x
	// 컴파일할때 전달받은 매개변수의 형태를 알 수 있기 때문에 String도 불필요
	// 전달값이 하나일때 괄호도 필요없음
//	s -> System.out.println(s)
	
	// 리턴값이 있을 땐 중괄호 없앨 수 없음
//	(x, y) -> { return x+y; }
	
	// 리턴값을 지워서 중괄호를 없애자!
//	(x, y) ->  x+y
	
	
	
}
