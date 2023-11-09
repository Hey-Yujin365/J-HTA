package method;

public class BankAccountApp {

	public static void main(String[] args) {
		
		// 계좌정보 객체를 생성하고 조회, 입금, 출금, 비밀번호변경, 해지 기능 사용해보기
		
		// 계좌정보 객체 생성하기
		BankAccount acc1 = new BankAccount("김유신", "12-34-5678", 1111, 1_000_000L, 0.05);
		
		// 계좌정보 조회하기
		acc1.display();
		System.out.println();
		
		// 입금하기
		acc1.deposit(300000);
		acc1.deposit(5000000);
		acc1.deposit(450000);
		System.out.println();
		
		// 출금하기
		long amount1 = acc1.withdraw(700000, 3333);
		System.out.println("출금액: " + amount1);
		long amount2 = acc1.withdraw(700000, 1111);
		System.out.println("출금액: " + amount2);
		System.out.println();
		
		// 비밀번호 변경하기
		acc1.changePassword(1234, 1234);
		acc1.changePassword(1111, 1111);
		acc1.changePassword(1111, 5678);
		System.out.println();
		
		// 계좌 해지하기
		acc1.terminate(1234);
		long amount = acc1.terminate(5678);
		System.out.println("해지금액 : " + amount);
		
	}
}
