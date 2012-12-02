<%@ page import="tpicardio.Tip" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'tip.label', default: 'Tip')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">

			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>								
						<p class="muted">Aca puedes editar tanto el nombre como la descripcion del Tip seleccionado </p>
										
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

				<g:hasErrors bean="${tipInstance}">
				<bootstrap:alert class="alert-error">
				<ul>
					<g:eachError bean="${tipInstance}" var="error">
					<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
					</g:eachError>
				</ul>
				</bootstrap:alert>
				</g:hasErrors>

				<fieldset>
					<g:form class="form-horizontal" action="edit" id="${tipInstance?.id}" >
						<g:hiddenField name="version" value="${tipInstance?.version}" />
						<fieldset>
							<div class="control-group ">
								<div class="fieldcontain ${hasErrors(bean: tipInstance, field: 'nombre', 'error')}">
									<label class="control-label" for="nombre">
										<g:message code="tip.nombre.label" default="Nombre" />		
									</label>
									<div class="controls">
										<g:textField name="nombre" value="${tipInstance?.nombre}"/>
									</div>					
								</div>
							</div>	
							<div class="control-group ">
								<div class="fieldcontain ${hasErrors(bean: tipInstance, field: 'descripcion', 'error')} ">
									<label class="control-label" for="descripcion">
										<g:message code="tip.descripcion.label" default="Descripcion" />		
									</label>
									<div class="controls">
										<ckeditor:editor name="descripcion" toolbar="custom" >${tipInstance?.descripcion}</ckeditor:editor>
									</div>					
								</div>
							</div>
							<div class="form-actions">
								<button type="submit" class="btn btn-inverse">
									<i class="icon-ok icon-white"></i>
									<g:message code="default.button.update.label" default="Update" />
								</button>
								<button type="submit" class="btn btn-danger" name="_action_delete" formnovalidate>
									<i class="icon-trash icon-white"></i>
									<g:message code="default.button.delete.label" default="Delete" />
								</button>
							</div>
						</fieldset>
					</g:form>
				</fieldset>

			</div>

		</div>
	</body>
</html>
