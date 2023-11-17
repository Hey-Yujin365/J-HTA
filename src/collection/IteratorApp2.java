package collection;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class IteratorApp2 {

	public static void main(String[] args) {
		
		List<String> list = new ArrayList<>();
		list.add("김유신");
		list.add("김유신");
		list.add("이순신");
		list.add(null);
		list.add("홍길동");
		list.add("홍길동");
		list.add("유관순");
		list.add("안중근");
		
		// 콜렉션의 remove(Object o) 메소드로 요소 삭제하기
		// 리스트객체에서 처음으로 발견되는 객체만 삭제한다.
		list.remove("김유신");
		System.out.println(list);
		
		// 향상된 for문으로 반복처리 중에 요소 삭제하기
		// 향상된 for문으로 반복처리하는 도중에 콜렉션에 저장된 객체를 삭제할 수 없다.
		for (String name : list) {
			if ("홍길동".equals(name));
//			list.remove(name); // 예외발생 ConcurrentModificationException
		}
		
		// Iterator로 반복처리 중에 요소 삭제하기
		Iterator<String> itr = list.iterator();
		while (itr.hasNext()) {
			String name = itr.next();
			if ("홍길동".equals(name)) {
				itr.remove();
			}
		}
		System.out.println(list);
		
		
		
	}
}
