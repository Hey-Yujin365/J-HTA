package io7;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.List;

public class CustomerService {

	private CustomerRepository repo = new CustomerRepository();
	
	public CustomerService() throws FileNotFoundException, IOException {
		repo.load();
	}
	
	/**
	 * 모든 고객정보를 반환한다.
	 * @return 고객 리스트
	 */
	public List<Customer> getAllCustomers() {
		return repo.findAll();
	}
	
}
