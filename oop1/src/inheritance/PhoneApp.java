package inheritance;

public class PhoneApp {

	public static void main(String[] args) {
		
		// Phone 객체 생성하기
		Phone p1 = new Phone();
		p1.number = "010-1111-1234";
		p1.call();
		p1.reveive();
		
		
		// SmartPhone 객체 생성하기
		SmartPhone p2 = new SmartPhone();
		p2.number = "010-2222-1234";
		p2.ip = "192.168.10.11";
		p2.call();
		p2.reveive();
		p2.internet();
		p2.game();
	}
}
