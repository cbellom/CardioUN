
<%@ page import="tpicardio.Imagen" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'imagen.label', default: 'Imagen')}" />
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
						
							<g:sortableColumn property="nombre" title="${message(code: 'imagen.nombre.label', default: 'Nombre')}" />
						
							<g:sortableColumn property="tipoContenido" title="${message(code: 'imagen.tipoContenido.label', default: 'Tipo Contenido')}" />
						
							<g:sortableColumn property="tamano" title="${message(code: 'imagen.tamano.label', default: 'Tamano')}" />
												
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${imagenInstanceList}" var="imagenInstance">
						<tr>
						
							<td>${fieldValue(bean: imagenInstance, field: "nombre")}</td>
						
							<td>${fieldValue(bean: imagenInstance, field: "tipoContenido")}</td>
						
							<td>${fieldValue(bean: imagenInstance, field: "tamano")}</td>
						
							<td class="link">
								<g:link action="show" id="${imagenInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${imagenInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
