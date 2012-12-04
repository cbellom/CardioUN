package tpicardio

class Maquina implements Serializable{
	String marca
	String modelo
	String observacion
	int numero
	long placaReferencia
	Entrenador entrenador
	Imagen imagen
	String tipo
	String estado
	
	

    static constraints = {
		observacion(maxSize:10000)
        estado(inList: estados, blank:false)
		tipo(inList: tipos)
    }
    static String estado_funcionando = "funcionando"
    static String estado_mantenimiento = "mantenimiento"
	static String estado_descompuesto = "descompuesto"
	static List estados = [estado_funcionando, estado_mantenimiento, estado_descompuesto]
	
	static String tipo_1 = "tipo1"
	static String tipo_2 = "tipo2"
	static String tipo_3 = "tipo3"
	static List tipos = [tipo_1, tipo_2, tipo_3]
	
	String toString(){
		" Placa referencia: "+ placaReferencia 
	}
}
    