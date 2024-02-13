
package map;

import java.util.HashMap;
import java.util.Map;

public class HashMapApp4 {

	public static void main(String[] args) {
		
		Map<String, MessageSender> map = new HashMap<>();
		map.put("sms", new SmsMessageSender());
		map.put("email", new EmailMessageSender());
		map.put("kakao", new KakaotalkMessageSender());
		
		User user1 = new User();
		user1.name = "홍길동";
		user1.senderTypes = new String[] {"sms", "kakao"}; 
		System.out.println("### " + user1.name + "에게 이벤트 메세지 전송하기");
		for (String type : user1.senderTypes) {	// type에는 "sms", "kakao"가 전달된다.
			MessageSender ms = map.get(type);
			ms.send();
		}
	}
	
	static class User {
		String name;			// 고객명
		String[] senderTypes;	// 고객이 수신동의한 메세지 수신방법들
	}
	
	static interface MessageSender {
		void send();
	}
	
	static class SmsMessageSender implements MessageSender {
		public void send() {
			System.out.println("SMS로 메세지를 보낸다.");
		}
	}
	
	static class EmailMessageSender implements MessageSender {
		public void send() {
			System.out.println("Email로 메세지를 보낸다.");
		}
	}
	
	static class KakaotalkMessageSender implements MessageSender {
		public void send() {
			System.out.println("kakaotalk으로 메세지를 보낸다.");
		}
	}
	
	
	
}
