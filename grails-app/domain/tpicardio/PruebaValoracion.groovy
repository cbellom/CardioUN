package tpicardio

import java.io.Serializable;

class PruebaValoracion  implements Serializable{
	
	double peso
	double imc
	double talla
	double flexibilidad
	double vo2
	int porcentajeGrasa
	int frecuenciaReposo
	int frecuenciaMax
	int frecuenciaPrueba
	int edad
	int latidos
	String descripcionImc
	String descripcionPorcentajeGrasa
	String descripcionFlexibilidad
	String descripcionVo2
	String grupo
	String antecedentes
	Date fecha
	Usuario usuario

    static constraints = {
		
		descripcionImc(nullable:true)
		descripcionPorcentajeGrasa(nullable:true)
		descripcionFlexibilidad(nullable:true)
		descripcionVo2(nullable:true)
		grupo(nullable:true)
				
    }
}