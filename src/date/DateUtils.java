package date;

import java.text.SimpleDateFormat;
import java.util.Date;

/*
 * 날짜와 시간 관련 유용한 메소드를 제공하는 클래스다.
 */
public class DateUtils {
	
	private static final SimpleDateFormat basicFormat
		= new SimpleDateFormat("yyyy.MM.dd");	
	private static final SimpleDateFormat detailFormat
		= new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
	
	/**
	 * 날짜를 전달받아서, 문자열로 변환 후 반환한다.
	 * @param date 날짜
	 * @return 날짜
	 */
	public static String dateToString(Date date) {
		if (date == null) {
			return "";
		}
		
		return basicFormat.format(date);
	}
	
	/**
	 * 날짜를 전달받아서, 문자열로 변환 후 반환한다.
	 * @param date 날짜
	 * @return 날짜와 시간 정보가 모두 포함된 문자열
	 */
	public static String dateToDetailString(Date date) {
		if (date == null) {
			return "";
		}
		
		return detailFormat.format(date);
	}
}
