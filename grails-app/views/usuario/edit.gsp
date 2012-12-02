<%@ page import="tpicardio.Usuario" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'usuario.label', default: 'Usuario')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">

			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<p class="muted">Aca Puedes editar los datos basicos de un usuario</p>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<g:hasErrors bean="${usuarioInstance}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${usuarioInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<fieldset>
					<g:form class="form-horizontal" action="edit" id="${usuarioInstance?.id}" >
						<g:hiddenField name="version" value="${usuarioInstance?.version}" />
						<fieldset>							
							<div class="control-group ">
								<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cedula', 'error')} required">
									<label class="control-label" for="cedula">
										<g:message code="usuario.cedula.label" default="Cedula" />
									</label>
									<div class="controls">	
										<g:field name="cedula" type="number" value="${usuarioInstance.cedula}" required=""/>
									</div>
								</div>
							</div>							
							<div class="control-group ">
								<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'nombre', 'error')} required">
									<label class="control-label" for="nombre">
										<g:message code="usuario.nombre.label" default="Nombre" />
									</label>
									<div class="controls">	
										<g:textField name="nombre" maxlength="50" required="" value="${usuarioInstance?.nombre}"/>
									</div>
								</div>
							</div>
							<div class="control-group ">
								<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'apellido', 'error')} required">
									<label class="control-label" for="apellido">
										<g:message code="usuario.apellido.label" default="Apellido" />
									</label>
									<div class="controls">
										<g:textField name="apellido" maxlength="50" required="" value="${usuarioInstance?.apellido}"/>
									</div>
								</div>
							</div>
							<div class="control-group ">
								<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'edad', 'error')} required">
									<label class="control-label" for="edad">
										<g:message code="usuario.edad.label" default="Edad" />
									</label>
									<div class="controls">
										<g:field name="edad" type="number" min="10" max="100" value="${usuarioInstance.edad}" required=""/>
									</div>
								</div>
							</div>
							<div class="control-group ">
								<div class="fieldcontain ${hasErrors(bean:  usuarioInstance, field: 'genero', 'error')} ">
									<label  class="control-label" for="genero">
										<g:message code="usuario.genero.label" default="Genero" />										
									</label>
									<div class="controls">
										<g:select name="genero" from="${ usuarioInstance.constraints.genero.inList}" value="${ usuarioInstance?.genero}" valueMessagePrefix=" usuario.genero" noSelection="['': '']"/>
									</div>					
								</div>
							</div>
							<div class="control-group ">
								<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'citaSolicitada', 'error')} required">
									<label class="control-label" for="citaSolicitada">
										<g:message code="usuario.citaSolicitada.label" default="Cita Solicitada" />
									</label>
									<div class="controls">	
										<g:checkBox name="citaSolicitada" value="${usuarioInstance?.citaSolicitada }"/>
									</div>
								</div>
							</div>
						
							<div class="form-actions">
								<button type="submit" class="btn btn-inverse">
									<i class="icon-ok icon-white"></i>
									<g:message code="default.button.update.label" default="Update" />
								</button>
							</div>
						</fieldset>
					</g:form>
				</fieldset>

			</div>

		</div>
	</body>
</html>
