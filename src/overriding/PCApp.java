package overriding;

public class PCApp {

	public static void main(String[] args) {
		
		// 다양한 프린터객체를 준비한다.
		Printer p1 = new Printer();
		ColorPrinter p2 = new ColorPrinter();
		PhotoPrinter p3 = new PhotoPrinter();
		
		// 컴퓨터 객체를 준비한다.
		PC pc = new PC();
		
		// 컴퓨터 객체와 프린터 객체를 조립한다.
		pc.p = p2;		// p2는 ColorPrinter 타입의 객체로 생성되었다
						// pc.p는 Printer 타입을 가지고 있기 때문에
						// 클래스 형변환을 통해 실제로 바라보는 것은 Printer다.
						// 하지만 실제로 생성된 객체에서 재정의된 메소드를
						// 실행하기 때문에 컬러프린터의 print()가 실행된다.
						
		// 문서를 인쇄한다.
		pc.printDocument();
		
	}
}
