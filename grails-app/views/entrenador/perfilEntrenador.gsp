
<%@ page import="tpicardio.Entrenador" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'entrenador.label', default: 'Entrenador')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>		
		
	</head>
	<body>
		<div class="row-fluid">			
			<div class="span3">
				<g:render template="/layouts/imagenPerfil"/>
			</div>
			<div class="span9">
				<div class="page-header">
					<h1>Mi Perfil</h1>
				</div>
				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				<div class="accordion" id="accordion1">
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#userList">
								Lista de Usuarios Registrados
							</a>													
						</div>		
						<g:render template="/layouts/listaDatosUsuario"/>			    
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion1" href="#pruebaList">
								Pruebas de Valoracion Registradas
							</a>													
						</div>		
						<g:render template="/layouts/listaPruebasUsuario"/>			    
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle " data-toggle="collapse" data-parent="#accordion1" href="#rutinaList">
								Lista de Rutinas
							</a>
						</div>	
						<g:render template="/layouts/listaRutina"/>			    
					</div>					
				</div>
				
				<div class="accordion" id="accordion2">					
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle " data-toggle="collapse" data-parent="#accordion2" href="#machineList">
								Lista de Maquinas Registrados
							</a>
						</div>	
						<g:render template="/layouts/listaDatosMaquina"/>			    
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle " data-toggle="collapse" data-parent="#accordion2" href="#estadoMaquinaList">
								Lista de Estados de Maquinas
							</a>
						</div>	
						<g:render template="/layouts/listaEstadosMaquina"/>			    
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle " data-toggle="collapse" data-parent="#accordion2" href="#tipoMaquinaList">
								Lista de Tipos de Maquinas
							</a>
						</div>	
						<g:render template="/layouts/listaTiposMaquina"/>			    
					</div>
				</div>
				
				<div class="accordion" id="accordion3">	
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle " data-toggle="collapse" data-parent="#accordion3" href="#tipList">
								Lista de Tips
							</a>
						</div>	
						<g:render template="/layouts/listaDatosTip"/>			    
					</div>					
				</div>	
				<a class="btn" data-toggle="modal" href="#myModalData"><i class="icon-user"></i> Mis datos</a>	
				<a class="btn" data-toggle="modal" href="#myModalPassword"><i class="icon-lock"></i> Cambiar mi Contraseña</a>									
			</div>
		</div>
		<div id="myModalData" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none; ">
            <div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h3 id="myModalLabel">Mis datos personales</h3>
			</div>
			<div class="modal-body">
				<g:render template="/layouts/formularioDatos"/>
			</div>
			<div class="modal-footer">
				<button class="btn" data-dismiss="modal">Cerrar</button>
				<g:link class="btn btn-inverse" action="edit" id="${entrenadorInstance?.id}">
					<i class="icon-pencil icon-white"></i>
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
			</div>
		</div>	
		<g:form url="[action:'cambiarPassword',controller:'entrenador']" method='POST'>	
			<g:render template="/layouts/cambiarPassword"/>
		</g:form>
	</body>
</html>
