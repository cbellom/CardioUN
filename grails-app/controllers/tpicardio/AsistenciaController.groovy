package tpicardio

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

class AsistenciaController {

    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

    def index() {
        redirect action: 'list', params: params
    }
	@Secured(['ROLE_COACH','ROLE_ADMIN'])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [asistenciaInstanceList: Asistencia.list(params), asistenciaInstanceTotal: Asistencia.count()]
    }	
	@Secured(['ROLE_COACH','ROLE_ADMIN'])
    def create() { 
		switch (request.method) {
		case 'GET':
        	[asistenciaInstance: new Asistencia(params)]
			break
		case 'POST':
	        def asistenciaInstance = new Asistencia(params)
			def usuarioInstance = Usuario.findByCedula(params.cedula)
			params.max = Math.min(params.max ? params.int('max') : 10, 100)
			if (!usuarioInstance) {
				flash.message = "No se encuentra el usuario registrado con la cédula "+ params.cedula
		        render view: 'list', model: [asistenciaInstanceList: Asistencia.list(params), asistenciaInstanceTotal: Asistencia.count(),cedula:params.cedula]
		        return
			}else{	
				if(usuarioInstance.pruebaRealizada==false){
					flash.message = "El usuario con cedula "+ params.cedula+" tiene pendiente realizar la prueba de valoracion, por el momento no puede regitrar asistencia"
					render view: 'list', model: [asistenciaInstanceList: Asistencia.list(params), asistenciaInstanceTotal: Asistencia.count(),cedula:params.cedula]
					return
				}
				def lista = Asistencia.findAllByUsuario(usuarioInstance)	
				for(int i=0;i<lista.size;i++){
					def aus = lista.get(i)
					def fechaActual = new Date()
					if(aus.getFecha().date==fechaActual.date && aus.getFecha().month.value==fechaActual.month.value && aus.getFecha().year.value==fechaActual.year.value){
						flash.message = "El usuario con cédula "+ params.cedula +" ya fue registrada la asistencia del día de hoy"
						render view: 'list', model: [asistenciaInstanceList: Asistencia.list(params), asistenciaInstanceTotal: Asistencia.count(),cedula:params.cedula]
						return
					}
				}				
				asistenciaInstance.setFecha(new Date())	
				asistenciaInstance.setUsuario(usuarioInstance)
		        if (!asistenciaInstance.save(flush: true)) {
		            redirect action: 'list'
					return
		        }	
				flash.message = message(code: 'default.created.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), asistenciaInstance.id])
		        redirect action: 'list'
				break
			}
		}
    }
	@Secured(['ROLE_COACH','ROLE_ADMIN'])
    def show() {
        def asistenciaInstance = Asistencia.get(params.id)
        if (!asistenciaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), params.id])
            redirect action: 'list'
            return
        }

        [asistenciaInstance: asistenciaInstance]
    }
	@Secured(['ROLE_COACH','ROLE_ADMIN'])
    def edit() {
		switch (request.method) {
		case 'GET':
	        def asistenciaInstance = Asistencia.get(params.id)
	        if (!asistenciaInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [asistenciaInstance: asistenciaInstance]
			break
		case 'POST':
			def usuarioInstance = Usuario.findByCedula(params.cedula)
			params.max = Math.min(params.max ? params.int('max') : 10, 100)
			if (!usuarioInstance) {
				flash.message = "No se encuentra el usuario registrado con la cédula "+ params.cedula
		        render view: 'list', model: [asistenciaInstanceList: Asistencia.list(params), asistenciaInstanceTotal: Asistencia.count(),cedula:params.cedula]
		        return
			}else{
		        def lista = Asistencia.findAllByUsuario(usuarioInstance)
				if(lista.isEmpty()){
					flash.message = "No se encuantran asistencias registradas para el usuario con cedula "+ params.cedula 
					redirect action: 'list'
					return
				}else{
					for(int i=0;i<lista.size;i++){
						def aus = lista.get(i)
						def fechaActual = new Date()
						if(aus.getFecha().date==fechaActual.date && aus.getFecha().month.value==fechaActual.month.value && aus.getFecha().year.value==fechaActual.year.value){
							if (params.version) {
								def version = params.version.toLong()
								if (aus.version > version) {
									aus.errors.rejectValue('version', 'default.optimistic.locking.failure',
									[message(code: 'asistencia.label', default: 'Asistencia')] as Object[],
									"Another user has updated this Asistencia while you were editing")
									redirect action: 'list'
									return
								}
							}
							aus.properties = params
							if (!aus.save(flush: true)) {
								flash.message = message(code: 'default.not.update.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), aus.id])
								redirect action: 'list'
							    return
							}
							flash.message = message(code: 'default.updated.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), aus.id])
							redirect action: 'list'
							return
						}
					}
				}
			}	       
		}
    }
	@Secured(['ROLE_COACH','ROLE_ADMIN'])
    def delete() {
        def asistenciaInstance = Asistencia.get(params.id)
        if (!asistenciaInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), params.id])
            redirect action: 'list'
            return
        }

        try {
            asistenciaInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), params.id])
            redirect action: 'list'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'asistencia.label', default: 'Asistencia'), params.id])
            redirect action: 'show', id: params.id
        }
    }
	@Secured(['ROLE_COACH'])
	def buscarPorFecha() {
		if(params.fechaBusqueda.equals("")){
			redirect action: 'list'
			return
		}
		def lista = Asistencia.list(params)
		def asistenciaInstanceList = new ArrayList<Asistencia>()
	
		for(int i=0;i<lista.size;i++){
			def aus = lista.get(i)
			if(aus.getFecha().date==Integer.parseInt(params.fechaBusqueda_day)){
				if(aus.getFecha().month.value+1==Integer.parseInt(params.fechaBusqueda_month)){
					if(aus.getFecha().year.value+1900==Integer.parseInt(params.fechaBusqueda_year)){
						asistenciaInstanceList.add(aus)
					}
				}
			}
		}
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		render view: 'list', model: [asistenciaInstanceList: asistenciaInstanceList, asistenciaInstanceTotal: Asistencia.count()]
	}
}
