package thread2;

public class ATM implements Runnable {

	private int balance = 1_000_000; // 계좌 잔액
	
	public synchronized void run() {
		for (int i = 0; i < 10; i++) {
			balance -= 20_000;
			String name = Thread.currentThread().getName();
			System.out.println("["+name+"]이 출금함. 잔액:["+balance+"]");
			System.out.println();
		}
	}
	
}
