package tpicardio

class Tip implements Serializable{

    Entrenador entrenador
    String nombre
    String descripcion    
	
    
    static constraints = {
		descripcion(maxSize:10000)
    }
}
