package Thread;

public class CleanRoom_employee extends Thread{
	public void run() {
		System.out.println("====(직원)청소를 시작합니다====");
		for(int i=1; i<=10; i+=2) {
			System.out.println("(직원)" + i + "번 방 청소를 시작합니다");
		}
		System.out.println("====(직원)청소를 끝냅니다====");
	}

}
