package io7;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository {

	private List<Customer> db = new ArrayList<Customer>();

	// data.csv 파일을 읽어서 고객정보를 db에 저장시킨다.
	public void load() throws FileNotFoundException, IOException {
		BufferedReader reader
			= new BufferedReader(new FileReader("src/io7/data.csv"));
		
		String text = null;
		while ((text = reader.readLine()) != null) {
			// text -> "10,kim,zxcv1234,김유신,kim@gmail.com,false"
			
			// items -> {"10", "kim", "zxcv1234", "김유신", "kim@gmail.com", "false"}
			String[] items = text.split(",");
			
			// 배열에서 해당 위치에 값을 조회해서 적절한 타입으로 변환한다.
			int no = Integer.valueOf(items[0]);
			String id = items[1];
			String password = items[2];
			String name = items[3];
			String email = items[4];
			boolean deleted = Boolean.valueOf(items[5]);
			//  Customer 객체를 생성해서 조회된 정보를 저장한다.
			Customer customer = new Customer();
			customer.setNo(no);
			customer.setId(id);
			customer.setPassword(password);
			customer.setName(name);
			customer.setEmail(email);
			customer.setDeleted(deleted);
			
			// Customer 객체를 List객체에 저장한다.
			db.add(customer);
			
			// 점유했던 자원을 반납시킨다.
			reader.close();
		}
	}
	
	// db의 고객정보를 data.csv 파일에 저장시킨다.
	public void stored() {
		
	}

	// Method Signature
	public void save(Customer customer) {
		
	}
	
	public List<Customer> findAll() {
	
		return db;
	}
	
	public Customer findByNo(int no) {
		
		return null;
	}
	
	public Customer findById(String id) {
		
		return null;
	}
	
	public void deleteByNo(int no) {
		
	}
	
	
}
