package overriding;

public class PC {

	Printer p;		// Printer 및 하위 클래스를 연결할 준비(조립)
	
	public void printDocument() {
		p.print();
	}
}

