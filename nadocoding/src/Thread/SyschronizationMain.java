package Thread;

public class SyschronizationMain {

	public static void main(String[] args) {
		// 동기화
		

		// 두 쓰레드가 동시에 사용
		// Syschronized 붙이기
		
		// 쓰레드가 동시에 수행중일때
		// 하나가 에러나도 다른 하나는 실행됨
		
		
		Room room = new Room();
		
		Runnable runnable1 = new Runnable() {
			
			@Override
			public void run() {
				System.out.println("====(직원1)청소를 시작합니다====");
				for(int i=1; i<=5; i++) {
					room.clean("직원1");
					
					try {
						Thread.sleep(100);
					} catch (InterruptedException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					if(i==2) {
						throw new RuntimeException("못해!!");
					}
				}
					
				System.out.println("====(직원1)청소를 끝냅니다====");	
			}
		};
	
		Runnable runnable2 = () -> {
			System.out.println("====(직원2)청소를 시작합니다====");
			for(int i=1; i<=5; i++) {
				room.clean("직원2");
			}
			System.out.println("====(직원2)청소를 끝냅니다====");	
		};
	
	
		Thread thr1 = new Thread(runnable1);
		Thread thr2 = new Thread(runnable2);
		
		
		thr1.start();
		thr2.start();
		
		
	}

}
