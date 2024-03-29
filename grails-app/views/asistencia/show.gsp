
<%@ page import="tpicardio.Asistencia" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'asistencia.label', default: 'Asistencia')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li>
							<g:link class="list" action="list">
								<i class="icon-list"></i>
								<g:message code="default.list.label" args="[entityName]" />
							</g:link>
						</li>
					</ul>
				</div>
			</div>
			
			<div class="span9">

				<div class="page-header">
					<h1><g:message code="default.show.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>

				<dl>
				
					<g:if test="${asistenciaInstance?.fecha}">
						<dt><g:message code="asistencia.fecha.label" default="Fecha" /></dt>
						
							<dd><g:formatDate date="${asistenciaInstance?.fecha}" /></dd>
						
					</g:if>
				
					<g:if test="${asistenciaInstance?.usuario}">
						<dt><g:message code="asistencia.usuario.label" default="Usuario" /></dt>
						
							<dd><g:link controller="usuario" action="show" id="${asistenciaInstance?.usuario?.id}">${asistenciaInstance?.usuario?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${asistenciaInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn btn-inverse" action="edit" id="${asistenciaInstance?.id}">
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
