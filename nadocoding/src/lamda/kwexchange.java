package lamda;

public class kwexchange implements exchange{

	@Override
	public void curr(int USD) {
		System.out.println(USD + "달러는 한국 돈으로 " + USD * 1400 + "원 입니다.");
	}

	
}
