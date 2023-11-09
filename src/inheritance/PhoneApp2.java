package inheritance;

public class PhoneApp2 {

	public static void main(String[] args) {
		
		// 클래스의 형변환
		
		// Iphone 객체는 Iphone 타입이다.
		Iphone p1 = new Iphone();
		p1.appleMusic();				// Iphone 객체
		p1.applePay();					// Iphone 객체
		p1.ip = "192.168.10.1";			// SmartPhone 객체
		p1.internet();					// SmartPhone 객체
		p1.game();						// SmartPhone 객체
		p1.number = "010-1111-1111";	// Phone 객체
		p1.call();						// Phone 객체
		p1.reveive();					// Phone 객체
		
		
		// Iphone 객체는 SmartPhone 타입이다.
		// p2.appleMusic 은 실행할 수 없다.
		SmartPhone p2 = new Iphone();
		// p2.appleMusic();				// Iphone 객체
		// p2.applePay();					// Iphone 객체
		p2.ip = "192.168.10.1";			// SmartPhone 객체
		p2.internet();					// SmartPhone 객체
		p2.game();						// SmartPhone 객체
		p2.number = "010-1111-1111";	// Phone 객체
		p2.call();						// Phone 객체
		p2.reveive();		

		
		// Iphone 객체는 Phone 타입이다.
		// p3.game 은 실행할 수 없다.
		Phone p3 = new Iphone();
		// p3.appleMusic();				// Iphone 객체
		// p3.applePay();					// Iphone 객체
		// p3.ip = "192.168.10.1";			// SmartPhone 객체
		// p3.internet();					// SmartPhone 객체
		// p3.game();						// SmartPhone 객체
		p3.number = "010-1111-1111";	// Phone 객체
		p3.call();						// Phone 객체
		p3.reveive();		
		
		
	}
}
