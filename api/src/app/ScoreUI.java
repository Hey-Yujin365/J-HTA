package app;

import java.util.List;
import java.util.Scanner;

public class ScoreUI {
	Scanner scanner = new Scanner(System.in);
	
	ScoreService service = new ScoreService();

	// 모든 성적정보 조회해서 출력하기
	public void 전체조회() {
		System.out.println("[전체 성적 조회]");
		
		List<Score> scores = service.getAllScores();
		System.out.println("-----------------------------------------------------");
		System.out.println("학번\t이름\t국어\t영어\t수학\t총점\t평균");
		System.out.println("-----------------------------------------------------");
		for (Score score : scores) {
			System.out.print(score.getNo() + "\t");
			System.out.print(score.getName() + "\t");
			System.out.print(score.getKor() + "\t");
			System.out.print(score.getEng() + "\t");
			System.out.print(score.getMath() + "\t");
			System.out.print(score.getTotal() + "\t");
			System.out.println(score.getAverage() + "\t");
		}
		System.out.println("-----------------------------------------------------");
	}
	
	public void 성적순조회() {
		System.out.println("[성적순 조회]");
		
		List<Score> scores = service.getSortedScores();
		System.out.println("-----------------------------------------------------");
		System.out.println("학번\t이름\t국어\t영어\t수학\t총점\t평균");
		System.out.println("-----------------------------------------------------");
		for (Score score : scores) {
			System.out.print(score.getNo() + "\t");
			System.out.print(score.getName() + "\t");
			System.out.print(score.getKor() + "\t");
			System.out.print(score.getEng() + "\t");
			System.out.print(score.getMath() + "\t");
			System.out.print(score.getTotal() + "\t");
			System.out.println(score.getAverage() + "\t");
		}
		System.out.println("-----------------------------------------------------");
	}
	
	public void 신규등록() {
		System.out.println("[성적 정보 등록]");
		
		System.out.print("### 학번 입력: ");
		int no = scanner.nextInt();
		System.out.print("### 이름 입력: ");
		String name = scanner.next();
		System.out.print("### 국어 입력: ");
		int kor = scanner.nextInt();
		System.out.print("### 영어 입력: ");
		int eng = scanner.nextInt();
		System.out.print("### 수학 입력: ");
		int math = scanner.nextInt();
		
		Score score = new Score(no, name, kor, eng, math);
		
		service.addNewScore(score);
	}
	
	public void 성적수정하기() {
		System.out.println("[성적 정보 수정하기]");
		
		System.out.println("### 학번과 성적정보를 입력하세요.");
		
		System.out.print("### 학번 입력: ");
		int no = scanner.nextInt();
		System.out.print("### 국어점수입력: ");
		int kor = scanner.nextInt();
		System.out.print("### 영어점수입력: ");
		int eng = scanner.nextInt();
		System.out.print("### 수학점수입력: ");
		int math = scanner.nextInt();
		
		service.updateScore(no, kor, eng, math);
	}
	
	public static void main(String[] args) {
		ScoreUI ui = new ScoreUI();
		
		ui.신규등록();
		ui.전체조회();
		ui.성적수정하기();
		ui.성적순조회();
		
		
	}
}
