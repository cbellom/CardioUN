
<%@ page import="tpicardio.Administrador" %>

<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">		
		<g:set var="entityName" value="${message(code: 'administrador.label', default: 'Administrador')}" />				
		<title><g:message code="default.show.label" args="[entityName]" /></title>			
				
	</head>
	<body>
		<div class="row-fluid">			
			<div class="span3">
				<div class="well">
					<li class="nav-header">						
						${entityName} (<sec:username/>)		
					</li> 
				</div>
			</div>
			<div class="span9">
				<div class="page-header">
					<h1>Mi Perfil</h1>
				</div>
				<g:if test="${flash.message}">
					<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				<div class="accordion" id="accordion">
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion" href="#userList">Lista de Usuarios Registrados</a>													
						</div>		
						<g:render template="/layouts/listaDatosUsuario"/>			    
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle " data-toggle="collapse" data-parent="#accordion" href="#coachList">
							Lista de Entrenadores Registrados
							</a>
						</div>	
						<g:render template="/layouts/listaDatosEntrenador"/>			    
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle " data-toggle="collapse" data-parent="#accordion" href="#imageList">
							Lista de imagenes predeterminadas Perfil
							</a>
						</div>	
						<g:render template="/layouts/listaImagenesPerfil"/>			    
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle " data-toggle="collapse" data-parent="#accordion" href="#imageCarrouselList">
							Lista de imagenes de la pagina Inicio
							</a>
						</div>	
						<g:render template="/layouts/listaImagenesCarrousel"/>			    
					</div>
					<div class="accordion-group">
						<div class="accordion-heading">
							<a class="accordion-toggle " data-toggle="collapse" data-parent="#accordion" href="#cursosList">
							Lista de enlaces a cursos ofrecidos
							</a>
						</div>	
						<g:render template="/layouts/listaCursos"/>			    
					</div>
				</div>								
				<a class="btn" data-toggle="modal" href="#myModalData"><i class="icon-user"></i> Mis datos</a>	
				<a class="btn" data-toggle="modal" href="#myModalPassword"><i class="icon-lock"></i> Cambiar mi Contraseña</a>		
				<g:link controller="administrador" action="create" class="btn "><i class="icon-plus"></i> Crear Administrador </g:link>								
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
				<g:link class="btn btn-inverse" action="edit" id="${administradorInstance?.id}">
					<i class="icon-pencil icon-white"></i>
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
			</div>
		</div>
		<g:form url="[action:'cambiarPassword',controller:'administrador']" method='POST'>	
			<g:render template="/layouts/cambiarPassword"/>
		</g:form>		
	</body>
</html>
