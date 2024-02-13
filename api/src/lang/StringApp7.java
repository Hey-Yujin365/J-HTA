package lang;

public class StringApp7 {

	public static void main(String[] args) {
		
		/*
		 * String[] split(String delim)
		 * 	- 문자열을 지정된 구분문자로 잘라서 잘려진 각 문자열을 배열에 담아서 반환한다.
		 */
		
		String str = "김유신,홍길동,강감찬,이순신,유관순";
		String[] items = str.split(",");
		
		for (String name : items) {
			System.out.println(name);
		}
		
	}
}
