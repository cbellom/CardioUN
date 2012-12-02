package tpicardio

class Ejercicio implements Serializable{

    String nombre
    String descripcion
    Entrenador entrenador	
	Imagen imagen 
    
    static constraints = {
		nombre(maxSize:50, blank:false)
		descripcion(maxSize:10000, blank:false)
		entrenador(blank:false)
		imagen (nullable:true)
    }
}
