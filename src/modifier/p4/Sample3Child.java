package modifier.p4;

import modifier.p3.Sample3;

public class Sample3Child extends Sample3 {

	public void method() {
		// private 접근제한이 적용된 value1은 접근할 수 없다.
//		value1 = 10;

		// default 접근제한이 적용된 value2는 접근할 수 없다.
//		value2 = 10;
		
		// protected 접근제한이 적용된 value3는 접근할 수 있다. 
		value3 = 10;
		
		// public 접근제한이 적용된 value4는 접근할 수 있다.
		value4 = 10;
	}
	
}
