package tpicardio

class Entrenador extends User implements Serializable{

    String campoLaboral
	Imagen imagen
	    
    static constraints = {
		imagen (nullable:false)
    }
	
    String toString(){
       nombre +" "+ apellido
    }
}
