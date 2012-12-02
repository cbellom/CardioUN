
<%@ page import="tpicardio.Ejercicio" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'ejercicio.label', default: 'Ejercicio')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<g:each in="${ejercicioInstanceList}" var="e">
							<g:if test="${e?.id == ejercicioInstance?.id}">
								<li class="active" >
									<a href="?id=${e.id}" id="${e.id}" class="">${fieldValue(bean: e, field: "nombre")}</a>
								</li>
							</g:if>
							<g:if test="${e?.id != ejercicioInstance?.id}">
								<li >
									<a href="?id=${e.id}" id="${e.id}" class="">${fieldValue(bean: e, field: "nombre")}</a>
								</li>
							</g:if>
						</g:each>	
						<sec:ifAllGranted roles="ROLE_COACH">
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
			
			<div class="span9">	
				<g:if test="${flash.message}">
					<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<g:hasErrors bean="${ejercicioInstance}">
					<bootstrap:alert class="alert-error">				
						<ul>
							<g:eachError bean="${ejercicioInstance}" var="error">
							<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
							</g:eachError>
						</ul>
					</bootstrap:alert>
				</g:hasErrors>		
				
				<div class="page-header">
					<h1>${entityName}</h1>
				</div>
				
				<g:if test="${ejercicioInstanceList.isEmpty()}">
					<p class="muted">Lo sentimos, por el momento no se encuentra ningún ejercicio registrado en el sistema.</p>
				</g:if>
				<g:if test="${ !ejercicioInstanceList.isEmpty() && ejercicioInstance==null}">
					<p class="muted">Seleccione uno de los ejercicios listados a la izquierda de la página para ver su información correspondiente.</p>
				</g:if>
				<g:render template="/ejercicio/infoEjercicio" />					
			</div>
		</div>
	</body>
</html>
