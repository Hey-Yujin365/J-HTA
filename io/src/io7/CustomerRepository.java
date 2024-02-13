package io7;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class CustomerRepository {

	private List<Customer> db = new ArrayList<Customer>();

	// data.csv 파일을 읽어서 고객정보를 db에 저장시킨다.
	public void load() {
		try {
			BufferedReader reader
				= new BufferedReader(new FileReader("src/io7/data.csv"));
			
			String text = null;
			while ((text = reader.readLine()) != null) {
				db.add(Customer.toCustomer(text));
			}
			// 점유했던 자원을 반납시킨다.
			reader.close();
		
		} catch (FileNotFoundException ex) {
			throw new ShopException("파일을 찾을 수 없습니다.", ex);
		} catch (IOException ex) {
			throw new ShopException("파일 읽기 중 오류가 발생하였습니다", ex);
		}
		
	}
	
	// db의 고객정보를 data.csv 파일에 저장시킨다.
	public void stored() {
		try {
			PrintWriter writer = new PrintWriter("src/io7/data.csv");
			
			for (Customer customer : db) {
				String text = customer.toText();
				writer.println(text);
			}
			
			writer.flush();
			writer.close();
		} catch (FileNotFoundException ex) {
			throw new ShopException("파일을 찾을 수 없습니다.", ex);
		}
	}

	// Method Signature
	public void save(Customer customer) {
		db.add(customer);
		stored();
	}
	
	public List<Customer> findAll() {
	
		return db;
	}
	
	public Customer findByNo(int no) {
		for (Customer customer : db) {
			if (customer.getNo() == no) {
				return customer;
			}
		}
		return null;
	}
	
	public Customer findById(String id) {
		for (Customer customer : db) {
			if (customer.getId().equals(id)) {
				return customer;
			}
		}
		return null;
	}
	
	public void deleteByNo(int no) {
		Iterator<Customer> itr = db.iterator();
		while (itr.hasNext()) {
			Customer customer = itr.next();
			if (customer.getNo() == no) {
				itr.remove();
				break;
			}
		}
		
		stored();
	}

	public void update() {
		stored();
		
		
	}
	
	
}
