package inner;

/**
 * 그림판 클래스
 */
public class Painter {
	
	
	// 전달받은 Shape의 구현객체의 도형 그리기를 실행한다.
	public void drawShape(Shape shape) {
		shape.draw();
		
	}
}
