package Thread;

public class RunnableMain {

	public static void main(String[] args) {
		// 쓰레드는 쓰레드를 상속하거나
		// 러너블(인터페이스)를 구현하면 된다.
		// 런 메소드 정의
		// 러너블객체 생성
		RunnavleCleanRoom_employee emp = new RunnavleCleanRoom_employee();
		Thread thr = new Thread(emp);
		thr.start();
		// 쓰레드 객체 생성 후 생성자로 러너블 인스턴스 넣고
		//		쓰레드.start
		// 인터페이스는 다중상속이 가능하기때문에
	
		cleanroom_boss();
	
	}

	public static void cleanroom_boss() {
		System.out.println("====(사장)청소를 시작합니다====");
		for(int i=2; i<=10; i+=2) {
			System.out.println("(사장)"+i + "번 방 청소를 시작합니다");
		}
		System.out.println("====(사장)청소를 끝냅니다====");
	}

}
