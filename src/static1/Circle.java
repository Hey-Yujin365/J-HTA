package static1;

/**
 * 원의 반지름과 원주율을 멤버변수로 가지는 Circle 클래스 정의하기
 */
public class Circle {

	double r;		// 반지름
	double pi;
	
	public Circle(double r, double pi) {
		this.r = r;
		this.pi = pi;
	}

	/**
	 * 원의 둘레 길이를 반환한다.
	 * @return 원의 둘레 길이
	 */
	public double round() {
		return 2*pi*r;
	}
	
	/**
	 * 원의 넓이를 반환한다,
	 * @return 원의넓이
	 */
	public double area() {
		return pi*r*r;
	}

}
