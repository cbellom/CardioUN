package tpicardio

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class AdministradorController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']
	def adminRole = UserRole.findByAuthority("ROLE_ADMIN") ?: new UserRole(authority:"ROLE_ADMIN").save();
	def springSecurityService
	def passwordGeneratorService
	
	def currentUser(){
		return User.get(springSecurityService.principal.id)
	}
	
    def index() {
        redirect action: 'list', params: params
    }
	@Secured(['ROLE_ADMIN'])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [administradorInstanceList: Administrador.list(params), administradorInstanceTotal: Administrador.count()]
    }
	@Secured(['ROLE_ADMIN'])
	def perfilAdministrador(){
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def administradorInstance = currentUser()
		def usuarioInstanceList = new ArrayList<Usuario>()
		def entrenadorInstanceList = new ArrayList<Entrenador>()
		def imagenInstanceList = new ArrayList<Imagen>()
		def cursosInstanceList = new ArrayList<Cursos>()
		def imagenCarrouselInstanceList = new ArrayList<ImagenCarrousel>()
		try{
			usuarioInstanceList = Usuario.list(params)
		}catch(Exception e){
			usuarioInstanceList = Usuario.findAll()
		}
		try{
			entrenadorInstanceList = Entrenador.list(params)
		}catch(Exception e){
			entrenadorInstanceList = Entrenador.findAll()
		}
		try{
			cursosInstanceList = Cursos.list(params)
		}catch(Exception e){
			cursosInstanceList = Cursos.findAll()
		}
		try{
			imagenInstanceList = Imagen.list(params)
			for(int i=0;i<imagenInstanceList.size;i++){
				if(imagenInstanceList.get(i).tipoPerfil==false){
					imagenInstanceList.remove(i)
					i--
				}
			}
		}catch(Exception e){
			imagenInstanceList = Imagen.findAllByTipoPerfil(true)
		}
		try{
			imagenCarrouselInstanceList = ImagenCarrousel.list(params)
		}catch(Exception e){
			imagenCarrouselInstanceList = ImagenCarrousel.findAll()
		}
		[administradorInstance: administradorInstance,usuarioInstanceList: usuarioInstanceList,	entrenadorInstanceList: entrenadorInstanceList,cursosInstanceList: cursosInstanceList,
		imagenInstanceList: imagenInstanceList,usuarioInstanceTotal: Usuario.count(), imagenInstanceTotal: Imagen.count(),entrenadorInstanceTotal: Entrenador.count(),
		cursosInstanceTotal: Cursos.count(), imagenCarrouselInstanceList: imagenCarrouselInstanceList, imagenCarrouselInstanceTotal: ImagenCarrousel.count()]
	}
	@Secured(['ROLE_ADMIN'])
    def create() {
		switch (request.method) {
		case 'GET':
        	[administradorInstance: new Administrador(params)]
			break
		case 'POST':
	        def administradorInstance = new Administrador(params)
			def pass= passwordGeneratorService.generateNew();
			administradorInstance.setPassword(pass)		
			administradorInstance.setEnabled(true)		
	        if (!administradorInstance.save(flush: true)) {
	            render view: 'create', model: [administradorInstance: administradorInstance]
	            return
	        }
			try {
				sendMail {
					to  "${administradorInstance.correo}"
					subject "BuoCardio: Registro nueva cuenta de Administrador"
					html    g.render(template:'/enviarCorreo/confirmarCorreo', model:[user:administradorInstance,pass:pass])
				}
				flash.message = "Confirmation email sent to ${administradorInstance.correo}"
			} catch(Exception e) {
				log.error "Problem sending email $e.message", e
				flash.message = "Confirmation email NOT sent"
			}
			UserUserRole.create administradorInstance, adminRole
			flash.message = message(code: 'default.created.message', args: [message(code: 'administrador.label', default: 'Administrador'), administradorInstance.id])
	        redirect action: 'perfilAdministrador'
			break
		}
    }
	@Secured(['ROLE_ADMIN'])
    def show() {
        def administradorInstance = User.get(params.id)
        if (!administradorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])
            redirect action: 'list'
            return
        }
        [administradorInstance: administradorInstance]
    }
	@Secured(['ROLE_ADMIN'])
    def edit() {
		switch (request.method) {
		case 'GET':
	        def administradorInstance = currentUser()
	        if (!administradorInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [administradorInstance: administradorInstance]
			break
		case 'POST':
	        def administradorInstance = currentUser()
	        if (!administradorInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (administradorInstance.version > version) {
	                administradorInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'administrador.label', default: 'Administrador')] as Object[],
	                          "Another user has updated this Administrador while you were editing")
	                render view: 'edit', model: [administradorInstance: administradorInstance]
	                return
	            }
	        }

	        administradorInstance.properties = params

	        if (!administradorInstance.save(flush: true)) {
	            render view: 'edit', model: [administradorInstance: administradorInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'administrador.label', default: 'Administrador'), administradorInstance.id])
	        redirect action: 'show', id: administradorInstance.id
			break
		}
    }

	@Secured(['ROLE_ADMIN'])
    def delete() {
        def administradorInstance = currentUser()
        if (!administradorInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])
            redirect action: 'list'
            return
        }

        try {
            administradorInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'administrador.label', default: 'Administrador'), params.id])
            redirect action: 'show', id: params.id
        }
    }
	@Secured(['ROLE_ADMIN'])
	def cambiarPassword(){
		def administradorInstance = currentUser()
		if(administradorInstance.getPassword().equals(springSecurityService.encodePassword(params.oldPassword))){
			if(params.newPassword.equals(params.confirmNewPassword)){
				administradorInstance.setPassword(params.newPassword)
				if (!administradorInstance.save(flush: true)) {
					render view: '', model: [administradorInstance: administradorInstance]
					return
				}	
				flash.message = message(code: 'default.updated.message.password')
				redirect action: 'perfilAdministrador'
				return
			}else{
				flash.message = message(code: 'default.not.update.message.password')
				redirect action: 'perfilAdministrador'
				return
			}
		}
		flash.message = message(code: 'default.not.update.message.password')
		redirect action: 'perfilAdministrador'
		return
	}
	
}
