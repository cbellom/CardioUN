
<%@ page import="tpicardio.ImagenCarrousel" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'imagenCarrousel.label', default: 'ImagenCarrousel')}" />
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
						
							<g:sortableColumn property="descripcion" title="${message(code: 'imagenCarrousel.descripcion.label', default: 'Descripcion')}" />
						
							<th class="header"><g:message code="imagenCarrousel.imagen.label" default="Imagen" /></th>
						
							<g:sortableColumn property="titulo" title="${message(code: 'imagenCarrousel.titulo.label', default: 'Titulo')}" />
						
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${imagenCarrouselInstanceList}" var="imagenCarrouselInstance">
						<tr>
						
							<td>${fieldValue(bean: imagenCarrouselInstance, field: "descripcion")}</td>
						
							<td>${fieldValue(bean: imagenCarrouselInstance, field: "imagen")}</td>
						
							<td>${fieldValue(bean: imagenCarrouselInstance, field: "titulo")}</td>
						
							<td class="link">
								<g:link action="show" id="${imagenCarrouselInstance.id}" class="btn btn-small">Show &raquo;</g:link>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${imagenCarrouselInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
