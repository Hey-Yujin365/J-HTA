package time;

import java.time.LocalDateTime;
/*
 * static import
 * 	- 정적 메소드, 정적 변수를 import 시키는 구문
 * 	- java 1.5버전부터 지원한다
 */
import static java.time.format.DateTimeFormatter.ofPattern;;

public class App4 {

	public static void main(String[] args) {
		
		// 문자열로 변환하기
		LocalDateTime now = LocalDateTime.now();
		
		System.out.println(now);
		
		String text1 = now.format(ofPattern("yyyy-MM-dd"));
		System.out.println(text1);
		
		String text2 = now.format(ofPattern("M월 d일 EEEE"));
		System.out.println(text2);
		
		
	}
}
