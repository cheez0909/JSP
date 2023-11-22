package Thread;

public class JoinMain {

	public static void main(String[] args) {
		// 러너블 그대로
		// 쓰레드.join() 초를 넣으면 그때까지 대기 후  다음 쓰레드 실행
		// 쓰레드가 종료될 때까지 기다렸다가 다음 메소드가 실행됨
		// 쓰레드.sleep(1000) 포문 내에 삽십
		RunnavleCleanRoom_employee emp = new RunnavleCleanRoom_employee();
		Thread thr = new Thread(emp);
		thr.start();
		
		try {
			thr.join(100);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		cleanroom_boss();
	}

	
	public static void cleanroom_boss() {
		System.out.println("====(사장)청소를 시작합니다====");
		for(int i=2; i<=10; i+=2) {
			System.out.println("(사장)"+i + "번 방 청소를 시작합니다");
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		System.out.println("====(사장)청소를 끝냅니다====");
	}
}
