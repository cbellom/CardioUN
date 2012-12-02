package tpicardio

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class EntrenadorController {
	
	def springSecurityService
	def coachRole = UserRole.findByAuthority("ROLE_COACH") ?: new UserRole(authority:"ROLE_COACH").save();
	def passwordGeneratorService
	
    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

	def currentUser(){
		return User.get(springSecurityService.principal.id)
	}
	
    def index() {
        redirect action: 'list', params: params
    }
	
	@Secured(["ROLE_ADMIN"])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [entrenadorInstanceList: Entrenador.list(params), entrenadorInstanceTotal: Entrenador.count()]
    }
	@Secured(["ROLE_COACH"])
	def perfilEntrenador(){
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def entrenadorInstance = currentUser()
		def usuarioInstanceList = new ArrayList<Usuario>()
		def maquinaInstanceList = new ArrayList<Maquina>()
		def tipInstanceList = new ArrayList<Tip>()
		def rutinaInstanceList =  new ArrayList<Rutina>()
		def pruebaValoracionInstanceList =new ArrayList<PruebaValoracion>()
		try{
			usuarioInstanceList = Usuario.list(params)
		}catch(Exception e){
			usuarioInstanceList = Usuario.findAll()
		}
		try{
			maquinaInstanceList = Maquina.list(params)
		}catch(Exception e){
			maquinaInstanceList = Maquina.findAll()
		}
		try{
			tipInstanceList = Tip.list(params)
		}catch(Exception e){
			tipInstanceList = Tip.findAll()
		}
		try{
			rutinaInstanceList = Rutina.list(params)
		}catch(Exception e){
			rutinaInstanceList = Rutina.findAll()
		}
		try{
			pruebaValoracionInstanceList = PruebaValoracion.list(params)
		}catch(Exception e){
			pruebaValoracionInstanceList = PruebaValoracion.findAll()
		}		
		[entrenadorInstance:entrenadorInstance,usuarioInstanceList:usuarioInstanceList,	maquinaInstanceList:maquinaInstanceList,
		tipInstanceList:tipInstanceList,pruebaValoracionInstanceList: pruebaValoracionInstanceList, pruebaValoracionInstanceTotal: PruebaValoracion.count(),
		rutinaInstanceTotal: Rutina.count(),usuarioInstanceTotal: Usuario.count(),tipInstanceTotal: Tip.count(),maquinaInstanceTotal: Maquina.count()]
	}
	
	@Secured(["ROLE_ADMIN"])
	def create() {
		switch (request.method) {
		case 'GET':
			def listaImagenes = Imagen.findAllByTipoPerfil(true)			
        	[entrenadorInstance: new Entrenador(params),listaImagenes:listaImagenes]
			break
		case 'POST':
	        def entrenadorInstance = new Entrenador(params)
			def imagen = new Imagen()
			imagen.nombre = entrenadorInstance.imagen.nombre
			imagen.tipoContenido = entrenadorInstance.imagen.tipoContenido
			imagen.tamano = entrenadorInstance.imagen.tamano
			imagen.archivo = entrenadorInstance.imagen.archivo
			imagen.tipoPerfil=false
			imagen.save()
			entrenadorInstance.imagen=imagen
			def pass= passwordGeneratorService.generateNew();
			entrenadorInstance.setPassword(pass)
			entrenadorInstance.setEnabled(true)
	        if (!entrenadorInstance.save(flush: true)) {
	            render view: 'create', model: [entrenadorInstance: entrenadorInstance]
	            return
	        }
			
			try {
				sendMail {
					to  "${entrenadorInstance.correo}"
					subject "BuoCardio: Registro nueva cuenta de Usuario"
					html    g.render(template:'/enviarCorreo/confirmarCorreo', model:[user:entrenadorInstance,pass:pass])
				}
				flash.message = "Confirmation email sent to ${entrenadorInstance.correo}"
			} catch(Exception e) {
				log.error "Problem sending email $e.message", e
				flash.message = "Confirmation email NOT sent"
			}
			UserUserRole.create entrenadorInstance, coachRole	
			flash.message = message(code: 'default.created.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), entrenadorInstance.id])
	        redirect action: 'show', id: entrenadorInstance.id
			break
		}
    }
	@Secured(["ROLE_ADMIN"])
    def show() {
        def entrenadorInstance = Entrenador.get(params.id)
        if (!entrenadorInstance) {
			render view:'show'
			return
        }
        [entrenadorInstance: entrenadorInstance, cedula: entrenadorInstance.cedula]
    }	
	@Secured(["ROLE_COACH"])
    def edit() {
		switch (request.method) {
		case 'GET':
	        def entrenadorInstance = Entrenador.get(params.id)
	        if (!entrenadorInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [entrenadorInstance: entrenadorInstance]
			break
		case 'POST':
	        def entrenadorInstance = Entrenador.get(params.id)
	        if (!entrenadorInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (entrenadorInstance.version > version) {
	                entrenadorInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'entrenador.label', default: 'Entrenador')] as Object[],
	                          "Another user has updated this Entrenador while you were editing")
	                render view: 'edit', model: [entrenadorInstance: entrenadorInstance]
	                return
	            }
	        }

	        entrenadorInstance.properties = params

	        if (!entrenadorInstance.save(flush: true)) {
	            render view: 'edit', model: [entrenadorInstance: entrenadorInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), entrenadorInstance.id])
	        redirect action: 'show', id: entrenadorInstance.id
			break
		}
    }
	@Secured(["ROLE_ADMIN"])
    def delete() {
        def entrenadorInstance = Entrenador.get(params.id)
        if (!entrenadorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), params.id])
            redirect action: 'list'
            return
        }

        try {
            entrenadorInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'entrenador.label', default: 'Entrenador'), params.id])
            redirect action: 'show', id: params.id
        }
    }
	
	def buscarPorCedula(){
		def entrenadorInstance = Entrenador.findAllByCedula(params.cedula)
		if (!entrenadorInstance) {
			render view:'show', model:[cedula:params.cedula]
			return
		}
		redirect action: 'show', id: entrenadorInstance.id
	}
	
	def cambiarPassword(){
		def entrenadorInstance = currentUser()
		if(entrenadorInstance.getPassword().equals(springSecurityService.encodePassword(params.oldPassword))){
			if(params.newPassword.equals(params.confirmNewPassword)){
				entrenadorInstance.setPassword(params.newPassword)
				if (!entrenadorInstance.save(flush: true)) {
					render view: '', model: [usuarioInstance: entrenadorInstance]
					return
				}
				flash.message = message(code: 'default.updated.message.password')
				redirect action: 'perfilEntrenador'
				return
			}
		}
		flash.message = message(code: 'default.not.updated.message.password')
		redirect action: 'perfilEntrenador'
	}
}
