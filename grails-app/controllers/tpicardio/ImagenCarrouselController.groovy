package tpicardio

import org.springframework.dao.DataIntegrityViolationException

class ImagenCarrouselController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [imagenCarrouselInstanceList: ImagenCarrousel.list(params), imagenCarrouselInstanceTotal: ImagenCarrousel.count()]
    }

    def create() {
		switch (request.method) {
		case 'GET':
        	[imagenCarrouselInstance: new ImagenCarrousel(params)]
			break
		case 'POST':
	        def imagenCarrouselInstance = new ImagenCarrousel(params)
			def f = request.getFile('myFile')
			if (!f.empty) {
				def imagen = new Imagen()
				imagen.setNombre(f.originalFilename)
				imagen.setTipoContenido(f.contentType)
				imagen.setTamano(f.size)
				imagen.setArchivo(f.bytes)
				imagen.save()
				imagenCarrouselInstance.setImagen(imagen)
				if (!imagenCarrouselInstance.save(flush: true)) {
			            redirect controller:'administrador', action:'perfilAdministrador'
				return
		        }
				flash.message = message(code: 'default.created.message', args: [message(code: 'imagenCarrousel.label', default: 'ImagenCarrousel'), imagenCarrouselInstance.id])
		        redirect controller:'administrador', action:'perfilAdministrador'
				return
			} else {
				flash.message =  message(code: 'default.not.empty.message.file')
				redirect controller:'administrador', action:'perfilAdministrador'
				return
			}
	        

			
		}
    }

    def show() {
        def imagenCarrouselInstance = ImagenCarrousel.get(params.id)
        if (!imagenCarrouselInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagenCarrousel.label', default: 'ImagenCarrousel'), params.id])
            redirect action: 'list'
            return
        }

        [imagenCarrouselInstance: imagenCarrouselInstance]
    }

    def edit() {
		switch (request.method) {
		case 'GET':
	        def imagenCarrouselInstance = ImagenCarrousel.get(params.id)
	        if (!imagenCarrouselInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagenCarrousel.label', default: 'ImagenCarrousel'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [imagenCarrouselInstance: imagenCarrouselInstance]
			break
		case 'POST':
	        def imagenCarrouselInstance = ImagenCarrousel.get(params.id)
	        if (!imagenCarrouselInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagenCarrousel.label', default: 'ImagenCarrousel'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (imagenCarrouselInstance.version > version) {
	                imagenCarrouselInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'imagenCarrousel.label', default: 'ImagenCarrousel')] as Object[],
	                          "Another user has updated this ImagenCarrousel while you were editing")
	                render view: 'edit', model: [imagenCarrouselInstance: imagenCarrouselInstance]
	                return
	            }
	        }

	        imagenCarrouselInstance.properties = params

	        if (!imagenCarrouselInstance.save(flush: true)) {
	            render view: 'edit', model: [imagenCarrouselInstance: imagenCarrouselInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'imagenCarrousel.label', default: 'ImagenCarrousel'), imagenCarrouselInstance.id])
	        redirect action: 'show', id: imagenCarrouselInstance.id
			break
		}
    }

    def delete() {
        def imagenCarrouselInstance = ImagenCarrousel.get(params.id)
        if (!imagenCarrouselInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagenCarrousel.label', default: 'ImagenCarrousel'), params.id])
            redirect action: 'list'
            return
        }

        try {
            imagenCarrouselInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'imagenCarrousel.label', default: 'ImagenCarrousel'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'imagenCarrousel.label', default: 'ImagenCarrousel'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
