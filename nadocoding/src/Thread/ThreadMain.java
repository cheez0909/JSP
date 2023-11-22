package Thread;

public class ThreadMain {

	public static void main(String[] args) {
		// 프로그램이 실행되어 돌아가고 있는 상태 -> 프로세스
		// 프로세스의 자원을 이용해서 수행하는 것 -> 쓰레드
		
		// 하나의 프로세스는 하나의 쓰레드
//		cleanroom();
		
	
		// 1 3 5 7 9 
		// 2 4 6 8 10
		
		CleanRoom_employee emp = new CleanRoom_employee();
		// emp.run(); -> 그냥 메소드를 실행시키는것
		// start로 실행해줘야 쓰레드가 run 메소드를 실행시켜 동시에 작업하게 된다.
		emp.start();
		
		cleanroom_boss();
	}
	
	// 청소 메서드
	// for문 10번 청소
	// 순서대로 실행하게됨
	public static void cleanroom() {
		System.out.println("====청소를 시작합니다====");
		for(int i=1; i<=10; i++) {
			System.out.println(i + "번 방 청소를 시작합니다");
		}
		System.out.println("====청소를 끝냅니다====");
	}
	
	
	// 클린쓰레드 새클래스 생성 후 쓰레드 상속
	// run 메소드 -> 직원 청소시작
	// start 메소드
	
	public static void cleanroom_boss() {
		System.out.println("====(사장)청소를 시작합니다====");
		for(int i=2; i<=10; i+=2) {
			System.out.println("(사장)"+i + "번 방 청소를 시작합니다");
		}
		System.out.println("====(사장)청소를 끝냅니다====");
	}

}
