package collection;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class IteratorApp1 {

	public static void main(String[] args) {
		
		List<String> list = Arrays.asList("홍길동", "김유신", "강감찬", "이순신", "유관순");
		
		System.out.println("### 일반 for문을 사용해서 반복처리하기");
		int size = list.size();
		for (int index = 0; index < size; index++) {
			String name = list.get(index);
			System.out.println(name);
		}
		
		System.out.println("### 향상된 for문을 사용해서 반복처리하기");
		for (String name : list) {
			System.out.println(name);
		}
		
		System.out.println("### Iterator를 사용해서 반복처리하기");
		Iterator<String> itr = list.iterator();
		while (itr.hasNext()) {		//hasNext()로 반복할 요소가 남았는지 확인하기
			String name = itr.next();	// next()로 요소 꺼내기
			System.out.println(name);
		}
		
		System.out.println("### Stream을 사용해서 반복처리하기");
		list.stream().forEach(name -> System.out.println(name));
	}
}