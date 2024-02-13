package collection;

import java.util.ArrayList;

public class ArrayListApp1 {

	public static void main(String[] args) {
		
		/*
		 * ArrayList<E>
		 * 	- List<E> 인터페이스를 구현한 구현 클래스다.
		 * 	- 가변길이 배열을 활용해서 List<E> 인터페이스를 구현하였다.
		 * 	- 순서가 보장되는 자료구조 구현 클래스다.
		 * 	- 가장 많이 사용되는 자료구조 구현 클래스다.
		 */
		
		// String 객체를 여러 개 저장할 수 있는 ArrayList객체를 생성함
		ArrayList<String> list = new ArrayList<String>();
		
		// boolean add(E e) - ArrayList 객체에 순서대로 객체를 저장한다.
		//					  맨 마지막번째 객체 다음에 저장된다.
		list.add("김유신");
		list.add("강감찬");
		list.add("이순신");
		list.add("홍길동");
		list.add("유관순");
		list.add("안중근");
		list.add("김유신");
		list.add("김유신");
		list.add("김유신");

		// int size() : ArrayList객체에 저장된 객체의 개수를 반환한다.
		int size = list.size();
		System.out.println("저장된 객체의 개수: " + size);
		
		// 향상된 for문으로 ArrayList객체에 저장된 String 객체 처리하기
		for (String str : list) {
			System.out.println(str);
		}
		
	}
}
