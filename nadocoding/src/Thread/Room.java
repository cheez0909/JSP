package Thread;

public class Room {
	private int roomnumber = 1;
	
	synchronized public void clean(String name) {
		System.out.println(name + "님이 " + roomnumber +"번 방을 청소중입니다");
		roomnumber++;
	}
	
//	public void clean(String name) {
//		System.out.println(name + "님이 " + roomnumber +"번 방을 청소중입니다");
//		roomnumber++;
//	}
}
