
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
			
			<div class="span4">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<g:form class="form-search" action="buscarPorCedula">
							<div class="input-append">	
								<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'cedula', 'error')} required">
									<input class="input-medium search-query" name="cedula" type="number"  placeholder="Cédula" value="${cedula}" required=""/>									
									<button type="submit" class="btn"><i class="icon-search"></i> Buscar</button>	
								</div>															
							</div>
						</g:form>	
						<sec:ifAllGranted roles="ROLE_COACH">
							<li>
								<g:link class="create" action="create">
									<i class="icon-plus"></i>
									<g:message code="default.create.label" args="[entityName]" />
								</g:link>
							</li>
						</sec:ifAllGranted>
						<sec:ifAllGranted roles="ROLE_ADMIN">
							<li>
								<g:link class="create" action="create">
									<i class="icon-plus"></i>
									<g:message code="default.create.label" args="[entityName]" />
								</g:link>
							</li>
						</sec:ifAllGranted>
					</ul>
				</div>
			</div>
			
			<div class="span8">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>				
					<g:if test="${entrenadorInstance?.cedula}">
						<dt><g:message code="entrenador.cedula.label" default="Cedula" /></dt>						
							<dd><g:fieldValue bean="${entrenadorInstance}" field="cedula"/></dd>						
					</g:if>
				
					<g:if test="${entrenadorInstance?.nombre}">
						<dt><g:message code="entrenador.nombre.label" default="Nombre" /></dt>						
							<dd><g:fieldValue bean="${entrenadorInstance}" field="nombre"/></dd>						
					</g:if>
				
					<g:if test="${entrenadorInstance?.apellido}">
						<dt><g:message code="entrenador.apellido.label" default="Apellido" /></dt>						
							<dd><g:fieldValue bean="${entrenadorInstance}" field="apellido"/></dd>						
					</g:if>
				
					<g:if test="${entrenadorInstance?.correo}">
						<dt><g:message code="entrenador.correo.label" default="Correo" /></dt>						
							<dd><g:fieldValue bean="${entrenadorInstance}" field="correo"/></dd>						
					</g:if>
				
					<g:if test="${entrenadorInstance?.edad}">
						<dt><g:message code="entrenador.edad.label" default="Edad" /></dt>						
							<dd><g:fieldValue bean="${entrenadorInstance}" field="edad"/></dd>						
					</g:if>
				
					<g:if test="${entrenadorInstance?.campoLaboral}">
						<dt><g:message code="entrenador.campoLaboral.label" default="Campo Laboral" /></dt>						
							<dd><g:fieldValue bean="${entrenadorInstance}" field="campoLaboral"/></dd>						
					</g:if>
								
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${entrenadorInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn btn-inverse" action="edit" id="${entrenadorInstance?.id}">
							<i class="icon-pencil icon-white"></i>
							<g:message code="default.button.edit.label" default="Edit" />
						</g:link>
						<button class="btn btn-danger" type="submit" name="_action_delete">
							<i class="icon-trash icon-white"></i>
							<g:message code="default.button.delete.label" default="Delete" />
						</button>
					</div>
				</g:form>

			</div>

		</div>
	</body>
</html>
