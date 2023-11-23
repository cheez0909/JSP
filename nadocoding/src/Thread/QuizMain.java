package Thread;

public class QuizMain {

	public static void main(String[] args) {

		// 상품1, 2가 5개 씩 있다.
		
		// 한 박스는 5개에 들어감
		// 상품 준비 , 세트 상품 포장
		
		wrapper wra1 = new wrapper();
		wrapper wra2 = new wrapper();
		wrapper wra3 = new wrapper();
		
		Runnable box1 = new Runnable() {
			
			@Override
			public void run() {
				for(int i=1; i<=5; i++) {
					wra1.box("상품a");
				}
			}
		};
	
		
		Runnable box2 = new Runnable() {
			
			@Override
			public void run() {
				for(int i=1; i<=5; i++) {
					wra2.box("상품b");
				}
			}
		};
	
		Thread thr1 = new Thread(box1);
		Thread thr2 = new Thread(box2);
	
		
		thr1.start();
		thr2.start();
		
		
		try {
			thr1.join(); // join을 이용하면 끝난 후 다음 쓰레드가 실행된다.
			thr2.join();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		Runnable box3 = new Runnable() {
			
			@Override
			public void run() {
				for(int i=1; i<=5; i++) {
					wra3.set();
				}
				
			}
		};
		
		
		Thread thr3 = new Thread(box3);
		thr3.start();

	}
}

class wrapper{
	int box = 1;
	public void box(String no) {
		System.out.println(no + "박스가" + box +"개 준비되었습니다");
		box++;
	}
	
	public void set() {
		System.out.println("세트포장이" + box +"개 준비되었습니다");
		box++;
	}
}


