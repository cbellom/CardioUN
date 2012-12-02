
<%@ page import="tpicardio.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
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
				<g:if test="${usuarioInstance?.citaSolicitada ==true}">
					<bootstrap:alert class="alert-error">Tiene una solictud de cita Pendiente, por favor registre una en el modulo "HORARIO"</bootstrap:alert>
				</g:if>
				<div class="accordion" id="accordion">
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#citaList">
								Mis Citas
							</a>													
						</div>		
						<g:render template="/layouts/listaCitasUsuario"/>			    
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#pruebaList">
								Mis Pruebas de Valoracion
							</a>													
						</div>		
						<g:render template="/layouts/listaPruebasUsuario"/>			    
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#rutinaInfo">
								Mi Rutina
							</a>													
						</div>		
						<g:render template="/usuario/rutinaInfo"/>			    
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
				<g:link class="btn btn-inverse" action="edit" id="${usuarioInstance?.id}">
					<i class="icon-pencil icon-white"></i>
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
			</div>
		</div>	
		<g:form url="[action:'cambiarPassword',controller:'usuario']" method='POST'>	
			<g:render template="/layouts/cambiarPassword"/>
		</g:form>
	</body>
</html>
