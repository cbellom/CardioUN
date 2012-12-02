
<%@ page import="tpicardio.Tip" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'tip.label', default: 'Tip')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span4">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>
						<sec:ifAllGranted roles="ROLE_COACH">
						<g:form class="form-search" action="buscarPorEntrenador">
							<div class="input-append">	
								<div class="fieldcontain ${hasErrors(bean: entrenadorInstance, field: 'cedula', 'error')} required">
									<input class="input-medium search-query" name="cedula" type="number"  placeholder="Cédula Entrenador" value="${cedula}" required="" min="1000000" max="99999999999"/>									
									<button type="submit" class="btn"><i class="icon-search"></i> Buscar</button>	
								</div>															
							</div>
						</g:form>
						</sec:ifAllGranted>
					</ul>
				</div>
			</div>
								
			<div class="span8">
				
				<div class="page-header">
					<h1><g:message code="default.list.label" args="[entityName]" /></h1>
				</div>

				<g:if test="${flash.message}">
				<bootstrap:alert class="alert-info">${flash.message}</bootstrap:alert>
				</g:if>
				
				<table class="table table-striped">
					<thead>
						<tr>
							<g:sortableColumn property="nombre" title="${message(code: 'tip.nombre.label', default: 'Nombre')}" />
							<g:sortableColumn property="descripcion" title="${message(code: 'tip.descripcion.label', default: 'Descripcion')}" />
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${tipInstanceList}" var="tipInstance">
						<tr>
							<td>${fieldValue(bean: tipInstance, field: "nombre")}</td>
							<td>${tipInstance.descripcion}</td>	
							<sec:ifAllGranted roles="ROLE_COACH">
							<g:if test="${tipInstance?.entrenador.cedula == entrenadorInstance?.cedula}" >
								<td class="link">
									<g:link action="edit" id="${tipInstance.id}" class="btn btn-small">Editar &raquo;</g:link>
								</td>
							</g:if>
							</sec:ifAllGranted>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${tipInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
