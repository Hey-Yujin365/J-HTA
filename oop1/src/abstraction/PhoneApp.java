package abstraction;

public class PhoneApp {

	public static void main(String[] args) {
		
		// NormalPhone 타입의 참조변수는 NormalPhone객체를 참조할 수 있다.
		NormalPhone p1 = new NormalPhone();
		// Phone 타입의 참조변수는 NormalPhone객체를 참조할 수 있다.
		Phone p2 = new NormalPhone();
		
		
		// IPhone 타입의 참조변수는 IPhone객체를 참조할 수 있다.
		IPhone p3 = new IPhone();
		// SmartPhone 타입의 참조변수는 IPhone 객체를 참조할 수 있다.
		SmartPhone p4 = new IPhone();
		// Phone 타입의 참조변수는 IPhone 객체를 참조할 수 있다.
		Phone p5 = new IPhone();

		
		
		p4.game();
		p4.internet();
		// p4.call("010-1111-2222");
		// p4.receive();
		// p4.sms("010-1111-1111", "안녕하세요");
		
		// p5.game();
		// p5.internet();
		p5.call("010-1111-2222");
		p5.receive();
		p5.sms("010-1111-1111", "안녕하세요");
	}
}
