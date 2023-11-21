package generics.coffee;

public class CoffeeUser {
	
	public String name;

	public CoffeeUser(String name) {
		this.name = name;
	}
	
	public void point() {
		System.out.print(this.name + "님 포인트적립되었습니다.");
	}
}
