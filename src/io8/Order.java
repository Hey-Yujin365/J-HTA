package io8;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import java.util.StringJoiner;
import java.util.TreeSet;

public class Order {

	private int lottoNo;	// 회차번호
	private long orderNo;	// 주문번호
	private List<Set<Integer>> numbers;	// 구매한 로또번호
	
	public Order() {}

	public int getLottoNo() {
		return lottoNo;
	}

	public void setLottoNo(int lottoNo) {
		this.lottoNo = lottoNo;
	}

	public long getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(long orderNo) {
		this.orderNo = orderNo;
	}

	public List<Set<Integer>> getNumbers() {
		return numbers;
	}

	public void setNumbers(List<Set<Integer>> numbers) {
		this.numbers = numbers;
	}
	
	// 20231124:1700808800677:5,13,20,22,38,43/9,12,18,19,24,29/2,6,17,22,26,41
	public static Order toOrder(String text) {
		String[] items = text.split(":");
		
		int lottoNo = Integer.parseInt(items[0]);
		long orderNo = Long.parseLong(items[1]);
		List<Set<Integer>> numbers = toList(items[2]);
		
		Order order = new Order();
		order.setLottoNo(lottoNo);
		order.setOrderNo(orderNo);
		order.setNumbers(numbers);;
		
		return order;
	}
	
	// text는 5,13,20,22,38,43/9,12,18,19,24,29/2,6,17,22,26,41
	private static List<Set<Integer>> toList(String text) {
		List<Set<Integer>> numbers = new ArrayList<>();
		
		String[] items = text.split("/");
		for (String item : items) {
			numbers.add(toSet(item));
		}
		
		return numbers;
	}
	
	// text는 5,13,20,22,38,43
	// text는 9,12,18,19,24,29
	// text는 2,6,17,22,26,41
	private static Set<Integer> toSet(String text) {
		Set<Integer> set = new TreeSet<Integer>();
		String[] items = text.split(",");
		for (String item : items) {
			set.add(Integer.parseInt(item));
		}
		
		return set;
	}
	
	// 2231124:1700806952324:1,2,3,4,5,6/5,6,7,27,32,41/ ...
	public String toText() {
		StringBuilder sb = new StringBuilder();
		sb.append(lottoNo);
		sb.append(":");
		sb.append(orderNo);
		sb.append(":");
		
		StringJoiner joiner = new StringJoiner("/");
		for (Set<Integer> set : numbers) {
			StringJoiner innerJoiner = new StringJoiner(",");
			for (Integer num : set) {
				innerJoiner.add(String.valueOf(num));	// "1,2,3,4,5,6"
			}
			
			joiner.add(innerJoiner.toString());	// "1,2,3,4,5,6/7,8,9,10,11,12"
		}
		sb.append(joiner.toString());
		
		return sb.toString();
		
	}
	
	
}
