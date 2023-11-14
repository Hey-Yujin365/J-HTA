package lang;

public class StringApp1 {

	public static void main(String[] args) {
		
		// 문자열 리터럴로 String객체 생성하기
		String str1 = "문자열연습1";
		
		// new 연산자로 String 객체 생성하기
		String str2 = new String("문자열연습2");
		String str6 = new String(new byte[] {65, 66, 67});		// "ABC"
		String str7 = new String(new char[] {'A', 'B', 'C'});	// "ABC"
		
		// String클래스의 정적 메소드
		String str3 = String.valueOf(true);		// true  -> "true"
		String str4 = String.valueOf(10000);	// 10000 -> "10000"
		String str5 = String.valueOf(3.14);		// 3.14  -> "3.14"
		
		int num = 456789;					// num = 123456
		String str = String.valueOf(num);	// str = "123456"
		String str8 = str.substring(0, 1);
		System.out.println(str8);
		
	}
}
