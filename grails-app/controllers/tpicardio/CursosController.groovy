package tpicardio

import org.springframework.dao.DataIntegrityViolationException

class CursosController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [cursosInstanceList: Cursos.list(params), cursosInstanceTotal: Cursos.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[cursosInstance: new Cursos(params)]
			break
		case 'POST':
	        def cursosInstance = new Cursos(params)
	        if (!cursosInstance.save(flush: true)) {
				flash.mesagge = "No fue posible registrar la informacion del curso, por favor intente de nuevo"
	            redirect controller:'administrador', action:'perfilAdministrador'
				return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'cursos.label', default: 'Cursos'), cursosInstance.id])
	        redirect controller:'administrador', action:'perfilAdministrador'
			return
		}
    }

    def show() {
        def cursosInstance = Cursos.get(params.id)
        if (!cursosInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cursos.label', default: 'Cursos'), params.id])
            redirect action: 'list'
            return
        }

        [cursosInstance: cursosInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def cursosInstance = Cursos.get(params.id)
	        if (!cursosInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cursos.label', default: 'Cursos'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [cursosInstance: cursosInstance]
			break
		case 'POST':
	        def cursosInstance = Cursos.get(params.id)
	        if (!cursosInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cursos.label', default: 'Cursos'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (cursosInstance.version > version) {
	                cursosInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'cursos.label', default: 'Cursos')] as Object[],
	                          "Another user has updated this Cursos while you were editing")
	                render view: 'edit', model: [cursosInstance: cursosInstance]
	                return
	            }
	        }

	        cursosInstance.properties = params

	        if (!cursosInstance.save(flush: true)) {
	            render view: 'edit', model: [cursosInstance: cursosInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'cursos.label', default: 'Cursos'), cursosInstance.id])
	        redirect action: 'show', id: cursosInstance.id
			break
		}
    }

    def delete() {
        def cursosInstance = Cursos.get(params.id)
        if (!cursosInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'cursos.label', default: 'Cursos'), params.id])
            redirect controller:'administrador', action:'perfilAdministrador'
			return
        }

        try {
            cursosInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'cursos.label', default: 'Cursos'), params.id])
            redirect controller:'administrador', action:'perfilAdministrador'
			return
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cursos.label', default: 'Cursos'), params.id])
            redirect controller:'administrador', action:'perfilAdministrador'
			return
        }
    }
}
