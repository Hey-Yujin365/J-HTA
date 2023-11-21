package exception1;

public class NumberUtils {

	/**
	 * 문자열을 정수로 변환해서 반환한다.
	 * @param str 숫자로 구성된 문자열
	 * @param defaultValue 기본값
	 * @return 정수값, 문자열이 정수로 변환이 불가능할 경우 기본값이 반환된다.
	 */
	public static int toInt(String str, int defaultValue) {
		if (str == null ) {
			return defaultValue;
		}
		if (str.isBlank()) {
			return defaultValue;
		}
		
		try {
			return Integer.parseInt(str);
		} catch (NumberFormatException ex) {
			return defaultValue;
		}
	}
	
	/**
	 * 문자열을 정수로 변환해서 반환한다.
	 * @param str 숫자로 구성된 문자열
	 * @return 정수값, 문자열이 정수로 변환이 불가능할 경우 기본값이 반환된다.
	 */
	public static int toInt(String str) {
		return toInt(str, 0);
		
	}
}
