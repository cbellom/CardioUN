package tpicardio

class Cursos {
	String nombre
	String url
    static constraints = {
		nombre (blank: false, unique: true, size:2..20)
		url (blank: false)
    }
}
