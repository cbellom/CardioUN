package tpicardio

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class TipController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']
	def springSecurityService
	def currentUser(){
		return User.get(springSecurityService.principal.id)
	}

    def index() {
        redirect action: 'list', params: params
    }
	
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tipInstanceList: Tip.list(params), tipInstanceTotal: Tip.count()]
    }
	@Secured(['ROLE_COACH'])
    def create() {
		switch (request.method) {
		case 'GET':
        	[tipInstance: new Tip(params)]
			break
		case 'POST':
	        def tipInstance = new Tip(params)
			def entrenadorInstance = currentUser()
			tipInstance.entrenador = entrenadorInstance
	        if (!tipInstance.save(flush: true)) {
	            render view: 'create', model: [tipInstance: tipInstance]
	            return
	        }

			flash.message = message(code: 'default.created.message', args: [message(code: 'tip.label', default: 'Tip'), tipInstance.id])
	        redirect controller:'entrenador', action: 'perfilEntrenador', id: tipInstance.id
			break
		}
    }
	@Secured(['ROLE_COACH','ROLE_ADMIN'])
    def show() {
        def tipInstance = Tip.get(params.id)
        if (!tipInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tip.label', default: 'Tip'), params.id])
            redirect action: 'list'
            return
        }

        [tipInstance: tipInstance]
    }
	@Secured(['ROLE_COACH','ROLE_ADMIN','ROLE_USER'])
	def buscarPorEntrenador(){
		def tipList = Tip.findAll()
		if (!tipList) {			
			render view:'list', model:[cedula:params.cedula, tipInstanceTotal: Tip.count()]
			return
		}
		def tipInstanceList = new ArrayList<Tip>()
		for(int i=0;i<tipList.size;i++){
			def aus = new Tip()
			aus = tipList.get(i)
			if(aus.entrenador.cedula==Integer.parseInt(params.cedula)){
				tipInstanceList.add(aus)
			}
		}
		render view:'list',  model:[tipInstanceList: tipInstanceList, cedula: params.cedula, tipInstanceTotal: Tip.count()]
	}
	@Secured(['ROLE_COACH'])
    def edit() {
		switch (request.method) {
		case 'GET':
	        def tipInstance = Tip.get(params.id)
	        if (!tipInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tip.label', default: 'Tip'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [tipInstance: tipInstance]
			break
		case 'POST':
	        def tipInstance = Tip.get(params.id)
	        if (!tipInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tip.label', default: 'Tip'), params.id])
	            redirect action: 'list'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (tipInstance.version > version) {
	                tipInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'tip.label', default: 'Tip')] as Object[],
	                          "Another user has updated this Tip while you were editing")
	                render view: 'edit', model: [tipInstance: tipInstance]
	                return
	            }
	        }

	        tipInstance.properties = params

	        if (!tipInstance.save(flush: true)) {
	            render view: 'edit', model: [tipInstance: tipInstance]
	            return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'tip.label', default: 'Tip'), tipInstance.id])
	        redirect controller:'entrenador', action: 'perfilEntrenador', id: tipInstance.id
			break
		}
    }
	@Secured(['ROLE_COACH'])
    def delete() {
        def tipInstance = Tip.get(params.id)
        if (!tipInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'tip.label', default: 'Tip'), params.id])
            redirect action: 'list'
            return
        }

        try {
            tipInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'tip.label', default: 'Tip'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tip.label', default: 'Tip'), params.id])
            redirect action: 'show', id: params.id
        }
    }
}
