package io7;

import java.io.FileNotFoundException;
import java.io.IOException;

public class ShopUI {

	private CustomerService service;
	
	public ShopUI() throws FileNotFoundException, IOException {
		service = new CustomerService();
	}
	
	public void 전체조회() {
		service.getAllCustomers();
	}
	
	public static void main(String[] args) {
		
		try {
			ShopUI ui = new ShopUI();
			
			
		} catch (FileNotFoundException ex) {
			ex.printStackTrace();
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}
}
