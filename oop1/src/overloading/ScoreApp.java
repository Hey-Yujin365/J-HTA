package overloading;

public class ScoreApp {

	public static void main(String[] args) {
		
		Score s1 = new Score();
		s1.setup("이순신", 70, 80, 80);
		
		Score s2 = new Score();
		s2.setup("강감찬", 80, 80, 80);
		
		Score s3 = new Score();
		s3.setup("유관순", 100, 80, 90);
		
		
		// 각 객체에 저장된 성적정보 출력하기
		s1.printScore();
		s2.printScore();
		s3.printScore();
	}
}
