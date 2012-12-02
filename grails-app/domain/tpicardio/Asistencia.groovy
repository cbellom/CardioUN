package tpicardio

class Asistencia implements Serializable{

    Date fecha;
    Usuario usuario;
	int percepcionEsfuerzo
    
    static constraints = {
		fecha(blank:false)
		usuario(blank:false)
		percepcionEsfuerzo(blank:false, range:0..10)
    }
}
