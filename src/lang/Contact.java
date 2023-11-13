package lang;

import java.util.Objects;

public class Contact {

	String name;
	String phone;
	String email;
	String company;
	
	
	
	@Override
	public int hashCode() {
		return Objects.hash(name, phone);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Contact other = (Contact) obj;
		return Objects.equals(name, other.name) && Objects.equals(phone, other.phone);
	}



	// Object로부터 상속받은 toString() 재정의하기
	@Override
	public String toString() {
		return "Contact [name=" + name + ", phone=" + phone + ", email=" + email + ", company=" + company + "]";
	}
	
	
}
