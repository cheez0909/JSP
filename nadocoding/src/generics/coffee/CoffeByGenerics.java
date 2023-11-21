package generics.coffee;

// 클래스를 만들땐 뒤에
public class CoffeByGenerics <T>{
 
	public T name;

	public CoffeByGenerics(T name) {
		super();
		this.name = name;
	}
	
	public void ready() {
		System.out.print(name + "님 환영합니다");
	}
}
