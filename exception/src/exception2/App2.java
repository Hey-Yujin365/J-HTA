package exception2;

import java.util.HashMap;
import java.util.Map;

public class App2 {

	public static int getPoint(String grade, int orderPrice) {
		Map<String, Double> map = new HashMap<String, Double>();
		map.put("gold", 0.05);
		map.put("silver", 0.02);
		map.put("bronze", 0.01);
		
		if (!map.containsKey(grade)) {
			throw new InvalidCustomerGradeException(grade);
		}
		
		double rate = map.get(grade);
		int point = (int) (orderPrice*rate);
		
		return point;
	}
	
	public static void main(String[] args) {
		
		// 예외 일괄처리
		try {
			int point1 = getPoint("gold", 100000);
			System.out.println("포인트: " + point1);
		
			int point2 = getPoint("silver", 60000);
			System.out.println("포인트: " + point2);
			
			int point3 = getPoint("guest", 60000);
			System.out.println("포인트: " + point3);
			
		} catch (InvalidCustomerGradeException ex) {
			ex.printStackTrace();
		}
	}
}
