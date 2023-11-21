package anonymous;

public class anonymousMain2 {

	public static void main(String[] args) {
		food home = getHome();
		home.cook();
	}
	
	public static food getHome() {
		return new food() {
		@Override
		public void cook() {
			System.out.println("엄마가 만들어준 요리");
		}
	};
}
}

abstract class food{
	public abstract void cook();
}