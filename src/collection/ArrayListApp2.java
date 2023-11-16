package collection;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ArrayListApp2 {

	public static void main(String[] args) {
		
		// new 키워드를 이용해서 List 인터페이스 구현체인 ArrayList 객체 생성하기
		List<String> names = new ArrayList<String>();
		names.add("홍길동");
		names.add("김유신");
		names.add("강감찬");

		// Arrays 클래스 정적메소드 asList(T... t)를 이용해서 List 인터페이스의 구현객체 생성하기
		List<String> names2 = Arrays.asList("홍길동", "김유신", "강감찬");
		
		// List 인터페이스의 정적 메소드 of(E e)를 이용해서 List 인터페이스의 구현객체 생성하기
		// 아래의 방법으로 생성한 List객체는 불변객체다
		// 새로운 객체를 추가하거나, 기존 객체를 삭제할 수 없다.
		List<String> names3 = List.of("홍길동", "김유신", "강감찬");
		
	}
}
