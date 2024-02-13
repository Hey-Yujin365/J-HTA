package constructor;

public class practiceProduct {

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		
		int savePosition = 0;
		
		Product[] db = new Product[100];
		
		while (true) {
			System.out.println("-------------");
			System.out.println("1상품조회 2상품등록 3검색 4수정");
			System.out.println("-------------");
			
			
			System.out.print("메뉴 선택:");
			int menuNo = scanner.nextInt();
			
			if (menuNo == 1) {
				System.out.println("전체상품 조회");
				
				for (Product p : db) {
					if (p == null) {
						break;
					}
					System.out.printf("%3d %-20s %-10s %5d만원 \n", p.no, p.name, p.maker, p.price);
				}
			} else if (menuNo == 2) {
				System.out.println("<<신규 상품 등록>>");
				System.out.println("### 신규 상품정보를 입력하세요.");
				System.out.print("상품번호 입력: ");
				int productNo = scanner.nextInt();
				
				System.out.print("상품 이름 입력: ");
				String productName = scanner.nextString();
				
				System.out.print("제조사 입력: ");
				String productMaker = scanner.nextString();
				
				System.out.print("상품가격 입력: ");
				int productPrice = scanner.nextInt();
				
				System.out.print("입고수량 입력: ");
				int productStock = scanner.nextInt();
				
				Product newProduct = new Product(productNo, productName, productMaker, productPrice, productStock);
				
				db[savePosition++] = newProduct; 
				System.out.println("### 신규 상품 정보 등록이 완료되었습니다.");
				
			} else if (menuNo == 3) {
				System.out.println("###상품검색");
				
				System.out.print("검색옵션 1품번 2제품명 3제조사 4가격: ");
				int optNo = scanner.nextInt();
				
				switch (optNo) {
				case 1:
					System.out.println("품번검색");
					System.out.print("검색할 품번: ");
					int goodNo = scanner.nextInt();
					
					for (Product p : db) {
						if (p == null) {
							break;
						}
						if (p.no == goodNo) {
							p.printProduct();
						}
					}
					break;
					
				case 2:
					System.out.println("상품명검색");
					System.out.print("검색할 상품명: ");
					String goodName = scanner.nextString();
					
					for (Product p : db) {
						if (p == null) {
							break;
						}
						if (p.name.equals(goodName)) {
							p.printProduct();
						}
					}
					break;
				case 3:
					System.out.println("제조사 검색");
					System.out.print("검색할 제조사명: ");
					String goodMaker = scanner.nextString();
					
					for (Product p : db) {
						if (p == null) {
							break;
						}
						if (p.maker.equals(goodMaker)) {
							p.printProduct();
						}
					}
					break;
				case 4:
					System.out.println("가격대 검색");
					System.out.print("최소가격: ");
					int minPrice = scanner.nextInt();
					
					System.out.print("최대가격: ");
					int maxPrice = scanner.nextInt();
					
					for (Product p : db) {
						if(p == null) {
							break;
						}
						if(minPrice <= p.price && p.price <= maxPrice) {
							p.printProduct();
						}
					}
					break;
				} 
				
			} else if (menuNo == 4) {
				System.out.println("상품정보 수정");
				System.out.print("수정할 상품 번호 입력: ");
				int searchNo = scanner.nextInt();
				
				Product origin = null;
				for (Product p : db) {
					if (p == null) {
						break;
					}
					if (p.no == searchNo) {
						origin = p;
						break;
					}
				}
				
			}
		
			
		}
		
		
		
		
		
		
		
	}
}
