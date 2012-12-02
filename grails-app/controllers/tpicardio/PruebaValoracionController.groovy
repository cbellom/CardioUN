package tpicardio

import java.text.SimpleDateFormat
import grails.plugins.springsecurity.Secured
import org.springframework.dao.DataIntegrityViolationException

class PruebaValoracionController {
	
	def springSecurityService
	
    static allowedMethods = [create: ['GET', 'POST'], edit: ['GET', 'POST'], delete: 'POST']

	def currentUser(){
		return User.get(springSecurityService.principal.id)
	}
	
    def index() {
        redirect action: 'list', params: params
    }
	@Secured(["ROLE_COACH"])
    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def listaPrimeraGrafica = new ArrayList()	
		def df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		def d;
		def listaPruebasValoracion = PruebaValoracion.list(params)
		for (int i = 0;i<listaPruebasValoracion.size();i++){
			d=new Hashtable();
			d.put("fecha", df.format(listaPruebasValoracion[i].fecha));
			d.put("peso", listaPruebasValoracion[i].peso);			
			d.put("imc", listaPruebasValoracion[i].imc);
			d.put("flexibilidad", listaPruebasValoracion[i].flexibilidad);
			d.put("porcentajeGrasa", listaPruebasValoracion[i].porcentajeGrasa);
			d.put("vo2", listaPruebasValoracion[i].vo2);			
			listaPrimeraGrafica.add(d)
		}	
		[	
			pruebaValoracionInstanceList: listaPrimeraGrafica,
			pruebaValoracionInstanceTotal: PruebaValoracion.count()
		]
    }
	@Secured(["ROLE_COACH","ROLE_USER","ROLE_ADMIN"])
	def estadistica(){
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		if (params.cedula==null) {
			flash.message = "Ingrese un numero de cedula de un usuario registrado en el sistema para mostrar la prueba realizada "
			render view: 'estadistica'
			return
		}
		def usuarioInstance = Usuario.findByCedula(params.cedula)
		if (!usuarioInstance) {
			flash.message = "No se encuentra un usuario registrado con la cédula "+ params.cedula
			render view: 'estadistica',  model: [cedula:params.cedula]
			return
		}
		def listaPrimeraGrafica = new ArrayList()
		def df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		def d;
		def listaPruebasValoracion = PruebaValoracion.findAllByUsuario(usuarioInstance)
		for (int i = 0;i<listaPruebasValoracion.size();i++){
			d=new Hashtable();
			d.put("fecha", df.format(listaPruebasValoracion[i].fecha));
			d.put("peso", listaPruebasValoracion[i].peso);
			d.put("imc", listaPruebasValoracion[i].imc);
			d.put("flexibilidad", listaPruebasValoracion[i].flexibilidad);
			d.put("porcentajeGrasa", listaPruebasValoracion[i].porcentajeGrasa);
			d.put("vo2", listaPruebasValoracion[i].vo2);
			listaPrimeraGrafica.add(d)
		}
		[
			pruebaValoracionInstanceList: listaPrimeraGrafica,
			pruebaValoracionInstanceTotal: PruebaValoracion.count()
		]
		[pruebaValoracionInstanceList: PruebaValoracion.list(params), cedula:params.cedula, usuarioInstance:usuarioInstance]	
	}
	@Secured(["ROLE_COACH"])
    def create() {
		switch (request.method) {
		case 'GET':
        	[pruebaValoracionInstance: new PruebaValoracion(params)]
			break
		case 'POST':	        
			def pruebaValoracionInstance = new PruebaValoracion(params)
			def usuario = Usuario.findByCedula(params.cedula)
			if (!usuario) {
				flash.message = "No se encuentra un usuario registrado con la cédula "+ params.cedula
				render view: 'create',  model: [pruebaValoracionInstance: pruebaValoracionInstance, cedula:params.cedula]
				return
			}
			if(usuario.pruebaRealizada==true){
				flash.message = "El usuario con cedula "+params.cedula+" ya presento la prueba"
				render view: 'create',  model: [pruebaValoracionInstance: pruebaValoracionInstance, cedula:params.cedula]
				return
			}
			usuario.pruebaRealizada=true
			pruebaValoracionInstance.usuario = usuario
			pruebaValoracionInstance.fecha = new Date()
			pruebaValoracionInstance.peso = new BigDecimal(params.peso)
			pruebaValoracionInstance.talla = new BigDecimal(params.talla)			
			pruebaValoracionInstance.porcentajeGrasa = Integer.parseInt(params.porcentajeGrasa)
			pruebaValoracionInstance.flexibilidad = new BigDecimal(params.flexibilidad)			
			def calculos = new CalculosPruebasService()
			def imc = calculos.imc(pruebaValoracionInstance.peso, pruebaValoracionInstance.talla)
			pruebaValoracionInstance.imc = imc
			def descripcionImc = calculos.clasificacionImc(imc)
			pruebaValoracionInstance.descripcionImc = descripcionImc
			def descripcionPorcentajeGrasa = calculos.porcentajeGraso(usuario.genero, Integer.parseInt(params.edad), pruebaValoracionInstance.porcentajeGrasa)
			pruebaValoracionInstance.descripcionPorcentajeGrasa = descripcionPorcentajeGrasa
			pruebaValoracionInstance.descripcionFlexibilidad = calculos.calificacionFlexibilidad(pruebaValoracionInstance.flexibilidad, usuario.genero)
			pruebaValoracionInstance.frecuenciaMax = calculos.frecuenciaMax(Integer.parseInt(params.edad))
			pruebaValoracionInstance.frecuenciaPrueba = calculos.frecuenciaPrueba(Integer.parseInt(params.latidos))
			def vo2 = calculos.calculoVo2(pruebaValoracionInstance.frecuenciaPrueba,usuario.genero)
			pruebaValoracionInstance.vo2 = vo2
			def descripcionVo2 = calculos.vo2Max(usuario.genero,Integer.parseInt(params.edad),vo2)
			pruebaValoracionInstance.descripcionVo2 = descripcionVo2
			pruebaValoracionInstance.grupo = calculos.grupo(descripcionVo2,descripcionImc,descripcionPorcentajeGrasa)
	        if (!pruebaValoracionInstance.save(flush: true)) {
	            render view: 'create', model: [pruebaValoracionInstance: pruebaValoracionInstance]
	            return
	        }
			flash.message = message(code: 'default.created.message', args: [message(code: 'pruebaValoracion.label', default: 'PruebaValoracion'), pruebaValoracionInstance.id])
	        redirect action: 'show', id: pruebaValoracionInstance.id
			break
		}
    }
	@Secured(['ROLE_COACH','ROLE_ADMIN','ROLE_USER'])
    def show() {
        def pruebaValoracionInstance = PruebaValoracion.get(params.id)
        if (!pruebaValoracionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pruebaValoracion.label', default: 'PruebaValoracion'), params.id])
            redirect action: 'list'
            return
        }

        [pruebaValoracionInstance: pruebaValoracionInstance]
    }
	@Secured(['ROLE_COACH'])
    def edit() {
		switch (request.method) {
		case 'GET':
	        def pruebaValoracionInstance = PruebaValoracion.get(params.id)
	        if (!pruebaValoracionInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pruebaValoracion.label', default: 'PruebaValoracion'), params.id])
	            redirect action: 'list'
	            return
	        }

	        [pruebaValoracionInstance: pruebaValoracionInstance, cedula:pruebaValoracionInstance.usuario.cedula]
			break
		case 'POST':
	        def pruebaValoracionInstance = PruebaValoracion.get(params.id)
			def usuario = Usuario.findByCedula(params.cedula)
			pruebaValoracionInstance.usuario = usuario
			pruebaValoracionInstance.fecha = new Date()
			pruebaValoracionInstance.peso = new BigDecimal(params.peso)
			pruebaValoracionInstance.talla = new BigDecimal(params.talla)
			pruebaValoracionInstance.porcentajeGrasa = Integer.parseInt(params.porcentajeGrasa)
			pruebaValoracionInstance.flexibilidad = new BigDecimal(params.flexibilidad)
			if (!usuario) {
				flash.message = "No se encuentra un usuario registrado con la cédula "+ params.cedula
				render view: 'edit',  model: [pruebaValoracionInstance: pruebaValoracionInstance, cedula:params.cedula]
				return
			}
			def calculos = new CalculosPruebasService()
			def imc = calculos.imc(pruebaValoracionInstance.peso, pruebaValoracionInstance.talla)
			pruebaValoracionInstance.imc = imc
			def descripcionImc = calculos.clasificacionImc(imc)
			pruebaValoracionInstance.descripcionImc = descripcionImc
			def descripcionPorcentajeGrasa = calculos.porcentajeGraso(usuario.genero, Integer.parseInt(params.edad), pruebaValoracionInstance.porcentajeGrasa)
			pruebaValoracionInstance.descripcionPorcentajeGrasa = descripcionPorcentajeGrasa
			pruebaValoracionInstance.descripcionFlexibilidad = calculos.calificacionFlexibilidad(pruebaValoracionInstance.flexibilidad, usuario.genero)
			pruebaValoracionInstance.frecuenciaMax = calculos.frecuenciaMax(Integer.parseInt(params.edad))
			pruebaValoracionInstance.frecuenciaPrueba = calculos.frecuenciaPrueba(Integer.parseInt(params.latidos))
			def vo2 = calculos.calculoVo2(150,usuario.genero)
			pruebaValoracionInstance.vo2 = vo2
			def descripcionVo2 = calculos.vo2Max(usuario.genero,Integer.parseInt(params.edad),vo2)
			pruebaValoracionInstance.descripcionVo2 = descripcionVo2
			pruebaValoracionInstance.grupo = calculos.grupo(descripcionVo2,descripcionImc,descripcionPorcentajeGrasa)
			
	        if (!pruebaValoracionInstance) {
	            flash.message = message(code: 'default.not.found.message', args: [message(code: 'pruebaValoracion.label', default: 'PruebaValoracion'), params.id])
	            redirect action: 'show'
	            return
	        }

	        if (params.version) {
	            def version = params.version.toLong()
	            if (pruebaValoracionInstance.version > version) {
	                pruebaValoracionInstance.errors.rejectValue('version', 'default.optimistic.locking.failure',
	                          [message(code: 'pruebaValoracion.label', default: 'PruebaValoracion')] as Object[],
	                          "Another user has updated this PruebaValoracion while you were editing")
	                render view: 'edit', model: [pruebaValoracionInstance: pruebaValoracionInstance]
	                return
	            }
	        }

	        pruebaValoracionInstance.properties = params

	        if (!pruebaValoracionInstance.save(flush: true)) {
	            render view: 'edit',  model: [pruebaValoracionInstance: pruebaValoracionInstance, cedula:params.cedula]
				return
	        }

			flash.message = message(code: 'default.updated.message', args: [message(code: 'pruebaValoracion.label', default: 'PruebaValoracion'), pruebaValoracionInstance.id])
	        redirect action: 'show', id: pruebaValoracionInstance.id
			break
		}
    }
	@Secured(["ROLE_COACH"])
    def delete() {
        def pruebaValoracionInstance = PruebaValoracion.get(params.id)
        if (!pruebaValoracionInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'pruebaValoracion.label', default: 'PruebaValoracion'), params.id])
            redirect action: 'list'
            return
        }

        try {
            pruebaValoracionInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'pruebaValoracion.label', default: 'PruebaValoracion'), params.id])
            render view: 'show'
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'pruebaValoracion.label', default: 'PruebaValoracion'), params.id])
            redirect action: 'show', id: params.id
        }
    }
	@Secured(["ROLE_COACH","ROLE_USER","ROLE_ADMIN"])
	def buscarPorUsuarioFecha(){
		def userUserRole = UserUserRole.findByUser(currentUser())
		def usuarioInstance = new Usuario()
		if(params.fechaBusqueda.equals("") || params.cedula==null ){
			flash.message = "Seleccione una fecha y/o cedula para iniciar la busqueda"
			render view: 'show'
			return
		}else if(userUserRole.getUserRole().getAuthority().equals("ROLE_USER")){
			usuarioInstance = currentUser()
		}else if(userUserRole.getUserRole().getAuthority().equals("ROLE_COACH") || userUserRole.getUserRole().getAuthority().equals("ROLE_ADMIN")){
			usuarioInstance = Usuario.findByCedula(params.cedula)
			if (!usuarioInstance) {
				flash.message = "No se encuentra al usuario registrado con la cedula "+ params.cedula
				render view: 'show',model: [cedula: params.cedula]
				return
			}
		}		
		def lista = PruebaValoracion.findAllByUsuario(usuarioInstance)	
		for(int i=0;i<lista.size;i++){
			def aus = lista.get(i)
			if(aus.getFecha().date==Integer.parseInt(params.fechaBusqueda_day)){
				if(aus.getFecha().month.value+1==Integer.parseInt(params.fechaBusqueda_month)){
					if(aus.getFecha().year.value+1900==Integer.parseInt(params.fechaBusqueda_year)){
						flash.message = ""
						render view: 'show',model: [pruebaValoracionInstance:aus,cedula: params.cedula]
						return
					}
				}
			}
		}
		flash.message = "No se encuentra ninguna prueba registrada con estas especificaciones"
		render view: 'show'
		return
	}
}
