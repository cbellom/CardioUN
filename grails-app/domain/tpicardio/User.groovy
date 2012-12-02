package tpicardio

import java.io.Serializable;

class User  implements Serializable{

	transient springSecurityService

	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired
	
	long cedula
	int edad
	String nombre
	String apellido
	String correo

	static constraints = {
		username (blank: false, unique: true, size:3..20)
		password (blank: false, password:true)
		cedula(size:7..10,blank:false, unique:true)
		nombre(size:3..50,blank:false)
		apellido(size:3..50,blank:false)
		correo(email:true,blank:false, unique:true)
		
    }	

	static mapping = {
		password column: '`password`'
	}

	Set<UserRole> getAuthorities() {
		UserUserRole.findAllByUser(this).collect { it.userRole } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
