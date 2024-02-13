package lang;

public class ContactApp3 {
	
	public static void main(String[] args) {
		
		Contact c1 = new Contact();
		
		c1.name = "홍길동";
		c1.phone = "010-1111-1111";
		c1.email = "hong@gmail.com";
		c1.company = "중앙HTA";
		
		Contact c2 = c1.copy();
		System.out.println("c2가 참조하는 객체 ===> c1을 복제한 Contact 객체");
		System.out.println(c2);
		System.out.println();
		
		
		c1.name = "홍길동1111";
		System.out.println("c1의 참조하는 객체");
		System.out.println(c1);
		
		System.out.println("c2가 참조하는 객체");
		System.out.println(c2);
		
	}
	
}
