package generics.coffee;

public class CoffeeById {
	public String id;

	public CoffeeById(String id) {
		this.id = id;
	}
	
	public void ready() {
		System.out.println(id+"님 준비되었습니다.");
	}
	
}
