package generics.coffee;

// CoffeeUser 클래스를 상속하는 타입만 올 수 있다.
public class CoffeeByUsersGenerics<T extends CoffeeUser> {

	public T name;

	public CoffeeByUsersGenerics(T name) {
		this.name = name;
	}
	
	public void ready() {
		System.out.println(name.name + "님 안녕하세요");
		name.point();
	}
}
