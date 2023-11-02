package day1;

public class BookApp {

	public static void main(String[] args) {
		
		/*
		 * 객체 생성하기
		 * 형식
		 * 	new 클래스명();
		 *	
		 *	+ 클래스명에 해당하는 객체를 생성하고,
		 *	  생성된 객체의 주소값을 반환한다.
		 *	+ 반환되는 주소값은 생성된 객체를 이용하기 위해서
		 *	  참조변수를 선언해서 대입해야 한다. 
		 * 
		 * 
		 * 참조변수를 생성하고 객체의 주소값을 저장하기
		 * 형식
		 *	클래스명 참조변수명 = new 클래스명();
		 * 	
		 *	+ 참조변수의 타입은 생성한 객체의 클래스명이다.
		 *	+ 클래스명은 참조변수의 타입이다.
		 *	+ 클래스는 사용자정의 데이터타입(자료형)이다.
		 *  // 자바의 데이터 타입은 int String등이 있다면 클래스는 사용자정의 데이터타입
		 */
		
		// Book 클래스로 Book 객체 생성하기
		// 아래와 같이 실행하면, Book 설계도를 이용해서 3개의 Book 객체가 생성된다.
		Book book1 = new Book();
		Book book2 = new Book();
		Book book3 = new Book();
		Book book4 = book3; // 참조변수 book3가 참조하는 객체와 같은 객체를 
							// 참조변수 book4가 참조하게 한다.
		
		// 참조변수 book5는 String 클래스로 생성한 객체를 참조할 수 있기 때문에
		// Book 객체를 참조할 수 없다.
		// String book5 = new Book();		// 오류다.
		System.out.println(book1); // 출력 day1.Book@6f2b958e
		System.out.println(book2); // 출력 day1.Book@5e91993f
		System.out.println(book3); // 해시코드가 다 다르게 출력되는 걸 확인할 수 있다.
		System.out.println(book4); // book3을 넣으면 같은 객체를 바라보고 있기 때문에 해시코드 값이 같다
		
	}
}
