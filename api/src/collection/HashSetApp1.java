package collection;

import java.util.HashSet;
import java.util.stream.Stream;

public class HashSetApp1 {

	public static void main(String[] args) {
		
		/*
		 * HashSet<E>
		 * 	- Set<E> 인터페이스를 구현한 자료구조 구현 클래스다.
		 *  - 중복된 객체의 저장을 허용하지 않는 자료구조 구현 클래스다.
		 *  - 객체의 동일성 비교를 구현하기 위해서 equals(), hashcode() 메소드를
		 *    재정의할 필요가 있다.(HashSet<E>에 저장되는 객체가 구현해야 함)
		 *    String, Wrapper 클래스는 equals()와 hashCode()가 이미 재정의되어 있다.
		 */
		
		// String 객체를 저장하는 HashSet 객체 생성하기
		HashSet<String> set = new HashSet<String>();
		
		// boolean add(E e) 메소드를 사용해서 HashSet 객체에 String객체 저장하기
		set.add("홍길동");
		set.add("김유신");
		set.add("강감찬");
		set.add("이순신");
		set.add("유관순");
		set.add("안중근");
		set.add("안중근");//저장되지 않음
		set.add("안중근");//저장되지 않음
		set.add("안중근");//저장되지 않음
		set.add("안중근");//저장되지 않음
		set.add("안중근");//저장되지 않음
		
		// int size() 메소드를 사용해서 HashSet 객체에 저장된 객체의 개수 조회하기
		int size = set.size();
		System.out.println("저장된 객체의 개수: " + size);	// 저장된 객체의 개수: 6, 중복은 저장되지 않기 때문에
		
		// 향상된 for문을 사용해서 HashSet객체에 저장된 객체들을 하나씩 처리하기
		// HashSet은 index가 없다. 일반 for문으로 HashSet객체에 저장된 값들을 처리할 수 없다.
		System.out.println("### 향상된 for문으로 HashSet객체에 저장된 객체 처리");
		for (String name : set) {
			System.out.println(name);	// 순서는 보장되지 않기 때문에 입력한 순서와 다르게 출력될 수 있다. 
		}
		
		// Stream을 사용해서 HashSet객체에 저장된 객체들을 하나씩 처리하기
		System.out.println("### Stream을 활용해서 HashSet객체 저장된 객체 처리");
		Stream<String> stream = set.stream();
		stream.forEach((String name) -> System.out.println(name));	//람다식
		
//		stream.forEach(new Consumer<String>() {						//익명객체를 이용한 방식
//			public void accept(String value) {
//				System.out.println(value);
//			}
//		});
		
		// boolean contains(Object o)를 사용해서 객체의 저장여부를 조회하기
		boolean isExist = set.contains("강감찬");
		System.out.println("존재여부: " + isExist);
		
		// boolean isEmpty()를 사용해서 HashSet 객체가 비어있는지 조회하기
		boolean isEmpty = set.isEmpty();
		System.out.println("비어있는가?: " + isEmpty);
		
		// void clear() HashSet객체에 저장된 모든 객체 삭제하기
		set.clear();
		
		System.out.println("비어있는가?: " + set.isEmpty());
		
		
		
	}
}
