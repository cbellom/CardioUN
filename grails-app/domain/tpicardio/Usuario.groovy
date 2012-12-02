package tpicardio

import java.util.List;

class Usuario extends User implements Serializable{
    
    double peso
    double altura
    double imc
	String genero
	boolean pruebaRealizada
	boolean citaSolicitada
    static hasMany = [citas:Cita]
	Imagen imagen
	
    static constraints = {
        edad(size:15..100,blank:false)
        peso(blank:false)
        altura(blank:false)
        imc(blank:false)
		genero(inList: estados, nullable:false)
		imagen (nullable:false)
    }

    
	static String genero_hombre = "Hombre"
	static String genero_mujer = "Mujer"	
	static List estados = [genero_hombre, genero_mujer]
	
	String toString(){
		cedula + " "+ username
	}
}
