package tpicardio

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class RutinaController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }
	@Secured(['ROLE_COACH'])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [rutinaInstanceList: Rutina.list(params), rutinaInstanceTotal: Rutina.count()]
    }
	@Secured(['ROLE_COACH'])
    def create() {
		switch (request.method) {
		case 'GET':
        	[rutinaInstance: new Rutina(params)]
			break
		case 'POST':
	        def rutinaInstance = new Rutina(params)
			def usuario = Usuario.findByCedula(params.cedula)
			if (!usuario) {
				flash.message = "No se encuentra un usuario registrado con la cédula "+ params.cedula
				render view: 'create',  model: [pruebaValoracionInstance: pruebaValoracionInstance, cedula:params.cedula]
				return
			}
			rutinaInstance.usuario = usuario
	        if (!rutinaInstance.save(flush: true)) {
	            render view: 'create', model: [rutinaInstance: rutinaInstance]
	            return
	        }

			try {
				sendMail {
					to  "${usuario.correo}"
					subject "BuoCardio: Nueva Rutina"
					html    g.render(template:'/enviarCorreo/nuevaRutina', model:[usuario:usuario,rutinaInstance:rutinaInstance])
				}
				flash.message = "Confirmation email sent to ${usuario.correo}"
			} catch(Exception e) {
				log.error "Problem sending email $e.message", e
				flash.message = "Confirmation email NOT sent"
			}
			
			flash.message = message(code: 'default.created.message', args: [message(code: 'rutina.label', default: 'Rutina'), rutinaInstance.id])
	        redirect action: 'show', id: rutinaInstance.id
			break
		}
    }
	@Secured(['ROLE_COACH','ROLE_ADMIN','ROLE_USER'])
    def show() {
        def rutinaInstance = Rutina.get(params.id)
        if (!rutinaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'rutina.label', default: 'Rutina'), params.id])
            redirect action: 'list'
            return
        }

        [rutinaInstance: rutinaInstance]
    }
	@Secured(['ROLE_COACH'])
    def edit() {
		switch (request.method) {
		case 'GET':
	        def rutinaInstance = Rutina.get(params.id)
	        if (!rutinaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rutina.label', default: 'Rutina'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [rutinaInstance: rutinaInstance]
			break
		case 'POST':
	        def rutinaInstance = Rutina.get(params.id)
	        if (!rutinaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'rutina.label', default: 'Rutina'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (rutinaInstance.version > version) {
	                rutinaInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'rutina.label', default: 'Rutina')] as Object[],
	                          "Another user has updated this Rutina while you were editing")
	                render view: 'edit', model: [rutinaInstance: rutinaInstance]
	                return
	            }
	        }

	        rutinaInstance.properties = params

	        if (!rutinaInstance.save(flush: true)) {
	            render view: 'edit', model: [rutinaInstance: rutinaInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'rutina.label', default: 'Rutina'), rutinaInstance.id])
	        redirect action: 'show', id: rutinaInstance.id
			break
		}
    }
	@Secured(['ROLE_COACH'])
    def delete() {
        def rutinaInstance = Rutina.get(params.id)
        if (!rutinaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'rutina.label', default: 'Rutina'), params.id])
            redirect action: 'list'
            return
        }

        try {
            rutinaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'rutina.label', default: 'Rutina'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'rutina.label', default: 'Rutina'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
