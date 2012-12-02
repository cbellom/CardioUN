
<%@ page import="tpicardio.Rutina" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'rutina.label', default: 'Rutina')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span3">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<li class="active">
							<g:link class="list" action="list">
								<i class="icon-list icon-white"></i>
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
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="grupo" title="${message(code: 'rutina.grupo.label', default: 'Grupo')}" />
						
							<g:sortableColumn property="objetivo" title="${message(code: 'rutina.objetivo.label', default: 'Objetivo')}" />
						
							<g:sortableColumn property="caracteristicas" title="${message(code: 'rutina.caracteristicas.label', default: 'Caracteristicas')}" />
						
							<g:sortableColumn property="periodo" title="${message(code: 'rutina.periodo.label', default: 'Periodo')}" />
						
							<g:sortableColumn property="frecuenciaSemanal" title="${message(code: 'rutina.frecuenciaSemanal.label', default: 'Frecuencia Semanal')}" />
						
							<g:sortableColumn property="duracionSesion" title="${message(code: 'rutina.duracionSesion.label', default: 'Duracion Sesion')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${rutinaInstanceList}" var="rutinaInstance">
						<tr>
						
							<td>${fieldValue(bean: rutinaInstance, field: "grupo")}</td>
						
							<td>${fieldValue(bean: rutinaInstance, field: "objetivo")}</td>
						
							<td>${fieldValue(bean: rutinaInstance, field: "caracteristicas")}</td>
						
							<td>${fieldValue(bean: rutinaInstance, field: "periodo")}</td>
						
							<td>${fieldValue(bean: rutinaInstance, field: "frecuenciaSemanal")}</td>
						
							<td>${fieldValue(bean: rutinaInstance, field: "duracionSesion")}</td>
						
							<td class="link">
								<g:link action="show" id="${rutinaInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${rutinaInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
