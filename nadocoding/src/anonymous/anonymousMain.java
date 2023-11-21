package anonymous;

public class anonymousMain {

	public static void main(String[] args) {

		
		coffee cof = new coffee() {
			@Override
			public void order() {
				super.order();
				System.out.println("서비스입니다");
			}
		};
		
		cof.order();
	}

}

class coffee {
	public void order() {
		System.out.println("주문하신 커피 나왔습니다.");
	}
}