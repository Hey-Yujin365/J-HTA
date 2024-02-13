package io4;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URL;

import org.apache.commons.io.IOUtils;

public class App1 {

	public static void main(String[] args) throws Exception{
		
		/*
		 * URL
		 * 	- URL 객체는 지정된 URL 주소가 가리키는 자원을 표현하는 객체다.
		 * 	- URL 객체의 openStream() 메소드는 해당 자원과 연결된 읽기 스트림을 반환한다.
		 * 	- URL 객체의 openStream() 메소드를 실행해서 획득한 InputStream을 활용하면
		 * 	  URL 주소가 표현하는 자원을 읽어올 수 있다.
		 */
		URL url = new URL("https://cdn.imweb.me/upload/S201910012ff964777e0e3/62f9a36ea3cea.jpg");
		
		InputStream in = url.openStream();
		FileOutputStream out = new FileOutputStream("src/io4/sample.jpg");
		
		IOUtils.copy(in, out);
		
		in.close();
		out.close();
	}
}