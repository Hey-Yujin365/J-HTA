package etc;

public class CarTester2 {

	public void testCar(Car car) {
		
	}
	
	public void testAirCon(AirCon aircon) {
		
	}
	
	public void testNavigation(Navigation navigation) {
		
	}
	
	public static void main(String[] args) {
		Tico tico = new Tico();
		Sonata sonata = new Sonata();
		
		CarTester2 tester2 = new CarTester2();
		
		// 운전기능 테스트
		tester2.testCar(tico);
		tester2.testCar(sonata);
		
		// 에어컨기능 테스트
		tester2.testAirCon(tico);
		tester2.testAirCon(sonata);

		// 내비기능 테스트
		// tester2.testNavigation(tico);	// 내비기능 구현체가 아니라서 들어갈 수 없다
		tester2.testNavigation(sonata);
	}
}
