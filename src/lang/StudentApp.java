package lang;

import java.util.Arrays;

public class StudentApp {

	public static void main(String[] args) {
		
		Student[] arr = {
			new Student(10, "김유신"),
			new Student(1, "강감찬"),
			new Student(3, "이순신"),
			new Student(7, "유관순"),
			new Student(5, "안중근"),
			new Student(15, "김좌진"),
			new Student(9, "홍범도"),
		};
		
		Arrays.sort(arr);
		
		for (Student s : arr) {
			System.out.println(s.no + " " + s.name);
		}
	}
}
