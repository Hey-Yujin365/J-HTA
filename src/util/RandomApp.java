package util;

import java.util.Arrays;
import java.util.Random;

public class RandomApp {

	public static void main(String[] args) {
		
		Random random = new Random();
		
		/*
		 * int nextInt(int bound)
		 * 	- 임의의 정수를 반환한다.
		 * 	- 정수값의 범위는 0 <= 정수 < bound 
		 */
		
		// 로또번호를 중복없이 추출하고, 추출한 결과를 오름차순으로 정렬한다.
		int[] lotto = new int[6];
		int position = 0;
		
		while(true) {
			// 번호 뽑기
			int number = random.nextInt(45) + 1;
			
			// 중복검사 및 번호 저장하기
			if (position == 0) {
				lotto[position++] = number;
			} else {
				// 중복여부를 저장하는 플래그 변수다. 기본값은 false다.
				boolean isExist = false;
				for (int index = 0; index < position; index++) {
					if (lotto[index] == number) {
						isExist = true;
						break;
					}
				}
				// isExist가 false면 배열에 번호를 저장한다.
				if (!isExist) {
					lotto[position++] = number;
				}
			}
			
			// position 값이 6이면 lotto 배열에 모든 숫자가 채워졌다.
			if (position == 6) {
				break;
			}
		}
		
		// 배열의 값을 오름차순으로 정렬한다.
		Arrays.sort(lotto);
		
		System.out.println("로또 번호: " + Arrays.toString(lotto));
	}
	
}
