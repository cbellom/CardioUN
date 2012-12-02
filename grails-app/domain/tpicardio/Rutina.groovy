package tpicardio

import java.io.Serializable;

class Rutina  implements Serializable{
	
	String grupo
	String objetivo
	String caracteristicas
	String periodo
	String frecuenciaSemanal
	String duracionSesion
	String porcentajeFrecuenciaMax
	String metodo
	Usuario usuario
	
    static constraints = {
		grupo(blank:false)
		objetivo(blank:false)
		caracteristicas(blank:false)
		periodo(blank:false)
		frecuenciaSemanal(blank:false)
		duracionSesion(blank:false)
		porcentajeFrecuenciaMax(blank:false)
		metodo(maxSize:1000000,blank:false)
		usuario(nullable:false)
    }
	
	String toString(){
		grupo+"\n"+
		objetivo+"\n"+
		caracteristicas+"\n"+
		periodo+"\n"+
		frecuenciaSemanal+"\n"+
		duracionSesion+"\n"+
		porcentajeFrecuenciaMax+"\n"+
		metodo+"\n"		
	}
	
}
