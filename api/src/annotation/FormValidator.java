package annotation;

import java.lang.reflect.Field;

public class FormValidator {

	public boolean validate(Object target) throws Exception {
		boolean isValid = true;
		
		Class<?> clazz = target.getClass();
		Field[] fields = clazz.getDeclaredFields();
		for (Field field : fields) {
			boolean result1 = checkMin(target, field);
			if (!result1) {
				isValid = false;
				break;
			}
		}
		
		return isValid;
	}
	
	// 문자열의 최소 길이를 검증한다.
	private boolean checkMin(Object target, Field field) throws Exception {
		// 해당 필드에서 @Min 어노테이션 객체를 조회한다.
		Min min = field.getDeclaredAnnotation(Min.class);
		// Min 객체가 존재하지 않으면 검증 결과를 true로 반환한다.
		if (min == null) {
			return true;
		}
		
		// @Min 어노테이션의 value 속성값을 조회한다.
		int minLength = min.value();
		// 해당 필드에 설정된 문자열값을 조회한다.
		field.setAccessible(true);
		String fieldValue = (String) field.get(target);
		// 문자열이 null이면 true를 반환한다.
		if (fieldValue == null) {
			return true;
		}
		// 문자열의 길이가 지정된 최소길이보다 짧으면 false를 반환한다.
		if (fieldValue.length() < minLength) {
			return false;
		}
		return true;
		
	}
//	private boolean checkMax(Object target, Field field) throws Exception {
//		
//	}
//	private boolean checkNotBlank(Object target, Field field) throws Exception {
//		
//	}
}
