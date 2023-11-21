package generics.coffee;

public class CoffeeByName {
	public String name;

	public CoffeeByName(String name) {
		this.name = name;
	}
	
	public void ready() {
		System.out.println(name+"님 준비되었습니다.");
	}
	
}
