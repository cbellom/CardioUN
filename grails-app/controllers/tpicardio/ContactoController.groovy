package tpicardio

class ContactoController {

    def index() { 
		redirect action: 'contacto', params: params
	}
	
	def contacto(){
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[contenido: params.contenido, asunto: params.asunto,nombre: params.nombre, correo:params.correo]
	}
	def enviar(){
		def contenido = params.contenido
		def asunto = params.asunto
		def nombre = params.nombre
		def correo = params.correo
		try {
			sendMail {
				to "cardiotpi@gmail.com"
				subject "BuoCardio: Contacto "+asunto
				html    g.render(template:'/contacto/mensajeContacto', model:[contenido:contenido,nombre:nombre,correo:correo])
			}
			flash.message = "Confirmation email sent"
			redirect action: "contacto"
		} catch(Exception e) {
			log.error "Problem sending email $e.message", e
			flash.message = "Confirmation email NOT sent"
			redirect action: "contacto"
		}
	}	
}
