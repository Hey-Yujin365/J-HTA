package inner;

/*
 * 멤버 내부클래스(인스턴스 내부 클래스)를 포함하는 클래스
 */
public class Sample1 {

	private int value1;
	static int value2;
	
	public void method1() {
		
	}
	
	public static void method2() {
		
	}
	
	// 멤버 내부클래스에 대한 객체를 제공하는 메소드
	public Inner1 getInner() {
		Inner1 inner1 = new Inner1();
		return inner1;
	}
	
	/* 
	 * 멤버 내부 클래스
	 * 	- 외부클래스로 객체 생성 후 사용가능한 내부 클래스다.
	 * 	- 외부 클래스의 모든 변수(멤버변수, 정적변수),
	 *               모든 메소드(멤버메소드, 정적메소드)를 사용할 수 있다.
	 * 	- 외부 클래스의 멤버변수와 밀접하게 관련된 작업에 사용될 목적으로 작성되는 내부클래스다.
	 */
	class Inner1 {
		
		/*
		 * 멤버 내부클래스에서는 외부 클래스의 모든 변수, 모든 메소드를 자유롭게 사용할 수 있다.
		 */
		public void method() {
			System.out.println(value1);
			System.out.println(value2);
			method1();
			method2();
		}
	}
}
