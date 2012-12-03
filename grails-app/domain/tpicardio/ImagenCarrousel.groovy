package tpicardio

class ImagenCarrousel {
	
	Imagen imagen
	String titulo
	String descripcion
	
    static constraints = {
		titulo(blank:false)
		descripcion(blank:false)
		imagen(nullable:false)
    }
}
