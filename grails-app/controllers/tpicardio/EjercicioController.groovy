package tpicardio

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class EjercicioController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def ejercicioInstance = Ejercicio.get(params.id)		
        [ejercicioInstance: ejercicioInstance,ejercicioInstanceList: Ejercicio.list(params), ejercicioInstanceTotal: Ejercicio.count()]
    }
	@Secured(['ROLE_COACH'])
    def create() {
		switch (request.method) {
		case 'GET':
        	[ejercicioInstance: new Ejercicio(params)]
			break
		case 'POST':
	        def ejercicioInstance = new Ejercicio(params)	
					
			def f = request.getFile('myFile')
			if (!f.empty) {		
				def imagen = new Imagen()
				imagen.setNombre(f.originalFilename)
				imagen.setTipoContenido(f.contentType)
				imagen.setTamano(f.size)
				imagen.setArchivo(f.bytes)
				imagen.save()
				ejercicioInstance.setImagen(imagen)
				if (!ejercicioInstance.save(flush: true)) {
		            render view: 'create', model: [ejercicioInstance: ejercicioInstance]
		            return
		        }
				flash.message = message(code: 'default.created.message', args: [message(code: 'ejercicio.label', default: 'Ejercicio'), ejercicioInstance.id])
		        redirect action: 'show', id: ejercicioInstance.id
				break
			} else {
				flash.message =  message(code: 'default.not.empty.message.file')
				render view: 'create', model: [ejercicioInstance: ejercicioInstance]
				return
			}
		}
    }
	@Secured(['ROLE_COACH'])
    def show() {
        def ejercicioInstance = Ejercicio.get(params.id)
        if (!ejercicioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ejercicio.label', default: 'Ejercicio'), params.id])
            redirect action: 'list'
            return
        }

        [ejercicioInstance: ejercicioInstance]
    }
	@Secured(['ROLE_COACH'])
    def edit() {
		switch (request.method) {
		case 'GET':
	        def ejercicioInstance = Ejercicio.get(params.id)
	        if (!ejercicioInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ejercicio.label', default: 'Ejercicio'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [ejercicioInstance: ejercicioInstance]
			break
		case 'POST':
	        def ejercicioInstance = Ejercicio.get(params.id)
	        if (!ejercicioInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'ejercicio.label', default: 'Ejercicio'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (ejercicioInstance.version > version) {
	                ejercicioInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'ejercicio.label', default: 'Ejercicio')] as Object[],
	                          "Another user has updated this Ejercicio while you were editing")
	                render view: 'edit', model: [ejercicioInstance: ejercicioInstance]
	                return
	            }
	        }

	        ejercicioInstance.properties = params

	        if (!ejercicioInstance.save(flush: true)) {
	            render view: 'edit', model: [ejercicioInstance: ejercicioInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'ejercicio.label', default: 'Ejercicio'), ejercicioInstance.id])
	        redirect action: 'show', id: ejercicioInstance.id
			break
		}
    }
	@Secured(['ROLE_COACH'])
    def delete() {
        def ejercicioInstance = Ejercicio.get(params.id)
        if (!ejercicioInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'ejercicio.label', default: 'Ejercicio'), params.id])
            redirect action: 'list'
            return
        }

        try {
            ejercicioInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'ejercicio.label', default: 'Ejercicio'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'ejercicio.label', default: 'Ejercicio'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
