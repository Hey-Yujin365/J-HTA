package app;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ScoreRepository {

	private ArrayList<Score> list = new ArrayList<Score>();
	
	public ScoreRepository() {
		list.add(new Score(10, "김유신", 70, 70, 50));
		list.add(new Score(22, "강감찬", 60, 70, 90));
		list.add(new Score(31, "이순신", 90, 100, 100));
		list.add(new Score(16, "유관순", 50, 40, 50));
		list.add(new Score(28, "안중근", 60, 80, 80));
		list.add(new Score(25, "김좌진", 70, 70, 30));
		list.add(new Score(13, "홍범도", 80, 60, 40));
		list.add(new Score(17, "정약용", 90, 60, 70));
		list.add(new Score(26, "안창호", 100, 80, 100));
		list.add(new Score(27, "정몽주", 40, 60, 50));
	}
	// 신규 성적정보를 전달받아서 저장하는 메소드
	// 반환타입 : void
	// 메소드명 : save
	// 매개변수 : Score score
	public void save(Score score) {
		list.add(score);
	}
	
	// 모든 성적정보를 제공하는 메소드
	// 반환타입 : List<Score> 인터페이스 타입으로 반환
	// 메소드명 : findAll
	// 매개변수 : 없음
	@SuppressWarnings("unchecked")
	public List<Score> findAll() {
		return (List<Score>) list.clone();
	}
	
	// 학번을 전달받아서 해당 학번의 성적정보를 제공하는 메소드
	// 반환타입 : Score
	// 메소드명 : findByNo
	// 매개변수 : int no
	public Score findByNo(int no) {
		for (Score score : list) {
			if (score.getNo() == no) {	// no를 은닉화해둬서 getNo로 실행해야된다
			return score;
			}
		}
		return null;
	}
	
	// 이름을 전달받아서 이름에 해당하는 성적정보를 제공하는 메소드
	// 반환타입 : List<Score>
	// 메소드명 : findByName
	// 매개변수 : String name
	public List<Score> findByName(String name) {
		List<Score> foundScores = new ArrayList<Score>();
		
		for (Score score : list) {
			if (score.getName().equals(name)) {
				foundScores.add(score);
			}
		}
		return foundScores;
	}
	
	
	// 학번을 전달받아서 해당 학번의 성적정보를 삭제하는 메소드
	// 반환타입 : void
	// 메소드명 : deleteByNo
	// 매개변수 : int no
	public void deleteByNo(int no) {
		Iterator<Score> itr = list.iterator();
		while (itr.hasNext()) {
			Score score = itr.next();
			if (score.getNo() == no) {
				itr.remove();
				break;
			}
		}
	}
	
	
	
	
}
