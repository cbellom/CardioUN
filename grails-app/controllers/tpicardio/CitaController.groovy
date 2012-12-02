package tpicardio

import java.text.SimpleDateFormat
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class CitaController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

	
	def springSecurityService
	
	def currentUser(){
		return User.get(springSecurityService.principal.id)
	}
	@Secured(['ROLE_COACH','ROLE_ADMIN','ROLE_USER'])
	def horario(){
		params.max = Math.min(params.max ? params.int('max') : 10, 100)

		def lista = new ArrayList()
		def listaCitas = Cita.list()
		
		
		def d;
		for (int i = 0;i<listaCitas.size();i++){
			d=new Hashtable();
			d.put("titulo", listaCitas[i].entrenador);
			d.put("usuarios", listaCitas[i].usuarios);
			d.put("start", listaCitas[i].fechaInicial);
			d.put("end", listaCitas[i].fechaFinal);
			d.put("id", listaCitas[i].id);
			lista.add(d)
		}
		
		[citaInstanceList: lista]

	}
	
	@Secured(['ROLE_COACH'])
	def agregar(){

		String fechaInicial = params.fechaInicial
		String fechaFinal = params.fechaFinal
		def df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		def fechaInicio = df.parse(fechaInicial);
		def fechaFin = df.parse(fechaFinal);
		
		
		
		Cita a= new Cita()
		a.fechaInicial = fechaInicio
		a.fechaFinal = fechaFin
		a.entrenador = User.get(springSecurityService.principal.id)
		a.save()
		
		flash.message = "Cita almacenada"
		redirect action: 'horario'
	}
	
	@Secured(['ROLE_USER'])
	def separar(){
		
		def citaInstance = Cita.get(params.id)
		if (!citaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
			redirect action: 'list'
			return
		}

		if (params.version) {
			def version = params.version.toLong()
			if (citaInstance.version > version) {
				citaInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
						  [message(code: 'cita.label', default: 'Cita')] as Object[],
						  "Another user has updated this Cita while you were editing")
				render view: 'edit', model: [citaInstance: citaInstance]
				return
			}
		}
		citaInstance.properties = params
		def usuarioInstance = User.get(springSecurityService.principal.id)
		if(usuarioInstance.citaSolicitada==false){
			flash.message = "Usted no tiene una solicitud de cita vigente"
			redirect action: 'horario'
			return
		}
		if(citaInstance.usuarios.size()<4){
			usuarioInstance.citaSolicitada=false
			usuarioInstance.pruebaRealizada=false
			citaInstance.addToUsuarios(usuarioInstance)
			if (!citaInstance.save(flush: true)) {
				flash.message = "No ha sido posible solicitar la cita, intente de nuevo"
				redirect action: 'horario'
				return
			}
			flash.message = "Cita estudiante almacenada"
			redirect action: 'horario'
			return
		}	
		flash.message = "La cita seleccionada ya posee el numero maximo de usuarios"
		redirect action: 'horario'
	}
	
	
	
	def debug(){
		
		def cita2 = Cita.get(1)
		def mensaje = "";
		mensaje+=cita2.usuarios
		[mensaje:mensaje]
	}

	
    def index() {
        redirect action: 'list', params: params
    }
	@Secured(['ROLE_COACH'])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [citaInstanceList: Cita.list(params), citaInstanceTotal: Cita.count()]
    }
	@Secured(['ROLE_COACH'])
    def create() {
		switch (request.method) {
		case 'GET':
        	[citaInstance: new Cita(params)]
			break
		case 'POST':
	        def citaInstance = new Cita(params)
	        if (!citaInstance.save(flush: true)) {
	            render view: 'create', model: [citaInstance: citaInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'cita.label', default: 'Cita'), citaInstance.id])
	        redirect action: 'show', id: citaInstance.id
			break
		}
    }
	@Secured(['ROLE_COACH'])
    def show() {
        def citaInstance = Cita.get(params.id)
        if (!citaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
            redirect action: 'list'
            return
        }

        [citaInstance: citaInstance]
    }	
	@Secured(['ROLE_COACH'])
    def edit() {
		switch (request.method) {
		case 'GET':
	        def citaInstance = Cita.get(params.id)
	        if (!citaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [citaInstance: citaInstance]
			break
		case 'POST':
	        def citaInstance = Cita.get(params.id)
	        if (!citaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (citaInstance.version > version) {
	                citaInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'cita.label', default: 'Cita')] as Object[],
	                          "Another user has updated this Cita while you were editing")
	                render view: 'edit', model: [citaInstance: citaInstance]
	                return
	            }
	        }

	        citaInstance.properties = params

	        if (!citaInstance.save(flush: true)) {
	            render view: 'edit', model: [citaInstance: citaInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'cita.label', default: 'Cita'), citaInstance.id])
	        redirect action: 'show', id: citaInstance.id
			break
		}
    }
	@Secured(['ROLE_COACH','ROLE_ADMIN'])
    def delete() {
        def citaInstance = Cita.get(params.id)
        if (!citaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
            redirect action: 'list'
            return
        }

        try {
			def usuarioInstanceList = citaInstance.usuarios
			citaInstance.entrenador=null
			println("usuarios "+ usuarioInstanceList)
			
			println("lista: ")
			
			for(int i=0;i<citaInstance.usuarios.size();i++){
				def usuarioInstance = citaInstance.usuarios.asList().get(i)
				usuarioInstance.citaSolicitada=true
				usuarioInstance.removeFromCitas(citaInstance)
				try {
					sendMail {
						to  "${usuarioInstance.correo}"
						subject "BuoCardio: Eliminacion de cita asignada"
						html    g.render(template:'/enviarCorreo/eliminacionCita', model:[usuarioInstance:usuarioInstance])
					}
					flash.message = "Confirmation email sent to ${usuarioInstance.correo}"
				} catch(Exception e) {
					log.error "Problem sending email $e.message", e
					flash.message = "Confirmation email NOT sent"
				}
			}
						
			flash.message = "Confirmation email sent"
            citaInstance.delete()
			redirect action: 'list'
			
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cita.label', default: 'Cita'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
