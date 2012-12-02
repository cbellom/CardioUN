package tpicardio

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import org.springframework.web.multipart.commons.CommonsMultipartFile

class MaquinaController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']
	def springSecurityService
    def index() {
        redirect action: 'list', params: params
    }
	
	def currentUser(){
		return User.get(springSecurityService.principal.id)
	}
    def list() {
		def listaMaquina = Maquina.list(params)
		def listaMaquinaTipo = new ArrayList<ArrayList<Maquina>>()
		for(int i=0;i<listaMaquina.size;i++){
			if(listaMaquinaTipo.isEmpty()){
				def lista = new ArrayList<Maquina>()
				lista.add(listaMaquina.get(i))
				listaMaquinaTipo.add(lista)
			}else{
				for(int j=0;j<listaMaquinaTipo.size;j++){	
					if(!listaMaquina.get(i).tipo.equals(listaMaquinaTipo.get(j).get(0).tipo) && j==listaMaquinaTipo.size-1){
						def lista = new ArrayList<Maquina>()
						lista.add(listaMaquina.get(i))
						listaMaquinaTipo.add(lista)
						j++
					}else if(listaMaquina.get(i).tipo==listaMaquinaTipo.get(j).get(0).tipo){
						listaMaquinaTipo.get(j).add(listaMaquina.get(i))						
					}
				}
			}
		}
		int capacidad = Maquina.findAllByEstado(Maquina.estado_funcionando).size()
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def maquinaInstance = Maquina.get(params.id)		
        [maquinaInstance: maquinaInstance,maquinaInstanceList: Maquina.list(params), maquinaInstanceTotal: Maquina.count(),listaMaquinaTipo:listaMaquinaTipo, capacidad:capacidad ]
    }
	@Secured(["ROLE_COACH"])
    def create() {
		switch (request.method) {
		case 'GET':
        	[maquinaInstance: new Maquina(params)]
			break
		case 'POST':
	        def maquinaInstance = new Maquina(params)	
			def entrenadorInstance = currentUser()
			maquinaInstance.entrenador = entrenadorInstance		
			def f = request.getFile('myFile')
			if (!f.empty) {		
				def imagen = new Imagen()
				imagen.setNombre(f.originalFilename)
				imagen.setTipoContenido(f.contentType)
				imagen.setTamano(f.size)
				imagen.setArchivo(f.bytes)
				imagen.save()
				maquinaInstance.setImagen(imagen)
				if (!maquinaInstance.save(flush: true)) {
		            render view: 'create', model: [maquinaInstance: maquinaInstance]
		            return
		        }
				flash.message = message(code: 'default.created.message', args: [message(code: 'maquina.label', default: 'Maquina'), maquinaInstance.id])
		        redirect action: 'list', id: maquinaInstance.id
				break
			} else {
				flash.message =  message(code: 'default.not.empty.message.file')
				render view: 'create', model: [maquinaInstance: maquinaInstance]
				return
			}
		}
    }
	@Secured(["ROLE_COACH"])
    def show() {
        def maquinaInstance = Maquina.get(params.id)
        if (!maquinaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'maquina.label', default: 'Maquina'), params.id])
            redirect action: 'list'
            return
        }

        [maquinaInstance: maquinaInstance]
    }
	@Secured(["ROLE_COACH"])
    def edit() {
		switch (request.method) {
		case 'GET':
	        def maquinaInstance = Maquina.get(params.id)
	        if (!maquinaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'maquina.label', default: 'Maquina'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [maquinaInstance: maquinaInstance]
			break
		case 'POST':
	        def maquinaInstance = Maquina.get(params.id)
	        if (!maquinaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'maquina.label', default: 'Maquina'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (maquinaInstance.version > version) {
	                maquinaInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'maquina.label', default: 'Maquina')] as Object[],
	                          "Another user has updated this Maquina while you were editing")
	                render view: 'edit', model: [maquinaInstance: maquinaInstance]
	                return
	            }
	        }

	        maquinaInstance.properties = params

	        if (!maquinaInstance.save(flush: true)) {
	            render view: 'edit', model: [maquinaInstance: maquinaInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'maquina.label', default: 'Maquina'), maquinaInstance.id])
	        redirect action: 'show', id: maquinaInstance.id
			break
		}
    }
	@Secured(["ROLE_COACH"])
    def delete() {
        def maquinaInstance = Maquina.get(params.id)
        if (!maquinaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'maquina.label', default: 'Maquina'), params.id])
            redirect action: 'list'
            return
        }

        try {
            maquinaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'maquina.label', default: 'Maquina'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'maquina.label', default: 'Maquina'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
