package Thread;

public class MultiThreadMain {

	public static void main(String[] args) {	
		// 멀티쓰레드 : 쓰레드가 여러개
		// 익명클래스로 만들기
		
		Runnable runnable1 = new Runnable() {
			
			@Override
			public void run() {
				System.out.println("====(직원1)청소를 시작합니다====");
				for(int i=1; i<=10; i+=2) {
					System.out.println("(직원1)" + i + "번 방 청소를 시작합니다");
				}
				System.out.println("====(직원1)청소를 끝냅니다====");	
			}
		};
	
		Runnable runnable2 = () -> {
			System.out.println("====(직원2)청소를 시작합니다====");
			for(int i=2; i<=10; i+=2) {
				System.out.println("(직원2)" + i + "번 방 청소를 시작합니다");
			}
			System.out.println("====(직원2)청소를 끝냅니다====");	
		};
	
	
		Thread thr1 = new Thread(runnable1);
		Thread thr2 = new Thread(runnable2);
		
		
		thr1.start();
		thr2.start();
		
	
	
	}

}
