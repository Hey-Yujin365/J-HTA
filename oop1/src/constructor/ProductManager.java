package constructor;

public class ProductManager {

	public static void main(String[] args) {
		
		// 키보드 입력을 읽어오는 Scanner 객체를 생성한다.
		Scanner scanner = new Scanner(System.in);
	
		// 배열에서 상품정보의 저장 위치를 추적하는 변수다.
		int savePosition = 0;
		
		// 상품정보를 여러개 저장하는 배열이다.
		Product[] db = new Product[100];
		
		db[savePosition++] = new Product(100, "iphone15", "apple", 150, 3);
		db[savePosition++] = new Product(101, "iphone15 pro", "apple", 170, 3);
		db[savePosition++] = new Product(111, "macbook pro", "apple", 250, 3);
		db[savePosition++] = new Product(115, "ipad pro", "apple", 90, 3);
		db[savePosition++] = new Product(106, "galaxy flip", "samsung", 170, 3);

		while(true) {
			System.out.println("-----------------------------------------------");
			System.out.println("1.전체조회  2.신규등록  3.검색  4.수정  5.삭제  0.종료");
			System.out.println("-----------------------------------------------");
			
			System.out.print("메뉴를 선택하세요: ");
			int menuNo = scanner.nextInt();
			
			if (menuNo == 1) {
				System.out.println("<<전체 상품 조회>>");
				
				for(Product p : db) {
					if (p == null) {
						break;
					}
					System.out.printf("%3d %-20s %-10s %5d만원 \n", p.no, p.name, p.maker, p.price);
				}
				
			} else if (menuNo == 2) {
				System.out.println("<<신규 상품 등록>>");
				System.out.println("### 신규 상품정보를 입력하세요.");
				System.out.print("### 상품번호 입력: ");
				int no = scanner.nextInt();
				
				System.out.print("### 상품이름 입력: ");
				String name = scanner.nextString();
				
				System.out.print("### 제조회사 입력: ");
				String maker = scanner.nextString();

				System.out.print("### 상품가격 입력: ");
				int price = scanner.nextInt();

				System.out.print("### 입고수량 입력: ");
				int stock = scanner.nextInt();
				
				// 입력값으로 초기화된 Product 객체
				Product product = new Product(no, name, maker, price, stock);
				
				// 배열에 Product 객체 저장
				db[savePosition++] = product;
				
				System.out.println("### 신규 상품 정보 등록이 완료되었습니다.");
				
			} else if (menuNo == 3) {
				System.out.println("<<상품 정보 검색>>");
				
				System.out.print("### 검색옵션을 선택하세요.(1:번호, 2:이름, 3:제조사, 4:가격): ");
				int optNo = scanner.nextInt();
				switch (optNo) {
				case 1:
					System.out.println("### 상품번호로 검색하기");
					System.out.print("###검색할 상품번호 입력: ");
					int no = scanner.nextInt();
					
					for (Product p : db) {
						if (p == null) {
							break;
						}
						if (p.no == no) {
							p.printProduct();
						}
					}
					break;
					
				case 2:
					System.out.println("### 상품명으로 검색하기");
					System.out.print("###검색할 상품명 입력: ");
					String name = scanner.nextString();
					
					for (Product p : db) {
						if (p == null) {
							break;
						}
						// if (p.name == name) { // 이건 동일성 비교
						//	p.printProduct();
						//}
						if(p.name.equals(name)) {	// 동등성 비교를 시켜주는 메소드
							p.printProduct();
						}
					}
					break;
					
				case 3:
					System.out.println("### 제조사로 검색하기");
					System.out.print("###검색할 제조사 입력: ");
					String maker = scanner.nextString();
					for (Product p : db) {
						if (p == null) {
							break;
						}
						if (p.maker.equals(maker)) {
							p.printProduct();
						}
					}
					break;
					
				case 4:
					System.out.println("### 가격으로 검색하기");
					System.out.print("###검색할 최저가격 입력: ");
					int minPrice = scanner.nextInt();
					System.out.print("###검색할 최고가격 입력: ");
					int maxPrice = scanner.nextInt();
					
					for (Product p : db) {
						if (p == null) {
							break;
						}
						if (p.price >= minPrice && p.price <= maxPrice) {
							// minPrice <= p.price <= maxPrice 이런 형식 안 됨 - 이항연산자라 실행 불가
							// (minPrice <= p.price) <= maxPrice 이런 형식 안 됨 - 불린값이라 비교 자체가 안 됨
							p.printProduct();
						}
					}
					break;
				}
				
				
			} else if (menuNo == 4) {
				System.out.println("<<상품 정보 수정>>");
				System.out.print("### 수정할 상품의 번호를 입력하세요: ");
				int no = scanner.nextInt();
				
				Product origin = null;
				
				for (Product p : db) {
					if (p == null) {
						break;
					}
					if (p.no == no) {
						origin = p;
						break;
					}
				}
				
				if (origin == null) {
					System.out.println("### 상품번호에 해당하는 상품정보가 없습니다.");
				} else {
					System.out.println("### 수정할 상품정보를 확인하세요.");
					origin.printProduct();

					System.out.println("### 이름, 가격, 수량정보를 입력해서 상품정보를 변경하세요.");
					
					System.out.print("### 상품이름 입력: ");
					String name = scanner.nextString();
					
					System.out.print("### 상품가격 입력: ");
					int price = scanner.nextInt();
					
					System.out.print("### 상품수량 입력: ");
					int stock = scanner.nextInt();
					
					origin.name = name;
					origin.price = price;
					origin.stock = stock;
					
					System.out.println("### 상품정보 수정이 완료되었습니다.");
				}
				
			} else if (menuNo == 5) {
				System.out.println("<<상품 정보 삭제>>");
				
				
			} else if (menuNo == 0) {
				System.out.println("<<프로그램 종료>>");
				System.exit(0);
			}
			
			System.out.println();
			System.out.println();
		
		}
	
	
	}
}
