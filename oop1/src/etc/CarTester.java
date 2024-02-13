package etc;

public class CarTester {

	public void testCar(Car car) {
		// 운전 기능
		car.go();
		car.stop();
		
		// 에어컨 기능
		if (car instanceof AirCon) {
			AirCon air = (AirCon) car;	// car가 바라보는 객체에서 AirCon객체를 바라보게 하는 것
			air.airControl();
		}
		
		// 내비게이션 기능
		if (car instanceof Navigation) {// 특정객체의 자식인지, 특정 인터페이스의 구현체인지 확인할 수 있다
			Navigation navi = (Navigation) car;
			navi.navi();
		}
		
		
	}
	
	public static void main(String[] args) {
		
		Tico tico = new Tico();
		Sonata sonata = new Sonata();
		// Sample sample = new Sample();
		
		CarTester tester = new CarTester();
		tester.testCar(tico);
		tester.testCar(sonata);
		// tester.testCar(sample);
		
	}
}
