
<%@ page import="tpicardio.Asistencia" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="bootstrap">
		<g:set var="entityName" value="${message(code: 'asistencia.label', default: 'Asistencia')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
		
	</head>
	<body>
		<div class="row-fluid">
			
			<div class="span4">
				<div class="well">
					<ul class="nav nav-list">
						<li class="nav-header">${entityName}</li>						
						<g:form class="form-horizontal" action="create" >
								<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cedula', 'error')} required">
									<label for="cedula">
										<p class="muted">Registra el ingreso de un usuario a las instalaciones del gimnasio</p>
									</label>
									<g:field name="cedula" type="number" value="${cedula}" placeholder="Cédula Usuario" required="" min="1000000" max="99999999999"/>
								</div><p></p>
							<button class="btn btn-inverse" type="submit"><i class="icon-plus icon-white"></i> Registrar</button>
						</g:form>					
					</ul>					
				</div>
				<div class="well">
					<ul class="nav nav-list">						
						<g:form class="form-horizontal" action="edit" method="POST">
								<div class="fieldcontain ${hasErrors(bean: usuarioInstance, field: 'cedula', 'error')} required">
									<label for="cedula">
										<p class="muted">Registra la percepcion de esfuerzo de un usuario sobre los ejercicios realizados en las instalaciones al finalizar la jornada</p>
									</label>
									<g:field name="cedula" type="number" value="${cedula}" placeholder="Cédula Usuario" required="" min="1000000" max="99999999999"/>
								</div><p></p>
								<div class="fieldcontain ${hasErrors(bean: asistenciaInstance, field: 'percepcionEsfuerzo', 'error')} required">
									<g:select name="percepcionEsfuerzo" from="${1..10}" required="" value="${fieldValue(bean: asistenciaInstance, field: 'percepcionEsfuerzo')}" valueMessagePrefix="asistenciaInstance.percepcionEsfuerzo" noSelection="['': '--Percepcion de Esfuerzo--']"/>
								</div><p></p>
							<button class="btn btn-inverse" type="submit"><i class="icon-ok icon-white"></i>Aceptar</button>
						</g:form>					
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
				
				<g:form class="form-search" action="buscarPorFecha">
				  <div class="input-prepend pull-right">	
				    <button type="submit" class="btn"><i class="icon-search"></i> Buscar</button>
				    <calendar:datePicker class="pull-right" name="fechaBusqueda" dateFormat="%Y-%m-%d"/>
				  </div>
				</g:form>				
				
				<table class="table table-striped">
					<thead>
						<tr>
						
							<g:sortableColumn property="fecha" title="${message(code: 'asistencia.fecha.label', default: 'Fecha')}" />
						
							<th class="header"><g:message code="asistencia.usuario.label" default="Usuario" /></th>
							
							<th class="header"><g:message code="asistencia.percepcionEsfuerzo" default="Percepcion de Esfuerzo" /></th>
							
							<th></th>
						</tr>
					</thead>
					<tbody>
					<g:each in="${asistenciaInstanceList}" var="asistenciaInstance">
						<tr>
						
							<td><g:formatDate date="${asistenciaInstance.fecha}" /></td>
						
							<td class="link">
								<g:link controller="usuario" action="show" id="${asistenciaInstance?.usuario?.id}">${asistenciaInstance?.usuario?.encodeAsHTML()}</g:link>
							</td>	
							
							<td>${fieldValue(bean: asistenciaInstance, field: "percepcionEsfuerzo")}</td>
						
							<td class="link">
								<g:form class="form-horizontal" action="delete" id="${asistenciaInstance?.id}" >
									<button type="submit" class="btn btn-danger" name="_action_delete" formnovalidate>
										<i class="icon-trash icon-white"></i>
										<g:message code="default.button.delete.label" default="Delete" />
									</button>
								</g:form>
							</td>
						</tr>
					</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<bootstrap:paginate total="${asistenciaInstanceTotal}" />
				</div>
			</div>

		</div>
	</body>
</html>
