package tpicardio

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import grails.plugins.springsecurity.SpringSecurityService;

class UsuarioController {
	
	def springSecurityService
	def userRole = UserRole.findByAuthority("ROLE_USER") ?: new UserRole(authority:"ROLE_USER").save();
	def passwordGeneratorService

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def currentUser(){
		return User.get(springSecurityService.principal.id)
	}	
	
	def index() {
        redirect action: 'list', params: params
    }
	@Secured(['ROLE_COACH','ROLE_ADMIN'])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [usuarioInstanceList: Usuario.list(params), usuarioInstanceTotal: Usuario.count()]
    }
	@Secured(['ROLE_USER'])
	def perfilUsuario(){
		def usuarioInstance = Usuario.get(currentUser().id)
		def pruebaValoracionInstanceList = PruebaValoracion.findAllByUsuario(usuarioInstance)	
		def rutinaInstanceList = Rutina.findAllByUsuario(usuarioInstance)
		def rutinaInstance = new Rutina()
		if(!rutinaInstanceList || rutinaInstanceList.isEmpty()){
			rutinaInstance==null
		}else{
			rutinaInstance = rutinaInstanceList.get(rutinaInstanceList.size -1)
		}
		[usuarioInstance: usuarioInstance, pruebaValoracionInstanceList:pruebaValoracionInstanceList, rutinaInstance:rutinaInstance]
	}
	@Secured(['ROLE_COACH','ROLE_ADMIN'])
    def create() {
		switch (request.method) {
		case 'GET':
			def listaImagenes = Imagen.findAllByTipoPerfil(true)
        	[usuarioInstance: new Usuario(params), listaImagenes:listaImagenes]			
			break
		case 'POST':		
	        def usuarioInstance = new Usuario(params)
			def imagen = new Imagen()
			imagen.nombre = usuarioInstance.imagen.nombre
			imagen.tipoContenido = usuarioInstance.imagen.tipoContenido
			imagen.tamano = usuarioInstance.imagen.tamano
			imagen.archivo = usuarioInstance.imagen.archivo
			imagen.tipoPerfil=false
			imagen.save()
			usuarioInstance.imagen=imagen
			def pass= passwordGeneratorService.generateNew();
			usuarioInstance.setPassword(pass)
			usuarioInstance.pruebaRealizada=false
			usuarioInstance.citaSolicitada= true
			usuarioInstance.setEnabled(true)
			usuarioInstance.peso = 0
			usuarioInstance.altura = 0
			usuarioInstance.imc = 0
			
	        if (!usuarioInstance.save(flush: true)) {
	            render view: 'create', model: [usuarioInstance: usuarioInstance]
	            return
	        }
			try {
				sendMail {
					to  "${usuarioInstance.correo}"
					subject "BuoCardio: Registro nueva cuenta de Usuario"
					html    g.render(template:'/enviarCorreo/confirmarCorreo', model:[user:usuarioInstance,pass:pass])
				}
				flash.message = "Confirmation email sent to ${usuarioInstance.correo}"
			} catch(Exception e) {
				log.error "Problem sending email $e.message", e
				flash.message = "Confirmation email NOT sent"
			}
			UserUserRole.create usuarioInstance, userRole
			flash.message = message(code: 'default.created.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
	        redirect action: 'show', id: usuarioInstance.id
			break
		}
    }
    def show() {
		def idAux = Long.parseLong(params.id)
		def usuarioInstance = Usuario.get(idAux)
        if (!usuarioInstance) {
			render view:'show'
			return
        }
		
		def lista = new ArrayList<Asistencia>()
		def asistenciaInstanceList = new ArrayList<Asistencia>()
		def percepcionInstanceList = new ArrayList<Asistencia>()
		
        lista = Asistencia.findAllByUsuario(usuarioInstance)
		
		if(lista.size<1){
			render view: 'show', model:[usuarioInstance: usuarioInstance, cedula: usuarioInstance.cedula, percepcionInstanceList :percepcionInstanceList, asistenciaInstanceList:asistenciaInstanceList]
			return
		}
		
		def fechaInicial = lista.get(0).fecha 
		def fechaFinal = lista.get(lista.size-1).fecha
		int i=0
		
		while(fechaInicial<=fechaFinal){
			def asistenciaAux =  new Asistencia()
			asistenciaAux.fecha=fechaInicial
			if(lista.get(i).fecha.year == fechaInicial.year	&& lista.get(i).fecha.month == fechaInicial.month && lista.get(i).fecha.date == fechaInicial.date){
				percepcionInstanceList.add(lista.get(i))
				asistenciaAux.percepcionEsfuerzo=1
				asistenciaInstanceList.add(asistenciaAux)
				i=i+1
			}else{
				asistenciaAux.percepcionEsfuerzo=0
				asistenciaInstanceList.add(asistenciaAux)
				percepcionInstanceList.add(asistenciaAux)
			}
			fechaInicial = fechaInicial+1
		}
		[usuarioInstance: usuarioInstance, cedula: usuarioInstance.cedula, percepcionInstanceList :percepcionInstanceList, asistenciaInstanceList:asistenciaInstanceList]
    }	
	@Secured(['ROLE_COACH','ROLE_ADMIN','ROLE_USER'])
    def edit() {
		switch (request.method) {
		case 'GET':
	        def usuarioInstance = Usuario.get(params.id)
	        if (!usuarioInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [usuarioInstance: usuarioInstance]
			break
		case 'POST':
	        def usuarioInstance = Usuario.get(params.id)
			if(usuarioInstance.citaSolicitada == true){
				usuarioInstance.pruebaRealizada = false
			}
	        if (!usuarioInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (usuarioInstance.version > version) {
	                usuarioInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'usuario.label', default: 'Usuario')] as Object[],
	                          "Another user has updated this Usuario while you were editing")
	                render view: 'edit', model: [usuarioInstance: usuarioInstance]
	                return
	            }
	        }

	        usuarioInstance.properties = params

	        if (!usuarioInstance.save(flush: true)) {
	            render view: 'edit', model: [usuarioInstance: usuarioInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'usuario.label', default: 'Usuario'), usuarioInstance.id])
	        redirect action: 'show', id: usuarioInstance.id
			break
		}
    }
	@Secured(['ROLE_COACH','ROLE_ADMIN'])
    def delete() {
        def usuarioInstance = Usuario.get(params.id)
        if (!usuarioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect action: 'list'
            return
        }

        try {
            usuarioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect action: 'show', id: params.id
        }
    }
	@Secured(['ROLE_COACH','ROLE_ADMIN'])
	def buscarPorCedula(){
		def usuarioInstance = Usuario.findAllByCedula(params.cedula)
		if (!usuarioInstance) {
			render view:'show', model:[cedula:params.cedula]
			return
		}
		redirect action: 'show', id: usuarioInstance.id
	}
	@Secured(['ROLE_USER'])
	def cambiarPassword(){
		def usuarioInstance = currentUser()
		if(usuarioInstance.getPassword().equals(springSecurityService.encodePassword(params.oldPassword))){
			if(params.newPassword.equals(params.confirmNewPassword)){
				usuarioInstance.setPassword(params.newPassword)
				if (!usuarioInstance.save(flush: true)) {
					render view: '', model: [usuarioInstance: usuarioInstance]
					return
				}
				flash.message = message(code: 'default.updated.message.password')
				redirect action: 'perfilUsuario'
				return
			}
		}
		flash.message = message(code: 'default.not.updated.message.password')
		redirect action: 'perfilUsuario'
	}
	@Secured(['ROLE_USER'])
	def cancelarCita() {
		def citaInstance = Cita.get(params.id)
		def usuarioInstance = currentUser()
        if (!usuarioInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'usuario.label', default: 'Usuario'), params.id])
            redirect action: 'list'
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (usuarioInstance.version > version) {
                usuarioInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
                          [message(code: 'usuario.label', default: 'Usuario')] as Object[],
                          "Another user has updated this Usuario while you were editing")
                redirect action: 'perfilUsuario'
                return
            }
        }
        usuarioInstance.properties = params
		usuarioInstance.citas.remove(citaInstance)
		usuarioInstance.citaSolicitada=true
        if (!usuarioInstance.save(flush: true)) {
			flash.message = "No fue posible cancelar la cita, por favor intente de nuevo"
            redirect action: 'perfilUsuario'
            return
        }
		flash.message = "Su cita ha sido cancelada, recuerde que tiene una solicitud de cita pendiente. No olvide separarla nuevamente"
        redirect action: 'perfilUsuario'
		return
	}
	
}
