
<%@ page import="tpicardio.Rutina" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'rutina.label', default: 'Rutina')}" />
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
						<li>
							<g:link class="create" action="create">
								<i class="icon-plus"></i>
								<g:message code="default.create.label" args="[entityName]" />
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
				
					<g:if test="${rutinaInstance?.grupo}">
						<dt><g:message code="rutina.grupo.label" default="Grupo" /></dt>
						
							<dd><g:fieldValue bean="${rutinaInstance}" field="grupo"/></dd>
						
					</g:if>
				
					<g:if test="${rutinaInstance?.objetivo}">
						<dt><g:message code="rutina.objetivo.label" default="Objetivo" /></dt>
						
							<dd><g:fieldValue bean="${rutinaInstance}" field="objetivo"/></dd>
						
					</g:if>
				
					<g:if test="${rutinaInstance?.caracteristicas}">
						<dt><g:message code="rutina.caracteristicas.label" default="Caracteristicas" /></dt>
						
							<dd><g:fieldValue bean="${rutinaInstance}" field="caracteristicas"/></dd>
						
					</g:if>
				
					<g:if test="${rutinaInstance?.periodo}">
						<dt><g:message code="rutina.periodo.label" default="Periodo" /></dt>
						
							<dd><g:fieldValue bean="${rutinaInstance}" field="periodo"/></dd>
						
					</g:if>
				
					<g:if test="${rutinaInstance?.frecuenciaSemanal}">
						<dt><g:message code="rutina.frecuenciaSemanal.label" default="Frecuencia Semanal" /></dt>
						
							<dd><g:fieldValue bean="${rutinaInstance}" field="frecuenciaSemanal"/></dd>
						
					</g:if>
				
					<g:if test="${rutinaInstance?.duracionSesion}">
						<dt><g:message code="rutina.duracionSesion.label" default="Duracion Sesion" /></dt>
						
							<dd><g:fieldValue bean="${rutinaInstance}" field="duracionSesion"/></dd>
						
					</g:if>
				
					<g:if test="${rutinaInstance?.porcentajeFrecuenciaMax}">
						<dt><g:message code="rutina.porcentajeFrecuenciaMax.label" default="Porcentaje Frecuencia Max" /></dt>
						
							<dd><g:fieldValue bean="${rutinaInstance}" field="porcentajeFrecuenciaMax"/></dd>
						
					</g:if>
				
					<g:if test="${rutinaInstance?.metodo}">
						<dt><g:message code="rutina.metodo.label" default="Metodo" /></dt>
						
							<dd>${rutinaInstance?.metodo}</dd>
						
					</g:if>
				
					<g:if test="${rutinaInstance?.usuario}">
						<dt><g:message code="rutina.usuario.label" default="Usuario" /></dt>
						
							<dd><g:link controller="usuario" action="show" id="${rutinaInstance?.usuario?.id}">${rutinaInstance?.usuario?.encodeAsHTML()}</g:link></dd>
						
					</g:if>
				
				</dl>

				<g:form>
					<g:hiddenField name="id" value="${rutinaInstance?.id}" />
					<div class="form-actions">
						<g:link class="btn" action="edit" id="${rutinaInstance?.id}">
							<i class="icon-pencil"></i>
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
