package overloading;

public class CalculatorApp {

	public static void main(String[] args) {
		
		Calculator c = new Calculator();
		
		int result1 = c.sum(10, 20);
		System.out.println("첫 번째 실행결과: " + result1);
		
		int result2 = c.sum(10, 20, 30);
		System.out.println("두 번째 실행결과: " + result2);
		
	}
}
