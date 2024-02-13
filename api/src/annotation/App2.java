package annotation;

public class App2 {

	public static void main(String[] args) throws Exception {
		UserForm user = new UserForm("홍길동", "hong1234", "zxcv1234");
		
		FormValidator validator = new FormValidator();
		boolean isValid = validator.validate(user);
		System.out.println("유효성체크 통과여부: " + isValid);
	}
}
