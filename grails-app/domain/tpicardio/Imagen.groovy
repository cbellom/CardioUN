package tpicardio

import java.io.Serializable;

class Imagen  implements Serializable{

    String nombre
    String tipoContenido
    Long tamano
	boolean tipoPerfil
    byte[] archivo

    static constraints = {
       nombre maxSize:64,blank:false
       tipoContenido maxSize:128,blank:false
       tamano()
       archivo maxSize:20000000     
    }     
    static mapping = {         
       table 'imagenes'     
	} 
	String toString(){
		nombre
	}
}
