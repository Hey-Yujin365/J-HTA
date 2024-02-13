package abstraction;

// 구현 클래스 정의하기
// 추상 메소드를 보유할 수 없다.
// 만약 부모로부터 추상 메소드를 상속받았다면, 반드시 메소드 재정의해야 한다.
public class LineChart extends Chart {

	@Override	// Annotation 어노테이션 부가적인 정보적힌 부분
				// 상위클래스 메소드를 재정의한 메소드라는 의미
	public void draw() {
		System.out.println("꺾은선 그래프를 그립니다.");
	}
}
