package app;

import java.util.List;

public class ScoreService {
	
	private ScoreRepository repo = new ScoreRepository();

	// 신규 성적정보를 등록하는 서비스
	//	- 해당 학번의 성적정보가 있는지 체크한다.
	//	- 정보가 존재하면 오류를 발생시킨다.
	//	- 정보가 존재하지 않으면 성적정보를 저장시킨다.
	// 반환타입 : void
	// 메소드명 : addNewScore
	// 매개변수 : Score score
	public void addNewScore(Score score) {
		Score savedScore = repo.findByNo(score.getNo());
		if (savedScore != null) {
			throw new RuntimeException("[" + score.getNo() + "] 성적정보가 이미 등록되어 있습니다.");
		}
		
		repo.save(score);
	}
	
	
	// 모든 성적정보를 제공하는 서비스
	//	- 학생 성적정보를 학번순으로 정리해서 제공한다.
	// 반환타입 : List<Score>
	// 메소드명 : getAllScores
	// 매개변수 : 없음
	public List<Score> getAllScores() {
		// 모든 성적정보를 repository에서 조회
		List<Score> list = repo.findAll();
		
		// 학번순으로 오름차순 정렬시키기
		list.sort((s1, s2) -> s1.getNo() - s2.getNo());
		
		return list;
		
//		list.sort(new Comparator<Score>() {
//			// 각각의 성적정보를 학번을 기준으로 오름차순 정렬시키기 위한 구현
//			public int compare(Score s1, Score s2) {
//				return s1.getNo() - s2.getNo();
//			}
//		});
	}
	
		
	// 모든 성적정보를 성적순으로 제공하는 서비스
	//	- 학생 성적정보를 총점에 대한 내림차순으로 정렬해서 제공한다.
	// 반환타입 : List<Score>
	// 메소드명 : getSortedScores;
	// 매개변수 : 없음
	public List<Score> getSortedScores() {
		List<Score> list = repo.findAll();
		// 총점순으로 내림차순 정렬시키기
		list.sort((s1, s2) -> s2.getTotal() - s1.getTotal());
		
		return list;
	}

	// 성적정보를 변경하는 서비스
	//	- 학번으로 변경할 성적정보를 조회한다.
	//	- 성적정보가 존재하지 않으면 예외를 발생시킨다.
	//	- 성적정보가 존재하면 국어, 영어, 수학 점수를 Setter 메소드를 사용해서 변경한다.
	//	- 변경된 성적정보로 총점과 평균을 다시 집계하도록 reduce() 메소드를 실행한다.
	// 반환타입 : void
	// 메소드명 : updateScore
	// 매개변수 : int no, int kor, int eng, int math
	public void updateScore(int no, int kor, int eng, int math) {
		Score savedScore = repo.findByNo(no);
		if (savedScore == null) {
			throw new RuntimeException("["+no+"] 성적정보가 존재하지 않습니다.");
		}
		
		savedScore.setKor(kor);
		savedScore.setEng(eng);
		savedScore.setMath(math);
		
		savedScore.reduce();
		
	}
	
	// 지정된 학번의 학생 성적정보를 제공하는 서비스
	// 반환타입 : 
	// 메소드명 : 
	// 매개변수 : 
	
	// 지정된 이름의  학생들 성적정보를 제공하는 서비스
	// 반환타입 : 
	// 메소드명 : 
	// 매개변수 : 
	
	
}
