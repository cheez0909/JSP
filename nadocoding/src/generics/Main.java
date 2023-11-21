package generics;

public class Main {

	public static void main(String[] args) {
//		int[] intarray = {1, 2, 3, 4, 5};
//		double[] douarray = {1.0, 2.0, 3.0};
		String[] strarray = {"사과", "배", "딸기", "토마토"};
//		boolean[] boolarray = {true, false, true, true};
		
//		printIntArray(intarray);
//		printDoubleArray(douarray);
//		printStringArray(strarray);
//		printBooleanArray(boolarray);
		System.out.println("================");
		
		Integer[] intarray = {1, 2, 3, 4, 5};
		Double[] douarray = {1.0, 2.0, 3.0};
		
		
		// 제네릭스는 객체를 지원함
		// 기본자료형을 지원하지 않음
		// 형변환이 필요함
		printArray(intarray);
		printArray(strarray);
		printArray(douarray);
}

	// 내용은 똑같지만 타입이 다르므로 long형 등 다른 타입이 추가되었을때
	// 메서드를 또 만들어야함
	// 이것을 줄이기 위해 제네릭스 등장
	private static void printBooleanArray(boolean[] boolarray) {
		for(boolean i : boolarray) {
			System.out.print(i + " ");
		}
	}

	private static void printStringArray(String[] strarray) {
		for(String i : strarray) {
			System.out.print(i + " ");
		}
	}

	private static void printDoubleArray(double[] douarray) {
		for(double i : douarray) {
			System.out.print(i + " ");
		}
	}

	private static void printIntArray(int[] intarray) {
		for(int i : intarray) {
			System.out.print(i + " ");
		}
	}
	
	// T : Type , teacher -> teacher
	// K : Key
	// V : value
	// 제네릭스
	private static <T> void printArray(T[] array) {
		for(T s : array) {
			System.out.print(s + " ");
		}
	}
}
