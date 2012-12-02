package tpicardio

class Cita implements Serializable{
    Date fechaInicial  
    Date fechaFinal  
	Entrenador entrenador 
	static belongsTo = Usuario
	static hasMany = [usuarios:Usuario]    
	
		
}
