package tpicardio

class Persona implements Serializable{
		
    long cedula
    int edad
    String nombre
    String apellido
    String correo
   
    static constraints = {
        cedula(size:7..10,blank:false, unique:true)
        nombre(size:3..50,blank:false)
        apellido(size:3..50,blank:false)
        correo(email:true,blank:false, unique:true)
        edad(min:10,max:100,blank:false)
    }
		
}
