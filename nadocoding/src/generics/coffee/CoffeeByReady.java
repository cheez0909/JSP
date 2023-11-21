package generics.coffee;

public class CoffeeByReady {

	public Object obj;

	public CoffeeByReady(Object obj) {
		this.obj = obj;
	}

	public void ready() {
		System.out.print(obj + "님 준비되었습니다.");
	}
}
