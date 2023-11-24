package io8;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.TreeSet;

public class LottoService {

	private LottoRepository lottoRepo = new LottoRepository();
	private OrderRepository orderRepo = new OrderRepository();
	
	public Order buy(int orderAmount) {
		// 회차번호를 획득한다.
		int lottoNo = orderRepo.getLottoNo();
		// 주문번호를 획득(생성)한다.
		long orderNo = System.currentTimeMillis();
		
		// 금액만큼 로또 번호를 발행합니다.
		int count = orderAmount/1000;
		List<Set<Integer>> numbers = new ArrayList<>();
		for (int i = 1; i <= count; i++) {
			// generateSet() 메소드는 로또번호를 발행한다.
			// generateSet()을 실행하면 숫자 6개가 포함된 Set 객체를 획득한다.
			// numbers는 로또번호Set을 여러 개 저장하는 객체다.
			// generateSet()으로 발행된 로또번호Set이 저장된다.
			numbers.add(generateSet());
		}
		
		// 주문정보는 로또회차번호, 주문번호, 로또번호로 구성된다.
		// Order 객체를 생성해서 로또회차번호, 주문번호, 로또번호(자동으로 금액만큼 생성된)를 담는다.
		Order order = new Order();
		order.setLottoNo(lottoNo);
		order.setOrderNo(orderNo);
		order.setNumbers(numbers);
		
		
		// 주문정보가 담겨있는 Order객체를 OrderRepository 객체에 전달해서 저장시킨다.
		orderRepo.save(order);
		
		// 주문정보를 UI로 반환한다.
		return order;
	}

	private Set<Integer> generateSet() {
		Set<Integer> set = new TreeSet<Integer>();
		
		Random random = new Random();
		while (true) {
			int num = random.nextInt(45) + 1;
			set.add(num);
			if (set.size() == 6) {
				break;
			}
		}
		return set;
		
	}

	public Order getOrder(int lottoNo, long orderNo) {
		List<Order> orders = orderRepo.getOrders(lottoNo);
		
		for (Order order : orders) {
			if (order.getOrderNo() == orderNo) {
				return order;
			}
		}
		throw new RuntimeException("["+lottoNo+"]["+orderNo+"] 주문정보가 없습니다.");
		
	}
}
