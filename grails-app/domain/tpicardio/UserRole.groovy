package tpicardio

import java.io.Serializable;

class UserRole  implements Serializable{

	String authority

	static mapping = {
		cache true
	}

	static constraints = {
		authority blank: false, unique: true
	}
}
