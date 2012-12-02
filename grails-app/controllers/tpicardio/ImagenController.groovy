package tpicardio

import org.springframework.dao.DataIntegrityViolationException
import org.springframework.web.multipart.commons.CommonsMultipartFile
import grails.plugins.springsecurity.Secured

class ImagenController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']
	def springSecurityService
	
	def currentUser(){
		return User.get(springSecurityService.principal.id)
	}
	
    def index() {
        redirect action: 'list', params: params
    }
	
	@Secured(['ROLE_ADMIN'])
    def list() {		
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [imagenInstanceList: Imagen.list(params), imagenInstanceTotal: Imagen.count()]
    }
	
	@Secured(['ROLE_ADMIN'])
    def create() {
		switch (request.method) {
		case 'GET':
        	[imagenInstance: new Imagen(params)]
			break
		case 'POST':
	        def imagenInstance = new Imagen(params)
	        if (!imagenInstance.save(flush: true)) {
	            render view: 'create', model: [imagenInstance: imagenInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'imagen.label', default: 'Imagen'), imagenInstance.id])
	        redirect action: 'show', id: imagenInstance.id
			break
		}
    }
	
    def show() {
		def imagen = Imagen.get(params.id)
		log.debug "Mostrando imagen ${imagen?.nombre}"
		response.setHeader("Content-disposition", "attachment; filename=${imagen?.nombre}")
		response.contentType = imagen?.tipoContenido
		byte[] archivo = imagen?.archivo
		response.contentLength = imagen?.tamano
		response.outputStream << imagen.archivo        
    }
	
	@Secured(['ROLE_ADMIN'])
    def edit() {
		switch (request.method) {
		case 'GET':
	        def imagenInstance = Imagen.get(params.id)
	        if (!imagenInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagen.label', default: 'Imagen'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [imagenInstance: imagenInstance]
			break
		case 'POST':
	        def imagenInstance = Imagen.get(params.id)
	        if (!imagenInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagen.label', default: 'Imagen'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (imagenInstance.version > version) {
	                imagenInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'imagen.label', default: 'Imagen')] as Object[],
	                          "Another user has updated this Imagen while you were editing")
	                render view: 'edit', model: [imagenInstance: imagenInstance]
	                return
	            }
	        }

	        imagenInstance.properties = params

	        if (!imagenInstance.save(flush: true)) {
	            render view: 'edit', model: [imagenInstance: imagenInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'imagen.label', default: 'Imagen'), imagenInstance.id])
	        redirect action: 'show', id: imagenInstance.id
			break
		}
    }
	
	@Secured(['ROLE_ADMIN'])
    def delete() {
        def imagenInstance = Imagen.get(params.id)
        if (!imagenInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'imagen.label', default: 'Imagen'), params.id])
            redirect controller:'administrador',action: 'perfilAdministrador'
            return
        }

        try {
            imagenInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'imagen.label', default: 'Imagen'), params.id])
            redirect controller:'administrador',action: 'perfilAdministrador'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'imagen.label', default: 'Imagen'), params.id])
            redirect controller:'administrador',action: 'perfilAdministrador'
        }
    }	
	
	@Secured(['ROLE_ADMIN'])
	def uploadImageDefaultProfile = {
		def f = request.getFile('myFile')
		def userInstance = currentUser()
		if (!f.empty) {
				def imagenInstance = new Imagen(nombre : f.originalFilename,tipoContenido : f.contentType,tamano : f.size,archivo : f.bytes, tipoPerfil:true).save()
				if (!imagenInstance.save(flush: true)) {
					flash.message = "No ha sido podible a crear la imagen"
					redirect controller:'administrador', action:'perfilAdministrador'
					return
				}
				flash.message = message(code: 'default.created.message', args: [message(code: 'imagen.label', default: 'Imagen'), imagenInstance.id])
		        redirect controller:'administrador', action:'perfilAdministrador'
				return
		} else {
			flash.message =  message(code: 'default.not.empty.message.file')
			redirect controller:'administrador', action:'perfilAdministrador'
			return
		}
		
	}
	@Secured(['ROLE_USER','ROLE_COACH'])
	def uploadImage = {
		def f = request.getFile('myFile')
		def userInstance = currentUser()
		if (!f.empty) {
			def imagen = userInstance.getImagen()
			if(imagen==null || imagen.tipoPerfil==true){
				imagen = new Imagen(nombre : f.originalFilename,tipoContenido : f.contentType,tamano : f.size,archivo : f.bytes, tipoPerfil:false).save()
			}else{
				imagen.setNombre(f.originalFilename)
				imagen.setTipoContenido(f.contentType)
				imagen.setTamano(f.size)
				imagen.setArchivo(f.bytes)
			}
			userInstance.setImagen(imagen)			
			if (!userInstance.save(flush: true)) {
				flash.message = message(code: 'default.not.updated.message.image.profile')
			}
			flash.message = message(code: 'default.updated.message.image.profile')
		} else {
			flash.message =  message(code: 'default.not.empty.message.file')			
		}
		
		def userUserRole = UserUserRole.findByUser(userInstance)
		if(userUserRole.getUserRole().getAuthority().equals("ROLE_USER")){
			redirect controller:'usuario', action:'perfilUsuario'
		}else if(userUserRole.getUserRole().getAuthority().equals("ROLE_COACH")){
			redirect controller:'entrenador', action:'perfilEntrenador'
		}	
	}
	
	def showImagen = {
		def imagen = currentUser().getImagen()
		log.debug "Mostrando imagen ${imagen?.nombre}"
		response.setHeader("Content-disposition", "attachment; filename=${imagen?.nombre}")
		response.contentType = imagen?.tipoContenido
		byte[] archivo = imagen?.archivo
		response.contentLength = imagen?.tamano
		response.outputStream << imagen.archivo
	}
	
	def showImagenUser = {
		def imagen = User.get(params.id).getImagen()
		log.debug "Mostrando imagen ${imagen?.nombre}"
		response.setHeader("Content-disposition", "attachment; filename=${imagen?.nombre}")
		response.contentType = imagen?.tipoContenido
		byte[] archivo = imagen?.archivo
		response.contentLength = imagen?.tamano
		response.outputStream << imagen.archivo
	}
	
	def showImagenEjercicio = {
		def imagen = Ejercicio.get(params.id).getImagen() 
		log.debug "Mostrando imagen ${imagen?.nombre}"
		response.setHeader("Content-disposition", "attachment; filename=${imagen?.nombre}")
		response.contentType = imagen?.tipoContenido
		byte[] archivo = imagen?.archivo
		response.contentLength = imagen?.tamano
		response.outputStream << imagen.archivo
	}
		
	def showImagenMaquina = {
		def imagen = Maquina.get(params.id).getImagen()
		log.debug "Mostrando imagen ${imagen?.nombre}"
		response.setHeader("Content-disposition", "attachment; filename=${imagen?.nombre}")
		response.contentType = imagen?.tipoContenido
		byte[] archivo = imagen?.archivo
		response.contentLength = imagen?.tamano
		response.outputStream << imagen.archivo
	}
	
}
