package jdbc3;

import java.sql.SQLException;
import java.util.List;

public class ProductUI {

	private ProductDao productDao = new ProductDao();
	private Scanner scanner = new Scanner(System.in);
	
	public void showMenu() {
		System.out.println("--------------------------------------------------------------------");
		System.out.println("1.전체조회 2.상세조회 3.검색(가격) 4.신규등록 5.삭제 6.가격수정 7.재고수정 0.종료");
		System.out.println("--------------------------------------------------------------------");
		
		System.out.print("### 메뉴번호: ");
		int menuNo = scanner.nextInt();
		
		try {
			switch(menuNo)  {
			case 1: 전체조회(); break;
			case 2: 상세조회(); break;
			case 3: 검색(); break;
			case 4: 신규등록(); break;
			case 5: 삭제(); break;
			case 6: 가격수정(); break;
			case 7: 재고수정(); break;
			case 0: 종료(); break;
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		
		System.out.println();
		System.out.println();
		System.out.println();
		
		showMenu();
	}
	
	private void 전체조회() throws SQLException {
		System.out.println();
		System.out.println("<< 전체 상품 조회 >>");
		
		List<Product> products = productDao.getAllProducts();
		
		if (products.isEmpty()) {
			System.out.println("### 상품 정보가 존재하지 않습니다.");
			return;
		}
		
		System.out.println("-------------------------------------------");
		System.out.println("번호\t재고\t가격\t제조사\t상품명");
		System.out.println("-------------------------------------------");
		for (Product product : products) {
			System.out.print(product.getNo() + "\t");
			System.out.print(product.getStock() + "\t");
			System.out.print(product.getPrice() + "\t");
			System.out.print(product.getMaker() + "\t");
			System.out.println(product.getName() + "\t");
		}
		System.out.println("------------------------------------------");
	}
	
	private void 상세조회() throws SQLException {
		System.out.println();
		System.out.println("<< 상품 상세 조회>>");
		
		System.out.println("### 상품번호를 입력해서 상품 상세정보를 확인하세요.");
		System.out.print("상품번호: ");
		int no = scanner.nextInt();
		
		Product product = productDao.getProductByNo(no);

		if (product == null) {
			System.out.println("### 상품번호: ["+no+"] 상품정보가 존재하지 않습니다.");
			return;
		}
		
		System.out.println("상품 상세 정보");
		System.out.println("-----------------------------------------");
		System.out.println("번호: " + product.getNo());
		System.out.println("상품명: " + product.getName());
		System.out.println("제조사: " + product.getMaker());
		System.out.println("가격: " + product.getPrice());
		System.out.println("할인가격: " + product.getDiscountPrice());
		System.out.println("재고: " + product.getStock());
		System.out.println("품절여부: " + product.getSoldOut());
		System.out.println("등록일: " + product.getCreatedDate());
		System.out.println("수정일: " + product.getUpdatedDate());
		System.out.println("-----------------------------------------");
		
		
	}
	
	private void 검색() throws SQLException {
		System.out.println();
		System.out.println("<< 상품 검색 >>");
		
		System.out.println("### 최저가격, 최고가격을 입력하세요.");
		System.out.print("최저가격: ");
		int minPrice = scanner.nextInt();
		System.out.print("최고가격: ");
		int maxPrice = scanner.nextInt();
		
		List<Product> products = productDao.getProductsByPrice(minPrice, maxPrice);
		
		if (products.isEmpty()) {
			System.out.println("### 상품 정보가 존재하지 않습니다.");
			return;
		}
		
		System.out.println("-----------------------------------------");
		System.out.println("번호\t재고\t제조사\t가격\t상품명");
		System.out.println("-----------------------------------------");
		for (Product product : products) {
			System.out.print(product.getNo() + "\t");
			System.out.print(product.getStock() + "\t");
			System.out.print(product.getMaker() + "\t");
			System.out.print(product.getPrice() + "\t");
			System.out.println(product.getName() + "\t");
		}
		System.out.println("-----------------------------------------");
	}
	
	private void 신규등록() throws SQLException {
		System.out.println();
		System.out.println("<< 신규 상품 등록 >>");
		System.out.println("### 신규 상품 정보를 입력하세요.");
		
		System.out.print("### 번호: ");
		int no = scanner.nextInt();
		System.out.print("###상품명: ");
		String name = scanner.nextString();
		System.out.print("###제조사: ");
		String maker = scanner.nextString();
		System.out.print("###가격: ");
		int price = scanner.nextInt();
		System.out.print("###할인가격: ");
		int discountPrice = scanner.nextInt();
		System.out.print("###재고: ");
		int stock = scanner.nextInt();
		
		Product product = new Product();
		product.setNo(no);
		product.setName(name);
		product.setMaker(maker);
		product.setPrice(price);
		product.setDiscountPrice(discountPrice);
		product.setStock(stock);
		
		productDao.insertProduct(product);
		System.out.println("### 신규 상품을 등록하였습니다.");
	}
	
	private void 삭제() throws SQLException {
		System.out.println();
		System.out.println("<< 상품 정보 삭제 >>");
		System.out.println("삭제할 상품 정보를 입력하세요.");
		
		System.out.print("상품번호: ");
		int no = scanner.nextInt();
		
		productDao.deleteProduct(no);
		
		System.out.println("상품번호: [" +no+ "] 상품정보가 삭제되었습니다.");
	}
	
	private void 가격수정() throws SQLException {
		System.out.println();
		System.out.println("<< 상품 가격 수정 >>");
		System.out.println("### 상품번호, 상품가격, 할인가격을 입력하세요.");
		
		System.out.print("상품번호: ");
		int no = scanner.nextInt();
		System.out.print("상품가격: ");
		int price = scanner.nextInt();
		System.out.print("할인가격: ");
		int discountPrice = scanner.nextInt();
		
		productDao.updatePrice(no, price, discountPrice);
		
		System.out.println("상품 가격 정보가 수정되었습니다.");
	}
	
	private void 재고수정() throws SQLException {
		System.out.println();
		System.out.println("<< 상품 재고 수정 >>");
		System.out.println("### 상품번호, 상품수량을 입력하세요.");
		
		System.out.print("상품번호: ");
		int no = scanner.nextInt();
		System.out.print("상품수량: ");
		int stock = scanner.nextInt();
		
		productDao.updateStock(no, stock);
		
		System.out.println("상품 수량 정보가 수정되었습니다.");
		
	}
	
	private void 종료() {
		System.out.println("### 프로그램을 종료합니다.");
		System.exit(0);
	}
	
	public static void main(String[] args) {
		new ProductUI().showMenu();
	}
	
}
