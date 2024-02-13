package inner;

public class Sample4 {

	public static void main(String[] args) {
		
		SampleInterface 익명객체1 = new SampleInterface() {
			public void handle() {
				System.out.println("첫 번째 익명객체 구현코드");
			}
		};
		익명객체1.handle();
		
		SampleInterface 익명객체2 = new SampleInterface() {
			
			public void handle() {
				System.out.println("두 번째 익명객체 구현코드");
			}
		};
		익명객체2.handle();
		
	}
}
