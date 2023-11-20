package map;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class HashMapApp2 {

	public static void main(String[] args) {
		
		/*
		 * VO객체를 대체하는 Map 객체
		 * 
		 * 상품정보를 저장하는 Product 클래스
		 * 		public class Product {
		 * 			private int no;
		 * 			private String name;
		 * 			private String makey;
		 * 			private int price;
		 * 			private double discountRate;
		 * 			....
		 * 		}
		 * 
		 * 		Product item1 = new Product(100, "iPhone15", "apple", 1300000, 0.03) 
		 * 		Product item2 = new Product(100, "iPhone15", "apple", 1300000, 0.03) 
		 * 		Product item3 = new Product(100, "iPhone15", "apple", 1300000, 0.03) 
		 * 		Product item4 = new Product(100, "iPhone15", "apple", 1300000, 0.03) 
		 * 		Product item5 = new Product(100, "iPhone15", "apple", 1300000, 0.03) 
		 * 
		 * 	상품정보를 저장하는 Map 객체
		 *  	Map<String, Object> item1 = new HashMap<>();
		 *  	item.put("no", 100);
		 *  	item.put("name", "iPhone 15");
		 *  	item.put("maker", "apple");
		 *  	item.put("price", 1300000);
		 *  	item.put("discountRate", 0.03);
		 *  	
		 *   	Map<String, Object> item2 = new HashMap<>();
		 *  	item.put("no", 100);
		 *  	item.put("name", "iPhone 15");
		 *  	item.put("maker", "apple");
		 *  	item.put("price", 1300000);
		 *  	item.put("discountRate", 0.03);
		 */
		
		// 상품정보를 저장하는 Map 객체
		Map<String, Object> item1 = new HashMap<String, Object>();
		item1.put("no", 100);
		item1.put("name", "iPhone 15");
		item1.put("maker", "apple");
		item1.put("price", 1300000);
		item1.put("discountRate", 0.03);
		
		Map<String, Object> item2 = new HashMap<String, Object>();
		item2.put("no", 200);
		item2.put("name", "갤럭시 플립");
		item2.put("maker", "삼성전자");
		item2.put("price", 1500000);
		item2.put("discountRate", 0.05);
		
		// 상품정보가 저장된 Map객체를 여러 개 저장하는 List 객체를 생성하기
		List<Map<String, Object>> items = new ArrayList<>();
		items.add(item1);
		items.add(item2);
		
		// List 객체에 저장된 모든 정보 출력하기
		for (Map<String, Object> map : items) {
			int no = (Integer) map.get("no");
			String name = (String) map.get("name");
			String maker = (String) map.get("maker");
			int price = (Integer) map.get("price");
			double discountRate = (double) map.get("discountRate");

			System.out.println("번호: " + no);
			System.out.println("이름: " + name);
			System.out.println("제조사: " + maker);
			System.out.println("가격: " + price);
			System.out.println("할인율: " + discountRate);
		}
		
		
		
	}
}
